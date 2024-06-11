; #Requires AutoHotkey v2.0
; #SingleInstance Force


;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 18:02:29  on 10/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}


global AHK__python_Musicplayer_py__path := "C:\Users\Max_Laptop\Documents\AutoHotkey\Lib\maxray\musicplayerV1.py"



; l := randomPickAndPlay___v0_1()

; k:: l.play("C:\Users\Max_Laptop\Programming\Github\xMaxrayx_Github\MaxWorkstaion-Rev1\KeyRemap\blender\Assists\Opening Blender")


class  randomPickAndPlay___v0_1{
    avoidName_str := ""
    randomFile := ""
    toggle := 1
    playMethod := 1
    avoidName_ref := unset
    regexExpression := "{.+}"


    ; folder := "C:\Users\Max_Laptop\Programming\Github\xMaxrayx_Github\MaxWorkstaion-Rev1\KeyRemap\blender\Assists\Opening Blender"
    folder := "A_ScriptDir"
    
    fileFormat := "wav"

    ;/////////////////////////////////////
    musicPlayer__PID := unset
    musicplayer__path := unset





    
    play(folder){


        this.folder := folder
;///////

        if this.toggle == 1 {
            this.randomFile := this._randomFileFromFolder_v1_(this.folder)


            if RegExMatch(this.randomFile, "{.+}",&this.avoidName_ref) {
                this.avoidName_str :=  (this.avoidName_ref[0])
            }else{

                this.avoidName_str := this.randomFile
                this.avoidName_str := this._regexConvert(this.avoidName_str)
            }

        if this.playMethod == 1 {
            ; this.play_start(randomFile)
            ;MsgBox (this.randomFile)
            this._Play_start(this.randomFile)
        }




            this.toggle := 0
        }else{

             L  := this.avoidName_str


            if L{                                ;IsSet(this.avoidName_str){ ;?this.HasOwnProp
                ; MsgBox "yes"
                this.randomFile := this._randomFileFromFolder_unique__v1_0(this.folder, this.fileFormat , "i)" . this.avoidName_str)
                
            }else{
                ; MsgBox " no avoidName_str"
                ; MsgBox this.avoidName_str
                this.randomFile := this._randomFileFromFolder_v1_(this.folder)
            }

            L := unset

            ; MsgBox this.randomFile

            this._Play_start(this.randomFile)


            if RegExMatch(this.randomFile, "{(.)+}",&this.avoidName_ref) {
                this.avoidName_str :=  (this.avoidName_ref[0])
            }else{

                this.avoidName_str := this.randomFile
                this.avoidName_str := this._regexConvert(this.avoidName_str)
            }

        }


       







    }


    
        _Play_start(path?, enableLoop := false, loopTime := 0 , hide:= true , waitEnd := false) {
            this.musicPlayer__PID := ""
            if enableLoop == false
                enableLoop := 0

            if hide == true
                hide__Opt := "Hide"
            else
                hide__Opt := "Show"
    
    
    
            global AHK__python_Musicplayer_py__path
            
            ; Run('"' s '"' ' "' path '"' ' "' enableLoop '"' ' "' loopTime '"' , , "Hide" ,&musicPlayer__PID )
            Run('"' AHK__python_Musicplayer_py__path '"' ' "' path '"' ' "' enableLoop '"' ' "' loopTime '"' , , hide__Opt ,&musicPlayer__PID )
            this.musicPlayer__PID := musicPlayer__PID
    
    
    
            if waitEnd == true
                ProcessWaitClose(this.musicPlayer__PID)
            
    
    
        }
        
    
    
    
    
        play_close(Pid?) {
            if !IsSet(Pid){
                if !ProcessExist(this.musicPlayer__PID)
                    ProcessWait(this.musicPlayer__PID, 10)
                ProcessClose(this.musicPlayer__PID)
            }else{
                ProcessClose(Pid)
            }
    
    
        
    
    
    }

    
;//////////////////////////setter and getter ;?

; folder{
;     set{
;         this.folder := Value
;     }
; }


;//////////////////////////////////////////////

    _randomFileFromFolder_v1_(folder , fileFormat := this.fileFormat , debug := 0){

        listFiles := []
        Loop Files, folder "\*." fileFormat , "R" 
            {
                listFiles.Push(A_LoopFilePath)
            }
            if debug == 1 
                MsgBox (listFiles[Random(1 , listFiles.Length)])
            return  (listFiles[Random(1 , listFiles.Length)])
    }


    _randomFileFromFolder_unique__v1_0(folder , fileFormat := "wav" , RegexAvoidExpress := unset){


        if !IsSet(RegexAvoidExpress){
            MsgBox "Erorr there isn't a RegexAvoidExpress 15113153"
            return
        }


        listFiles := []
        Loop Files, folder "\*." fileFormat , "R" 
            {

                name := A_LoopFilePath

                if !(name ~= RegexAvoidExpress){
                    listFiles.Push(name)
                }

            }

            A := (listFiles[Random(1 , listFiles.Length)])
            return A
            ; return  (listFiles[Random(1 , listFiles.Length)])


    }

    _regexConvert(text){
        text := RegExReplace(text, "\\|\/" , "\\")
        text := RegExReplace(text, "\." , "\.")
        return text
    }


}