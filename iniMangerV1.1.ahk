/************************************************************************
 * @description  load the ini file if not found write the default value as ini
 * @file iniMangerV1.1ahk
 * @author xMaxrayx Unbreakable-ray
 * @date 2024/05/30
 * @version 1.1.0
 ***********************************************************************/
;#Requires AutoHotkey v2.0
;==========================================

;/{class} iniManger + version ex inimangerv1.1.ini
;/{func} ini + version



;==============================================================================
;my zone :3


;/[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 23:19:49  on 8/4/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 13:41:10  on 20/4/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 08:54:33  on 29/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 09:35:32  on 30/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 10:44:34  on 30/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}


;===================================================================================

class iniMangerV1_1{

    ini__fileName := "\settings.ini"
    ini__path := A_ScriptDir
    ini__section := ""

	IniFileName {
		get => this.ini__fileName
		set => this.ini__fileName := value
	}

    iniPath {
        get => this.Ini__path
        set => this.Ini__path := value
        }

    iniSection {
        get => this.Ini__section
        set => this.Ini__section := value
        }

    ;=============================================================
    do(masterKey,defaultValue,section?){ ;
        ;https://www.autohotkey.com/boards/posting.php?mode=reply&f=82&t=130325#preview
        ; changed to iniV1 to match outside function name
        ; return iniV1(masterKey, defaultValue ,section, this.Ini__path , this.IniFileName)	; the variables are not needed
        ; or make the arguments consistent
        return (iniV1_1(masterKey, defaultValue ,section := this.iniSection , path := this.iniPath , defaultIniFilename := this.IniFileName))
    }

    ; smartDo_Debug(masterKey,defaultValue,section?, debug := true){
    ;     if debug == true{
    ;         return defaultValue
    ;     }

    ;     global B_debugMode
    ;     if B_DebugMode??0  == 1{
    ;         return defaultValue
    ;     }

    ;     return (iniV1_1(masterKey, defaultValue ,section := this.iniSection , path := this.iniPath , defaultIniFilename := this.IniFileName))


    ; }
    debug(masterKey,defaultValue,section?){
        return defaultValue
    }

    default(masterKey,defaultValue,section?){
        MsgBox
    }

}



iniV1_1(masterKey, defaultValue ,section?, path := A_ScriptDir , iniFileName := "settings" ){
    section := section??""


    {
        if !(iniFileName ~= "([a-zA-Z1-9])+\.ini$"){
            iniFileName .= ".ini"
        }

        if !(iniFileName ~= "(^\/)|(^\\)")
            iniFileName := "\" . iniFileName
    }



    adminCounter(){
        MsgBox "the script has no permission to read the file (higher privileges needed)"
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
            path := path . iniFileName
    }
    else if 1 == path ~= "\b[a-zA-Z]\:\b"{
        path := path
    }
    else{
        path := A_ScriptDir . iniFileName
    }


    ;read teh file
    try {
        return IniRead(path, section, masterKey)
    }catch Error as e
        {
            ; MsgBox e.Message
            if e.Message ~= "i)Access is denied"
                adminCounter()
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
                                adminCounter()
                            }
                    }
                }
                else if e.Message ~= "i)Access is denied"{
                    adminCounter()
                }else{
                    MsgBox e.Message
                }
            }
            return defaultValue
        }

}

