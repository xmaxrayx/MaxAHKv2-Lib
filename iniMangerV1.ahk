; #Requires AutoHotkey v2.0+

;/[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 23:19:49  on 8/4/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 13:41:10  on 20/4/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 08:54:33  on 29/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}

; l := iniMangerV1()


; l.do("day","1--","week")
; day := iniV1("day","1--","week")
; ; tomoory := ini("tommory","1--","week")






class iniMangerV1{
    
    ini__fileName := "settings.ini"
    Ini__path := A_ScriptDir
    Ini__section := " "
    
    
    SetIniFileName(name){
        this.ini__fileName
        name := "/" . name . ".ini"
        this.ini__fileName
    }


    SetIniPath(path){
        this.Ini__path := path
    }

    do(masterKey,defaultValue,section?){
        return (iniV1(masterKey, defaultValue ,section := this.Ini__section , path := this.Ini__path , defaultIniFilename := this.SetIniFileName))
         
    }

    SetIniSection(section){
        this.Ini__section := section
    }


    ; ;/////////////////////////auto-delete
    ; iniV1(masterKey, defaultValue ,section := "", path := A_ScriptDir , defaultFilename := "settings.ini" ){
    ;     defaultFilename := ("\"  . defaultFilename)
    ;     admincounter(){
    ;         MsgBox "the script has no permission to read the file (higher privliiges needed)"
    ;     }
    
    ;     createFolder_localFunction(path){
    ;         if path ~= "([a-zA-Z1-9])+\.ini$"{
    ;             local IniFilename  := RegExMatchInfo
    ;             RegExMatch(path , "([a-zA-Z1-9])+\.ini$" , &IniFilename )
    ;             folderPath := RegExReplace(path , IniFilename[0] , "")
    ;             DirCreate(folderPath)
    ;         }else{
    ;             DirCreate(path)
    ;         }
    
    ;     }
    
    
    
    
    
    
    
    ;     if (1 == path ~= "\/") || (1 == path ~= "\\") {
    ;         if  path ~= "([a-zA-Z1-9])+\.ini$"
    ;             path := path
    ;         else
    ;             path := path . defaultFilename
    ;     }
    ;     else if 1 == path ~= "\b[a-zA-Z]\:\b"{
    ;         path := path
    ;     }
    ;     else{
    ;         path := A_ScriptDir . defaultFilename
    ;     }
    
    
    ;     ;read teh file
    
    ;     try {
            
    ;         return IniRead(path, section, masterKey)
    ;     }catch Error as e
    ;         {   
    ;             ; MsgBox e.Message
    ;             if e.Message ~= "i)Access is denied"
    ;                 admincounter()
    ;             try { ;fix for folder donn't exit and permission write
    ;                 FileAppend("", path , "UTF-8")
                    
    ;                 IniWrite(defaultValue , path, section, masterKey)
    ;             }catch Error as e
    ;             {
    ;                 MsgBox e.Message
    ;                 if e.Message ~= "i)The system cannot find the path specified"{
    ;                     try {
    ;                         createFolder_localFunction(path)
    ;                         FileAppend("", path , "UTF-8")
    ;                         ;IniWrite "this is a new value", "C:\Temp\myfile.ini", "section2", "key"
    ;                         IniWrite(defaultValue , path, section, masterKey)
    ;                     }catch Error as e{
    ;                         if e.Message ~= "i)Access is denied"
    ;                             {
    ;                                 admincounter()
    ;                             }
    ;                     }
    ;                 }
    ;                 else if e.Message ~= "i)Access is denied"{
    ;                     admincounter()
    ;                 }else{
    ;                     MsgBox e.Message
    ;                 }
    ;             }
                
    ;             return defaultValue
    
    ;         }
    
    ; }
    ; ;//////////////////////////////////





}












iniV1(masterKey, defaultValue ,section?, path := A_ScriptDir , defaultFilename := "settings.ini" ){
    section := section??""
    defaultFilename := ("\"  . defaultFilename)
    admincounter(){
        MsgBox "the script has no permission to read the file (higher privliiges needed)"
    }

    createFolder_localFunction(path){
        if path ~= "([a-zA-Z1-9])+\.ini$"{
            local IniFilename  := RegExMatchInfo
            RegExMatch(path , "([a-zA-Z1-9])+\.ini$" , &IniFilename )
            folderPath := RegExReplace(path , IniFilename[0] , "")
            DirCreate(folderPath)
        }else{
            DirCreate(path)
        }

    }







    if (1 == path ~= "\/") || (1 == path ~= "\\") {
        if  path ~= "([a-zA-Z1-9])+\.ini$"
            path := path
        else
            path := path . defaultFilename
    }
    else if 1 == path ~= "\b[a-zA-Z]\:\b"{
        path := path
    }
    else{
        path := A_ScriptDir . defaultFilename
    }


    ;read teh file

    try {
        
        return IniRead(path, section, masterKey)
    }catch Error as e
        {   
            ; MsgBox e.Message
            if e.Message ~= "i)Access is denied"
                admincounter()
            try { ;fix for folder donn't exit and permission write
                FileAppend("", path , "UTF-8")
                
                IniWrite(defaultValue , path, section, masterKey)
            }catch Error as e
            {
                MsgBox e.Message
                if e.Message ~= "i)The system cannot find the path specified"{
                    try {
                        createFolder_localFunction(path)
                        FileAppend("", path , "UTF-8")
                        ;IniWrite "this is a new value", "C:\Temp\myfile.ini", "section2", "key"
                        IniWrite(defaultValue , path, section, masterKey)
                    }catch Error as e{
                        if e.Message ~= "i)Access is denied"
                            {
                                admincounter()
                            }
                    }
                }
                else if e.Message ~= "i)Access is denied"{
                    admincounter()
                }else{
                    MsgBox e.Message
                }
            }
            
            return defaultValue

        }

}









/*

; l := iniMangerV1.read("Name" , "Max" , "settings" )

kk := iniMangerV1.read("value" , "189.98" , "settings" , "\ss\dd\dd\hhh.ini")



class iniMangerV1{
    ;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 23:24:36  on 8/4/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
    
    static read(masterKey, defaultValue ,section := "", path := unset ){
        

        


        if 0 == IsSet(path){
            MsgBox "ss"
            path := A_IniWorkingDir . A_iniFileName
        }else{
            if (1 == path ~= "\/") || (1 == path ~= "\\") {
                if  path ~= "([a-zA-Z1-9])+\.ini$"{
                    path := A_IniWorkingDir . path
                }else if 1 == path ~= "\b[a-zA-Z]\:\b"{
                    path := path
                    
                }else{
                    MsgBox "error path"
                    path := A_IniWorkingDir . A_iniFileName
                }
        }

            
        try {
            local value := IniRead(path, section, masterKey)
            return value
        }
        catch Error as e
        {
            if e.Message ~= "i)Access is denied"
                {
                    runAsAdmin
                }
            
            local value := defaultValue
            MsgBox path
            
            try { ;fix for folder donn't exit and permission write
                FileAppend("", path , "UTF-8")
                
            }catch Error as e
            {
                MsgBox e.Message
                if e.Message ~= "i)The system cannot find the path specified"{
                    try {
                        createFolder_localFunction(path)
                        FileAppend("", path , "UTF-8")
                    }catch Error as e{
                        if e.Message ~= "i)Access is denied"
                            {
                                runAsAdmin
                            }
                    }
                }
                else if e.Message ~= "i)Access is denied"{
                    runAsAdmin
                }
            }

            ; IniWrite(defaultValue, path, section, masterKey) ;IniWrite "this is a new value", "C:\Temp\myfile.ini", "section2", "key"
           
        }
        return value

        
    }


    createFolder_localFunction(path){
        if path ~= "([a-zA-Z1-9])+\.ini"{
                    local IniFilename  := RegExMatchInfo
                    RegExMatch(path , "([a-zA-Z1-9])+\.ini$" , &IniFilename )
                    
                    folderPath := RegExReplace(path , IniFilename[0] , "")
                    DirCreate(folderPath)
        }

    }+

    runAsAdmin(checkIfFileReadOnly?){ ; this function from https://www.autohotkey.com/docs/v2/lib/Run.htm#RunAs
        full_command_line := DllCall("GetCommandLine", "str")
        if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
            {
                try
                {
                    if A_IsCompiled
                        Run '*RunAs "' A_ScriptFullPath '" /restart'
                    else
                        Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
                }
                ExitApp
            }
            
            MsgBox "A_IsAdmin: " A_IsAdmin "`nCommand line: " full_command_line
    }





}




    static setIniPath(path? , internalPath := A_WorkingDir ){
        if !IsSet(path){
            global A_IniWorkingDir
            A_IniWorkingDir := A_WorkingDir
            return
        }else if (1 == path ~= "\/") || (1 == path ~= "\\"){
            
            if  (internalPath ~= "i)scriptDir") {
                global A_IniWorkingDir
                A_IniWorkingDir := A_WorkingDir . path
            }else{    
                global A_IniWorkingDir
                A_IniWorkingDir := A_WorkingDir . path
                }
            
            



            }
        }
        


    }





; MsgBox "/a.ini"
; MsgBox hi

; Value := IniRead("C:\Temp\myfile.ini", "section2", "key")
; MsgBox "The value is " Value

*/