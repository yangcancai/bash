local _M = {}
_M.whiteips = {}
_M.blackips = {}
_M.whiteurl = {}

_M.waf = {
        rulesets = { 10000, 10001, 10002, 10003, 20000, 30000, 40000, 50000, 51000, 60000, 99000 },
        mode = "ACTIVE",
        score_threshold = 5,
        ignored_rules = {},
}
_M.cc = {
    secret = "p::nRkc54}hfeI",
    limit_num = 600,
    expired_time = 30,
    jsdefend = "off",
}

--IP黑白名单配置在这里，中括号里写域名，后面写IP,注意逗号分隔
--_M.whiteips['domain.com']={"127.0.0.1","42.51.14.221","8.8.8.8"}
--_M.whiteips['all']={'127.0.0.1'}
--_M.blackips["all"]={'127.0.0.1',"42.51.14.221","8.8.8.8"}
--_M.blackips["domain.com"]={'127.0.0.1'}
--UR黑白名单在这里，后面写URL，支持PCRE正则表达式匹配，注意逗号分隔
_M.whiteurl["all"]={"/app/cash/.*.php",
		    "^/app/cash/cash_operation.+.php",
}

return _M
