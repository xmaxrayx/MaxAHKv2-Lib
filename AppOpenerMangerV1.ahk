

;#Requires AutoHotkey v2.0
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 12:08:11  on 28/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}



/**
 * activate the applications, if not found will do new run
 * @param appName (str)EXE name like ("ahk_exe notepad.exe") 
 * @param appName 
 * @param appPath (str)Path for the Exe
 * @param {Integer} kill 0 minimize , 1 close , 2 kill
 * @param {String} kill  close , kill
 */
AppOpenerMangerV1(appName , appPath , kill := 0){
    if WinActive(appName){
        if kill == 0 
            WinMinimize(appName)
        if kill==1  ;|| kill =~ "!)close"
            WinClose(appName)
        else if kill==2 ;|| kill=~ "!)kill"
            WinKill(appName)
    }
    else if WinExist(appName)
        WinActivate(appName)
    else
        Run(appPath)



}