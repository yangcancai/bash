LJ
    -   L  ��   D4   ' =  4
 5 5 5 ==4  =>5 5 =4  =>5	 5
 5 ==4  =>5 5 =4  =>5 5 =5 =>5 5 =5 =>5 5 =4  =>5 5 =4  =>5 5 5 ==4  =>	3 = 2  �L   
rules 
valueuser-agentkeyspecific 	typeHEADERSoperator
REGEXpattern9Mozilla/4.0 \(compatible; MSIE 9.0; Windows NT 6.1\) id�descriptiondeny testaction	DENY pattern7\.(\~|swap|bak|inc|old|mdb|sql|backup|java|class)$	typeURIoperator
REGEX id�descriptionweak file disaction	DENY pattern0\/\.(svn|cvs|git|swp|htaccess|bash_history)	typeURIoperator
REGEX id�descriptionweak file disaction	DENY chainchildchainend patternMMozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)	typeUSER_AGENToperatorEQUALS id�description0Emerging fake Googlebot wp-login bruteforceaction	DENY chainchild pattern	POST	typeMETHODoperatorEQUALS id�action
CHAIN pattern/wp-login.php	typeURIoperatorEQUALS id�action
CHAIN 
valueuser-agentkeyspecific 	typeHEADERSoperator
REGEXpattern0Mozilla/5\.0 \(compatible; Zollard; Linux\) idنdescriptionKnown *Coin miner worm (https://isc.sans.edu/forums/diary/Multi+Platform+Coin+Miner+Attacking+Routers+on+Port+32764/18353)action	DENY pattern4^\/(?:(?:id_)?[dr]sa(?:\.old)?|key(?:\.priv)?)$	typeURIoperator
REGEX id҆descriptionLSSH key scan (https://isc.sans.edu/forums/diary/Gimme+your+keys+/18231)action	DENYvar	opts 
valueuser-agentkeyspecific 	typeHEADERSoperatorEQUALSpatternFreeWAF Dummy idцdescriptionDummy FreeWAF signatureaction	DENY0.5version 