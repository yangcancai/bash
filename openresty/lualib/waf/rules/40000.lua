LJ
    -   L  ��  : p4   ' =  4 5 5 5 ==5 =>5 5	 5
 ==5 =>5 5 5 ==5 =>5 5 5 ==5 =>5 5 5 ==5 =>5 5 5 ==5 =>5 5 5 ==5 =>5  5! 5" ==5# =>5$ 5% 5& ==5' =>	5( 5) 5* ==5+ =>
5, 5- 5. ==5/ =>50 51 52 ==53 =>54 55 56 ==57 =>39 =8 2  �L   
rules 
score keyall 	typeREQUEST_ARGSoperator
REGEXpattern<\?(?!xml) id��descriptionPHP Injectionaction
SCORE 
scoretransformuri_decode keyall 	typeREQUST_ARGSoperator
REGEXpatternN(?:\.cookie\b.*?;\W*?(?:expires|domain)\W*?=|\bhttp-equiv\W+set-cookie\b) id��description%Session fixation attack detectedaction
SCORE 
scoretransformuri_decode keyall 	typeREQUEST_ARGSoperator
REGEXpattern�(?:(\binclude\s*\([^)]*|mosConfig_absolute_path|_CONF\[path\]|_SERVER\[DOCUMENT_ROOT\]|GALLERY_BASEDIR|path\[docroot\]|appserv_root|config\[root_dir\])=(ht|f)tps?:\/\/) id��description3Remote File Inclusion - PHP include() functionaction
SCORE 
score keyall 	typeREQUEST_ARGSoperator
REGEXpattern2(?:\bhttp\/(?:0\.9|1\.[01])|<(?:html|meta)\b) id��descriptionHTTP Response Splittingaction
SCORE 
score keyall 	typeREQUEST_ARGSoperator
REGEXpattern9[\n\r](?:content-(type|length)|set-cookie|location): id��descriptionHTTP Response Splittingaction
SCORE 
score 
valuetransfer-encodingkeyspecific 	typeHEADERSoperator
REGEXpattern, id��descriptionHTTP Request Smugglingaction
SCORE 
score 
valuecontent-lengthkeyspecific 	typeHEADERSoperator
REGEXpattern, id��descriptionHTTP Request Smugglingaction
SCORE 
score keyall 	typeREQUEST_ARGSoperator
REGEXpattern&[\n\r]\s*\b(?:to|b?cc)\b\s*:.*?\@ id��descriptionE-mail injectionaction
SCORE 
score keyall 	typeREQUEST_ARGSoperator
REGEXpattern/http:\/\/[\w\.]+?\/.*?\.pdf\b[^\x0d\x0a]*# id��descriptionUPDF XSSaction
SCORE 
score keyall 	typeREQUEST_ARGSoperator
REGEXpattern7<!--\W*?#\W*?(?:e(?:cho|xec)|printenv|include|cmd) id��descriptionSSI injection detectedaction
SCORE 
score keyall 	typeREQUEST_ARGSoperator
REGEXpattern�(?:\((?:\W*?(?:objectc(?:ategory|lass)|homedirectory|[gu]idnumber|cn)\b\W*?=|[^\w\x80-\xFF]*?[\!\&\|][^\w\x80-\xFF]*?\()|\)[^\w\x80-\xFF]*?\([^\w\x80-\xFF]*?[\!\&\|]) id��descriptionLDAP Injection detectedaction
SCORE 
score keyall 	typeREQUEST_ARGSoperator
REGEXpattern�\bcf(?:usion_(?:d(?:bconnections_flush|ecrypt)|set(?:tings_refresh|odbcini)|getodbc(?:dsn|ini)|verifymail|encrypt)|_(?:(?:iscoldfusiondatasourc|getdatasourceusernam)e|setdatasource(?:password|username))|newinternal(?:adminsecurit|registr)y|admin_registry_(?:delete|set)|internaldebug|execute)\b id��description"Coldfusion injection detectedaction	DENY 
scorevar	opts keyall 	typeREQUEST_ARGSoperator
REGEXpatternH(?:(?:[\;\|\`]\W*?\bcc|\b(wget|curl))\b|\/cc(?:[\'\"\|\;\`\-\s]|$)) id��description"OS Command Injection detectedaction
SCORE0.5version 