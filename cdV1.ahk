;#Requires AutoHotkey v2.0
; [Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 18:05:46  on 28/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}






; MsgBox(Cd( A_ScriptDir, 3 ))


; CD1(path){

;     ; return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd").StdOut.ReadAll()
;     return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd").StdOut.ReadAll()
; }



;future version (..\/)+

Cdv1(path , backTimes := 0){

    if (backTimes)==0{
        return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd").StdOut.ReadAll()
    }else if (backTimes) > 0{
        

        loop backTimes{

            CdBack .= "../"
        }
        
        return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd " CdBack " && cd").StdOut.ReadAll()

    }




}


; MsgBox(cd(  A_ScriptDir , 1 ))




    ; Cd_old(path , back := unset){


    ;     if path 







    ;     if !IsSet(back){
    ;         return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd").StdOut.ReadAll()
            
    ;     }
        
        
    ;     else{
    ;                 if RegExMatch(back, "\b[0-9]+\b"  ) {
    ;                     back_str:= ""
    ;                     b := "../"
    ;                     i := back
    ;                     while i != 0{
    ;                         back_str .= b
    ;                         i--
    ;                     }                    
    ;                     return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd" back_str " && cd").StdOut.ReadAll()
    ;                 }





    ;         return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd" back_str " && cd").StdOut.ReadAll()



    ;     }
        


    ; }



    ; ; MsgBox a

    ; ; MsgBox(ComObject("WScript.Shell").Exec('cmd.exe /c dir').StdOut.ReadAll())


