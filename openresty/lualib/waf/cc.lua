local config = require "config"
local cc = config.cc
local ccdefend = {}
local str_sub = string.sub
local secret = cc.secret		-- cookies计算密钥
local js = cc.jsdefend		-- cookies计算密钥
local expired_time =  cc.expired_time		-- 内存字典过期时间
local cookie_exptime = 10	-- cookies过期时间
local ngx_md5 = ngx.md5
local access = ngx.shared.access  -- access 内存字典

-- 获取IP
local function getRealIp()
    local headers = ngx.req.get_headers()
    if not headers['x-forwarded-for'] then
        realIp = ngx.var.remote_addr or '127.0.0.1'
        return realIp
    end
    if type(headers['x-forwarded-for']) == "table" then
        realIp = headers['x-forwarded-for'][1]
    else
        realIp = headers['x-forwarded-for']
    end
    return realIp
end
local jscode_hex = [=[
<script>function %s(hex){var str='';var %s=%d;for(var i=0;(i<hex.length&&hex.substr(i, 2)!=='00');i+=2){str += String.fromCharCode(parseInt(hex.substr(i,2),16)%s%s);}return str;}window.location.href=%s("%s");</script>
]=]
local jscode_oct = [=[
<script>function %s(o){var p=o.split(' ');var %s=%d;var str='';for(var i=0;i<p.length;i++){if(p[i] != "")str += String.fromCharCode(parseInt(p[i],8)%s%s);}return str;}window.location.href=%s('%s');</script>
]=]

local function bin2oct(s,rand,opt)
    s = string.gsub(s,"(.)",function (x)  if opt == '-' then return string.format("%o ",string.byte(x)+rand) else return string.format("%o ",string.byte(x)-rand) end end)
    return s
end

local function bin2hex(s,rand,opt)
    s = string.gsub(s,"(.)",function (x) if opt == '+' then return string.format("%02X",string.byte(x)+rand) else return string.format("%02X",string.byte(x)-rand) end end)
    return s
end
local function rndLetter(num)
    local ret = ""
    pcall(function()
        for var = 1,num do
            if math.random()>0.5 then
                ret = ret..string.char(math.random(65,90))
            else
                ret = ret..string.char(math.random(97,122))
            end
        end
    end)
    return ret
end
local function make_js_code(url)
    local req_msec = ngx.re.sub(ngx.var.msec,"\\.","")
    math.randomseed(req_msec:reverse():sub(1, 7))
    local rndVar = rndLetter(3)
    local rndFun = rndLetter(4)
    local rand  = math.random(1,100)
    local fmod  = tonumber(req_msec)%10
    local opt   = ""
    local js_opt= ""
    if fmod%2 == 0 then 
        opt = "+" 
        js_opt = "-"
        return string.format(jscode_hex,rndFun,rndVar,rand,js_opt,rndVar,rndFun,bin2hex(url,rand,opt))
    else 
        opt = '-' 
        js_opt = "-"
        return string.format(jscode_oct,rndFun,rndVar,rand,js_opt,rndVar,rndFun,bin2oct(url,rand,opt))
    end
end
-- 设置用户访问标记
local function set_uid()
    local ip = getRealIp()
    local host = ngx.var.http_host
    local url = ngx.var.uri
    local scheme = ngx.var.scheme
    local user_id = ngx_md5(host .. ip .. secret .. url)
    success, err = access:set(user_id, 1, expired_time)
    if err then
        ngx.log(ngx.WARN, "no memory", err)
    end
end

-- 验证访问次数
local function limit(user_id,limit_num)
    -- 0 正常,1 超过访问阀值
    local limit_result = 0
    limits,_ = access:get(user_id)
    if not limits then
        set_uid()
    elseif limits > limit_num then
        limit_result = 1
    else
        access:incr(user_id, 1)
    end
    return limit_result
end

-- 生成cookies
local function make_cookie(host, ip, url, time)
    local hash = ngx_md5(host..ip .. secret .. url..time) .. time
    return hash
end
local function denyuri()
        CCcount= 100
        CCseconds= 60
    local url = ngx.var.uri
        local token = ngx.var.remote_addr..url
        local limit_req = ngx.shared.access
        local req,_=limit_req:get(token)
        if req then
            if req > CCcount then
		         ngx.var.ruleid=8
                 ngx.exit(444)
            else
                 limit_req:incr(token,1)
            end
        else
            limit_req:set(token,1,CCseconds)
        end
