LJ
    -   L  ��  � �4   ' =  4Q 5 5 5 ==5 5 ==	>5
 5 5 ==5 5 ==	>5 5 5 ==5 5 ==	>5 5 5 ==5 5 ==	>5 5 5 ==5 5 ==	>5 5 5  ==5! 5" ==	>5# 5$ 5% ==5& 5' ==	>5( 5) 5* ==5+ 5, ==	>5- 5. 5/ ==50 51 ==	>	52 53 54 ==55 56 ==	>
57 58 59 ==5: 5; ==	>5< 5= 5> ==5? 5@ ==	>5A 5B 5C ==5D 5E ==	>5F 5G 5H ==5I 5J ==	>5K 5L 5M ==5N 5O ==	>5P 5Q 5R ==5S 5T ==	>5U 5V 5W ==5X 5Y ==	>5Z 5[ 5\ ==5] 5^ ==	>5_ 5` 5a ==5b 5c ==	>5d 5e 5f ==5g 5h ==	>5i 5j 5k ==5l 5m ==	>5n 5o 5p ==5q 5r ==	>5s 5t 5u ==5v 5w ==	>5x 5y 5z ==5{ 5| ==	>5} 5~ 5 ==5� 5� ==	>5� 5� 5� ==5� 5� ==	>5� 5� 5� ==5� 5� ==	>5� 5� 5� ==5� 5� ==	>5� 5� 5� ==5� 5� ==	>5� 5� 5� ==5� 5� ==	>5� 5� 5� ==5� 5� ==	>5� 5� 5� ==5� 5� ==	> 5� 5� 5� ==5� 5� ==	>!5� 5� 5� ==5� 5� ==	>"5� 5� 5� ==5� 5� ==	>#5� 5� 5� ==5� 5� ==	>$5� 5� 5� ==5� 5� ==	>%5� 5� 5� ==5� 5� ==	>&5� 5� 5� ==5� 5� ==	>'5� 5� 5� ==5� 5� ==	>(5� 5� 5� ==5� 5� ==	>)5� 5� 5� ==5� 5� ==	>*5� 5� 5� ==5� 5� ==	>+5� 5� 5� ==5� 5� ==	>,5� 5� 5� ==5� 5� ==	>-5� 5� 5� ==5� 5� ==	>.5� 5� 5� ==5� 5� ==	>/5� 5� 5� ==5� 5� ==	>05� 5� 5� ==5� 5� ==	>15� 5� 5� ==5� 5� ==	>25� 5 5==55==	>3555==55==	>45	5
5==55==	>5555==55==	>6555==55==	>7555==55==	>8555==5 5!==	>95"5#5$==5%5&==	>:5'5(=5)5*==	>;5+5,5-==5.5/==	><505152==5354==	>=555657==5859==	>>5:5;5<==5=5>==	>?5?5A5@==5B5C==	>@5D5F5E==5G5H==	>A5I5J5K==5L5M==	>B5N5O5P==5Q5R==	>C5S5U5T==5V5W==	>D5X5Y5Z==5[5\==	>E5]5^5_==5`5a==	>F5b5c5d==5e5f==	>G5g5h5i==5j5k==	>H5l5m5n==5o5p==	>I5q5r5s==5t5u==	>J5v5w5x==5y5z==	>K5{5|5}==5~5==	>L5�5�5�==5�5�==	>M5�5�5�==5�5�==	>N5�5�5�==5�5�==	>O5�5�5�==5�5�==	>P'�3�< 2  �L   
rules keyall patternM(?:<OBJECT /+\t].*?((type)|(codetype)|(classid)|(code)|(data))[ /+\t]*=)operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREidѬ keyall pattern(?:<APPLET /+\t>])operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREidЬ keyall pattern$(?:<BASE /+\t].*?href[ /+\t]*=)operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREidϬ keyall pattern$(?:<LINK /+\t].*?href[ /+\t]*=)operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREidά keyall pattern'(?:<META /+\t].*?charset[ /+\t]*=)operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREidͬ keyall pattern�(?:<META /+\t].*?http-equiv[ /+\t]*=[ /+\t]*[\"\'`]?(((c|(&#x?0*((67)|(43)|(99)|(63));?)))|((r|(&#x?0*((82)|(52)|(114)|(72));?)))|((s|(&#x?0*((83)|(53)|(115)|(73));?)))))operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREid̬ keyall pattern4(?:<[?]?import /+\t].*?implementation[ /+\t]*=)operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREidˬ keyall pattern*(?:<EMBED /+\t].*?((src)|(type)).*?=)operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREidʬ keyall pattern0(?i:<.*[:]vmlframe.*?[ /+\t]*?src[ /+\t]*=)operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREidǬ keyall pattern+(?:<[i]?frame.*?[ /+\t]*?src[ /+\t]*=)operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREidƬ keyall pattern@(?:<script.*?[ /+\t]*?((src)|(xlink:href)|(href))[ /+\t]*=)operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREidŬ keyall patternw(?:<style.*?>.*?((@[i\\\\])|(([:=]|(&#x?0*((58)|(3A)|(61)|(3D));?)).*?([(\\\\]|(&#x?0*((40)|(28)|(92)|(5C));?)))))operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description+XSS (Cross-Site Scripting) - IE Filteraction
SCOREidĬ keyall pattern(?:<script.*?>)operator
REGEX	typeURI_ARGS    html_decodecompress_whitespace description+XSS (Cross-Site Scripting) - IE Filteraction	DENYidì keyall pattern"<!(doctype|entity)operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid¬ keyall pattern'';!--\"<xss>=&{()}operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score description3XSS (Cross-Site Scripting) - xss testing alertaction
SCOREid�� keyall patternxbackground\b\W*?:\W*?url|background-image\b\W*?:|behavior\b\W*?:\W*?url|-moz-binding\b|@import\b|expression\b\W*?\(operator
REGEX	typeURI_ARGS    html_decodecompress_whitespace description/XSS (Cross-Site Scripting) - CSS Fragmentsaction	DENYid�� keyall pattern5(prompt|expression|fromcharcode|alert|eval)\s*\(operator
REGEX	typeURI_ARGS    html_decodecompress_whitespace description.XSS (Cross-Site Scripting) - JS Fragmentsaction	DENYid�� keyall pattern<(asfunction|javascript|vbscript|data|mocha|livescript):operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern�\bon(abort|blur|change|click|dblclick|dragdrop|error|focus|keydown|keypress|keyup|load|mousedown|mousemove|mouseout|mouseover|mouseup|move|readystatechange|reset|resize|select|submit|unload)\b\W*?=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern�.+application/x-shockwave-flash|image/svg\+xml|text/(css|html|ecmascript|javascript|vbscript|x-(javascript|scriptlet|vbscript)).+operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern'\ballowscriptaccess\b|\brel\b\W*?=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\.fromcharcode\boperator
REGEX	typeREQUEST_ARGS skipend
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern+\btype\b\W*?\btext\b\W*?\bjavascript\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\burl\b\W*?\bshell:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern%<input\b.*?\btype\b\W*?\bimage\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonkeyup\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bbackground-image:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\biframe\b.{0,100}?\bsrc\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonclick\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonresize\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern�<(?:s(?:cript|tyle)|i(?:frame|n(?:put|s))|f(?:rame(?:set)?|orm)|a(?:pplet|ddress|rea)|b(?:ase|gsound|ody)|layer|src|meta|object|textarea)operator
REGEX	typeREQUEST_ARGS    html_decodecompress_whitespace descriptionXSS (Cross-Site Scripting)action	DENYid�� keyall pattern\bonload\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\blowsrc\b\W*?\bvbscript:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonselect\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\.innerhtml\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\burl\b\W*?\bjavascript:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bhref\b\W*?\bvbscript:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonmouseover\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\blowsrc\b\W*?\bshell:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern< ?metaoperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern2\btype\b\W*?\bapplication\b\W*?\bx-vbscript\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\balert\b\W*?\(operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern(\btype\b\W*?\btext\b\W*?\bjscript\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonchange\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bhref\b\W*?\bjavascript:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\.addimport\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern4\btype\b\W*?\bapplication\b\W*?\bx-javascript\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonsubmit\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonkeypress\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bactivexobject\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern \blowsrc\b\W*?\bjavascript:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonerror\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\<\!\[cdata\[operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern#\bdocument\b\s*\.\s*\bcookie\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonfocus\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern+\btype\b\W*?\btext\b\W*?\becmascript\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bsrc\b\W*?\bvbscript:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern<body\b.*?\bbackground\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bsrc\b\W*?\bjavascript:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern< ?iframeoperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bsettimeout\b\W*?\(operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonmove\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonblur\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\blivescript:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonmousemove\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonkeydown\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\burl\b\W*?\bvbscript:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern<body\b.*?\bonload\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bgetspecialfolder\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\.execscript\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bcopyparentfolder\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bcreatetextrange\boperator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bhref\b\W*?\bshell:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern'\bstyle\b\W*\=.*bexpression\b\W*\(operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonmouseup\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\blowsrc\b\W*?\bhttp:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bmocha:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bsrc\b\W*?\bshell:operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�� keyall pattern\bonmousedown\b\W*?\=operator
REGEX	typeREQUEST_ARGS  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�var keyall pattern\bgetparentfolder\boperator
REGEX	typeREQUEST_ARGS	optstransform  html_decodecompress_whitespace 
score descriptionXSS (Cross-Site Scripting)action
SCOREid�0.5version 