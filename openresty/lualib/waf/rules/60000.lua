LJ
    -   L  ��  0 p4   ' =  4 5 5 5 ==5 =>5 5	 5
 ==4  =>5 5 5 ==4  =>5 5 5 ==4  =>5 5 5 ==5 =>5 5 5 ==5 =>5 5 5 ==4  =>5 5 5 ==4  =>5 5  5! ==4  =>	5" 5# 5$ ==4  =>
5% 5& 5' ==4  =>5( 5) 5* ==4  =>5+ 5, 5- ==4  =>3/ =. 2  �L   
rules keyall 	typeREQUEST_URIoperator
REGEXpattern,(\.\.((\%[0-9a-fA-F]{2}){2}|[\\\/])){3} id��descriptionNull byte at end of URIaction	DENY keyall 	typeREQUEST_ARGSoperator
REGEXpattern:(\s*\w+\s*\&(\s*arrs(\d*)\[\]\s*\=\s*(\d*)\s*\&){5,}) id��descriptionNull byte at end of URIaction	DENY keyall 	typeURIoperator
REGEXpattern@web\.config|win\.ini|php\.ini|jdbc\.properties|system\.ini  id��descriptionNull byte at end of URIaction	DENY keyall 	typeBOUNDARY_FILENAMEoperator
REGEXpatternk(\/(.*?)\.(asp(\/(.*?)|\;)|php(\\x00|\\0))\.(jpg|gif|png|jpeg)$)|((.*?)\.(jpg|gif|png|jpeg)\%00\.php$) id��descriptionNull byte at end of URIaction	DENY keyall 	typeURI_ARGSoperator
REGEXpatternk(\/(.*?)\.(asp(\/(.*?)|\;)|php(\\x00|\\0))\.(jpg|gif|png|jpeg)$)|((.*?)\.(jpg|gif|png|jpeg)\%00\.php$) id��descriptionNull byte at end of URIaction	DENY keyall 	typeURI_ARGSoperator
REGEXpattern;(\.\.(\/|\\|(\\x5c){1,2}|(\%([0-9a-fA-F]{2})){2})){2,} id��descriptionNull byte at end of URIaction	DENY transformuri_decodekeyall 	typeREQUEST_BODYoperator
REGEXpattern~(?:/x5c|\.\.(\\|/|(?:%(?:2(?:5(?:2f|5c)|%46|f)|c(?:0%(?:9v|af)|1%1c)|u(?:221[56]|002f)|%32(?:%46|F)|e0%80%af|1u|5c)))){3} id��description)Directory traversal (volatile match)action	DENY transformuri_decode keyall 	typeURI_ARGSoperator
REGEXpattern~(?:/x5c|\.\.(\\|/|(?:%(?:2(?:5(?:2f|5c)|%46|f)|c(?:0%(?:9v|af)|1%1c)|u(?:221[56]|002f)|%32(?:%46|F)|e0%80%af|1u|5c)))){3} id��description)Directory traversal (volatile match)action	DENY transformuri_decode keyall 	typeURIoperator
REGEXpattern~(?:/x5c|\.\.(\\|/|(?:%(?:2(?:5(?:2f|5c)|%46|f)|c(?:0%(?:9v|af)|1%1c)|u(?:221[56]|002f)|%32(?:%46|F)|e0%80%af|1u|5c)))){3} id��description)Directory traversal (volatile match)action	DENY keyall 	typeURI_ARGSoperator
REGEXpattern�(?:\b(?:(?:n(?:et(?:\b\W+?\blocalgroup|\.exe)|(?:map|c)\.exe)|t(?:racer(?:oute|t)|elnet\.exe|clsh8?|ftp)|(?:w(?:guest|sh)|rcmd|ftp)\.exe|echo\b\W*?\by+)\b\s+|c(?:md(?:(?:\.exe|32)\b|\b\W*?\/c)|d(?:\b\W*?[\\/]|\W*?\.\.)|hmod.{0,40}?\+.{0,3}x))|[\;\|\`]\W*?\b(?:(?:c(?:h(?:grp|mod|own|sh)|md|pp)|p(?:asswd|ython|erl|ing|s)|n(?:asm|map|c)|f(?:inger|tp)|(?:kil|mai)l|(?:xte)?rm|ls(?:of)?|telnet|uname|echo|id)\b|g(?:\+\+|cc\b))\s+) id��description%System command injection attemptaction	DENY keyall 	typeURI_ARGSoperator
REGEXpatterna\b(?:(?:n(?:map|et|c)|w(?:guest|sh)|telnet|rcmd|ftp)\.exe\b|cmd(?:(?:32)?\.exe\b|\b\W*?\/c)) id��description"System command access attemptaction	DENY keyall 	typeURI_ARGSoperator
REGEXpatternn(?:(?:\.(?:ht(?:access|passwd|group)|www_?acl)|\b(global\.asa|httpd\.conf|win\.ini|boot\.ini)\b|\/etc\/)) id��descriptionSystem file access attemptaction	DENY 
scorevar	opts keyall 	typeURI_ARGSoperator
REGEXpattern;^(?:ht|f)tps?:\/\/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}) id��description4Remote File Inclusion - URL in request argumentaction
SCORE0.5version 