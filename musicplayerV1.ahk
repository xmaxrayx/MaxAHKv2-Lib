#Requires AutoHotkey v2.0
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 20:28:22  on 20/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}


;===================================================================
global AHK__python_Musicplayer_py__path := (RegExReplace(A_LineFile, "musicplayerV1\.ahk", ""))

global AHK__python_Musicplayer_py__path .= "musicplayerV1.py"
;==============================================================
; MsgBox(A_LineFile)

 


class musicPlayer {
    musicPlayer__PID := unset
    musicplayer__path := unset

    start(path?, enableLoop := false, loopTime := 0 , hide:= true , waitEnd := false) {
        musicPlayer__PID := ""
        if enableLoop == false
            enableLoop := 0
        
        ; musicplayer__path := this.musicplayer__path??unset
        ; if !IsSet(path) && isSet(musicplayer__path)
        ;     path := this.musicplayer__path
        ; this.musicPlayer__PID
        
        if hide == true
            hide__Opt := "Hide"
        else
            hide__Opt := "Show"



        global AHK__python_Musicplayer_py__path
        
        ; Run('"' s '"' ' "' path '"' ' "' enableLoop '"' ' "' loopTime '"' , , "Hide" ,&musicPlayer__PID )
        Run('"' AHK__python_Musicplayer_py__path '"' ' "' path '"' ' "' enableLoop '"' ' "' loopTime '"' , , hide__Opt ,&musicPlayer__PID )
        this.musicPlayer__PID := musicPlayer__PID



        if waitEnd == true
            ProcessWaitClose(musicPlayer__PID)
        


    }

    setPath(path){
        this.musicplayer__path := path
    }



    close(Pid?) {
        if !IsSet(Pid){
            if !ProcessExist(this.musicPlayer__PID)
                ProcessWait(this.musicPlayer__PID, 10)
            ProcessClose(this.musicPlayer__PID)
        }else{
            ProcessClose(Pid)
        }


    }


}


