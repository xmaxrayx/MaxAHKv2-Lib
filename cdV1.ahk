#Requires AutoHotkey v2.0
; [Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 18:05:46  on 28/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}


MsgBox(Cd1("...." A_ScriptDir))
MsgBox(Cd1(A_ScriptDir))

CD1(path){

    MsgBox path
    ; return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd").StdOut.ReadAll()
    return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd").StdOut.ReadAll()
}



; MsgBox(cd(  A_ScriptDir , 1 ))




Cd(path , back := unset){


    if path 







    if !IsSet(back){
        return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd").StdOut.ReadAll()
        
    }
    
    
    else{
                if RegExMatch(back, "\b[0-9]+\b"  ) {
                    back_str:= ""
                    b := "../"
                    i := back
                    while i != 0{
                        back_str .= b
                        i--
                    }                    
                    return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd" back_str " && cd").StdOut.ReadAll()
                }





        return ComObject("WScript.Shell").Exec("cmd.exe /c cd " path " && cd" back_str " && cd").StdOut.ReadAll()



    }
    


}



; MsgBox a

; MsgBox(ComObject("WScript.Shell").Exec('cmd.exe /c dir').StdOut.ReadAll())