end
-- 校验cookies
local function chk_cookie(host, ip, url)
    local cookie = ngx.var["cookie_niudun_uid"]
    if not cookie then
        ngx.log(ngx.WARN, "cookies not found")
        ngx.var.ruleid=8
        return false
    else
        local timestamp = tonumber(str_sub(cookie, 33,42))
        if  not timestamp or cookie ~= make_cookie(host, ip, url, timestamp) then
            ngx.log(ngx.WARN, "cookies invalid")
            ngx.var.ruleid=8
            return false
        else
            return ngx.time() - cookie_exptime < timestamp
        end
    end
end

-- 设置302 跳转
local function challenge(cookie)
    ngx.header["Set-Cookie"] = { "niudun_uid=" .. cookie .. ";Max-Age=" .. cookie_exptime}
    return ngx.redirect(ngx.var.request_uri)
end
local function jsJump(ip,host,userAgent,reqUri,now)
    local js_expire_time = 5
    local jsExpireTime = now + js_expire_time    
    local key_new = ngx.md5(table.concat({ip,userAgent,host,secret,jsExpireTime}))
    local key_new = string.sub(key_new,"1","16")
    local newUrl  = ''
    local newReqUri = ngx.re.match(reqUri, "(.*?)\\?(.+)")
    if newReqUri then
        local reqUriNoneArgs = newReqUri[1]
        local args    = newReqUri[2]
        local newArgs = ngx.re.gsub(args, "[&?]?ydkeyjs=[^&]+&?|ydexpirejs=[^&]+&?", "", "isjo")
        if newArgs == "" then
            newUrl = table.concat({reqUriNoneArgs,"?ydkeyjs=",key_new,"&ydexpirejs=",jsExpireTime})
        else
            newUrl = table.concat({reqUriNoneArgs,"?",newArgs,"&ydkeyjs=",key_new,"&ydexpirejs=",jsExpireTime})
        end
    else
        newUrl = table.concat({reqUri,"?ydkeyjs=",key_new,"&ydexpirejs=",jsExpireTime})
    end
    local jsJumpCode=make_js_code(newUrl)
    ngx.header.content_type = "text/html"
    ngx.print(jsJumpCode)
    ngx.exit(200)
end

local function jsdefend()
    local headers = ngx.req.get_headers()
    local cc_options = cc_options or nil
    local ip = getRealIp()
    local host = ngx.var.http_host
    local url = ngx.var.uri
    local reqUri = ngx.var.request_uri
    local now = ngx.time()
    local jsSign        = ngx.re.match(reqUri, "ydkeyjs=([^&]+)","isjo")
    local jsExpire      = ngx.re.match(reqUri, "ydexpirejs=([^&]+)","isjo")


    local userAgent     = headers["User-Agent"] or ""
    local jsSignCookie  = ngx.var["cookie_yd_jsign"]
    local jsJumpFlag    = true
    if jsSignCookie then
        local random_seeds = string.sub(jsSignCookie,"17","32")
        local key_make     = ngx.md5(table.concat({ip,userAgent,host,secret,random_seeds}))
        local yd_jsign     = string.sub(key_make,"1","16") .. random_seeds
        if jsSignCookie == yd_jsign then
            jsJumpFlag =  false
        end
    end

    local user_id,ret
    if jsJumpFlag == true then
        if jsSign and jsExpire then
           local jsSignValue   = jsSign[1]
           local jsExpireValue = jsExpire[1]
           local key_make      = ngx.md5(table.concat({ip,userAgent,host,secret,jsExpireValue}))
           local key_make_2    = string.sub(key_make,"1","16")
           if key_make_2 ~= jsSignValue or now > tonumber(jsExpireValue) then
               jsJump(ip,host,userAgent,reqUri,now)
           else
               local random_seeds = string.sub(key_make,"17","32")
               local cookie_sign  = ngx.md5(table.concat({ip,userAgent,host,secret,random_seeds}))
               local yd_jsign     = string.sub(cookie_sign,"1","16") .. random_seeds
               ngx.header["Set-Cookie"] = { "yd_jsign=" .. yd_jsign}
           return ngx.redirect(ngx.var.request_uri)
           end
        else
            jsJump(ip,host,userAgent,reqUri,now)
        end
    end
end

function ccdefend.anti_cc()
    denyuri()
    if js=="on" then
	jsdefend()
    end
    local ip = getRealIp()
    local host = ngx.var.http_host
    local url = ngx.var.uri
    local requrl = ngx.var.request_uri
    local user_id = ngx_md5(host .. ip .. secret .. url)
    local ret = limit(user_id,cc.limit_num)
    if ret == 1 then
        local cookie = make_cookie(host, ip, requrl, ngx.time()+cookie_exptime)
        if not chk_cookie(host, ip, requrl) then
            challenge(cookie)
        end
    end
end
return ccdefend