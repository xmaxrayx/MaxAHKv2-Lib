; #Requires AutoHotkey v2.0
; #SingleInstance Force


; clip()
; User()


;/////////////////clip////////////////////

Clip(text:= unset){
    if !IsSet(text){
        A_Clipboard := ""
    }else{
        A_Clipboard := (text)
    }
}


;/////////////////user////////////////////




class User {

    static Call(){
        return this.______work()
    }


    static Download(){
        return this.______work() . "\Downloads"
    }


    static Pictures(){
        return this.______work() . "\Pictures"
    }


    static  Music(){
        return this.______work() . "\Music"
    }

    static Videos(){
         return this.______work() . "\Videos"
    }


    static Documents(){
        return  this.______work() . "\Documents"
    }


    static ______work(){
        A_UserPath__str := A_MyDocuments
        A_UserPath__str := RegExReplace(A_UserPath__str, "\\Documents" , "")
        return A_UserPath__str
    }


}


;///////////////////// Error manger//////////////

OnError LogError



LogError(exception, mode) {
    if !(DirExist("ErrorMessage")){
        DirCreate("ErrorMessage")
    }


    FileAppend(
        "\\\[" A_ScriptName "]------------[" FormatTime("dddd MMMM d, yyyy hh:mm:ss tt") "]\\\`nError on line " exception.Line ": " exception.Message "`n`n`n"
        ,"ErrorMessage\"
            A_ScriptName "  ErrorLog.txt" 
        ,"UTF-8"
            )


}



    ; FileAppend "\\\[" A_ScriptName "]\\\`nError on line " exception.Line ": " exception.Message "`n`n"
    ; , "ErrorMessage/errorlog.txt"
    ; }


;////////////////////////////////////////////////////////////////



