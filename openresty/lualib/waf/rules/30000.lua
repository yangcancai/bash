LJ
    -   L  ��#  A �4   ' =  4 5 5 5 ==4  =>5 5 5	 ==4  =>5
 5 5 ==4  =>5 5 5 ==4  =>5 5 5 ==4  =>5 5 5 ==4  =>5 5 5 ==4  =>5 5 5 ==5 =>5 5 5 ==5  =>	5! 5" 5# ==5$ =>
5% 5& 5' ==5( =>5) 5* 5+ ==5, =>5- 5. 5/ ==4  =>50 51 52 ==4  =>53 54 55 ==56 =>57 58 59 ==5: =>5; 5< 5= ==5> =>3@ =? 2  �L   
rules transformuri_decode 
value_methodkeyspecific 	typeREQUEST_BODYoperator
REGEXpatternfilter id��description#ThinkPHP 5.1-5.2  rce exploit action	DENY transformuri_decode 
value_methodkeyspecific 	typeREQUEST_BODYoperator
REGEXpattern__construct id��description(Before thinkPHP 5.0.23 rce exploit action	DENY transformuri_decode keyall 	typeREQUEST_ARGSoperator
REGEXpattern(^|/|\\)think\\ id��description thinkphp router rce exploitaction	DENY 
valuecontent-typekeyspecific 	typeHEADERSoperator
REGEXpattern%{ id��descriptionstruts2 exploitaction	DENY keyall 	typeUSER_AGENToperator
REGEXpatternD(gopher|doc|php|glob|file|phar|zlib|ftp|ldap|dict|ogg|data)\:\/ id��descriptionmssqliaction	DENY 
scoretransformuri_decode keyall 	typeREQUEST_ARGSoperator
REGEXpattern�(?:(?:(?:(?:a(?:llow_url_includ|uto_prepend_fil)e|s(?:uhosin.simulation|afe_mode)|disable_functions|open_basedir)=|php://input))) id��descriptionPHP Injectionaction
SCORE 
score keyall 	typeREQUEST_ARGSoperator
REGEXpattern�(?:\b(?:f(?:tp_(?:nb_)?f?(?:ge|pu)t|get(?:s?s|c)|scanf|write|open|read)|gz(?:(?:encod|writ)e|compress|open|read)|s(?:ession_start|candir)|read(?:(?:gz)?file|dir)|move_uploaded_file|(?:proc_|bz)open|call_user_func)|\$_(?:(?:pos|ge)t|session))\b id��descriptionPHP Injectionaction
SCORE 
score keyall 	typeREQUEST_ARGSoperator
REGEXpattern<\?(?!xml) id��descriptionPHP Injectionaction
SCORE 
score keyall 	typeREQUEST_ARGSoperator
REGEXpattern�(?:\b(?:(?:n(?:et(?:\b\W+?\blocalgroup|\.exe)|(?:map|c)\.exe)|t(?:racer(?:oute|t)|elnet\.exe|clsh8?|ftp)|(?:w(?:guest|sh)|rcmd|ftp)\.exe|echo\b\W*?\by+)\b|c(?:md(?:(?:\.exe|32)\b|\b\W*?\/c)|d(?:\b\W*?[\\/]|\W*?\.\.)|hmod.{0,40}?\+.{0,3}x))|[\;\|\`]\W*?\b(?:(?:c(?:h(?:grp|mod|own|sh)|md|pp)|p(?:asswd|ython|erl|ing|s)|n(?:asm|map|c)|f(?:inger|tp)|(?:kil|mai)l|(?:xte)?rm|ls(?:of)?|telnet|uname|echo|id)\b|g(?:\+\+|cc\b))) id��description%System command injection attemptaction
SCORE chainchildchainend 
valueuser-agentkeyspecific 	typeHEADERSoperator
REGEXpattern\(\)\s\{.*\}?; id��descriptionshell shocaction	DENY keyall 	typeREQUEST_ARGSoperator
REGEXpattern�([;`]|\|\||\&\&)\W*?(?:c(?:h(?:grp|mod|own|sh)|url|pp|at)|p(?:asswd|ython|erl|ing|s)|f(?:inger|tp)|t(?:elnet|raceroute|clsh8?|ftp)|g(?:cc|\+\+)|kill|mail|(?:xte)?rm|ls(?:of)?|echo|uname|wget|s(h|leep)|/bin/)\b id��descriptionphp rce exploitaction	DENY keyall 	typeREQUEST_ARGSoperator
REGEXpattern�(?:(?:f(?:tp_(?:nb_)?f?(?:ge|pu)t|get(?:s?s|c)|scanf|write|open|read)|gz(?:(?:encod|writ)e|compress|open|read)|s(?:ession_start|candir)|read(?:(?:gz)?file|dir)|move_uploaded_file|(?:proc_|bz)open|call_user_func)\(|\$_(?:(?:pos|ge)t|session)[\(\[]) id��descriptionphp rce exploitaction	DENY keyall 	typeREQUEST_ARGSoperator
REGEXpattern|\ballowScriptAccess[\s]*?=[\s]*?always|(redirectAction|action):\$|java\.(lang|io)|\.println\(|\.allowStaticMethodAccess id��descriptionstruts2 exploitaction	DENY keyall 	typeREQUEST_ARGSoperator
REGEXpatternD(gopher|doc|php|glob|file|phar|zlib|ftp|ldap|dict|ogg|data)\:\/ id��descriptionmssqliaction	DENY keyall 	typeREQUEST_ARGSoperator
REGEXpattern\(\)\s\{.*\}?; id��descriptionShellshoc exploitaction	DENY keyall 	typeREQUEST_ARGSoperator
REGEXpatternL\$_(GET|post|cookie|files|session|env|phplib|GLOBALS|SERVER)(\s*|\+*)\[ id��description7User agent indicates an automated scan of the siteaction	DENYvar	opts keyall 	typeREQUEST_ARGSoperator
REGEXpattern�(?:define|eval|file_get_contents|include|require|require_once|shell_exec|phpinfo|system|passthru|preg_\w+|execute|echo|print|print_r|var_dump|(fp)open|showmodaldialog)(\s*|\+*)\( id��description7User agent indicates an automated scan of the siteaction	DENY0.5version 