        local config = require "config"
        whiteips=config.whiteips
        blackips=config.blackips
        whiteurl=config.whiteurl
        local WAF = require "fw"
        local fw = WAF:new()
        local cc = require "cc"
        for k,v in pairs(blackips) do
            if ngx.var.host == k or k== 'all' then
                if ngx.var.remote_addr == v then
                    ngx.exit(444)
                end
            end
        end
for kk, k in pairs(blackips) do  
    if type(k) == "table" then  
        for _, v in pairs(k) do  
         if ngx.var.host == kk or kk=='all' then
                if ngx.var.remote_addr == v then
                    ngx.exit(444)
                end
            end            
        end  
	end 
end
for kk, k in pairs(whiteips) do  
    if type(k) == "table" then  
        for _, v in pairs(k) do  
         if ngx.var.host == kk or kk=='all' then
                if ngx.var.remote_addr == v then
                    return
                end
            end            
        end  
	end 
end
for kk, k in pairs(whiteurl) do  
    if type(k) == "table" then  
        for _, v in pairs(k) do  
         if ngx.var.host == kk or kk=='all' then
                if v~=nil and ngx.re.find(ngx.var.request_uri,v) then
                    return
                end
            end            
        end  
	end 
end
        cc.anti_cc()
        fw:exec()
