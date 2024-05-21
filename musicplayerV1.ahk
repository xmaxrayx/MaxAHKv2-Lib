#Requires AutoHotkey  <v2.1

;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 20:28:22  on 20/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}






class musicPlayer {
    musicPlayer__PID := unset
    musicplayer__path := unset

    start(path?, enableLoop := false, loopTime := 0 ) {
        musicPlayer__PID := ""
        if enableLoop == false
            enableLoop := 0
        
        musicplayer__path := musicplayer__path??unset
        if !IsSet(path) && isSet(musicplayer__path)
            path  := this.musicplayer__path??unset
        musicplayer__path := this.musicplayer__path

        ; this.musicPlayer__PID
        
        Run('"musicplayerV1.py"' ' "' path '"' ' "' enableLoop '"' ' "' loopTime '"' , , "Hide" ,&musicPlayer__PID )
        this.musicPlayer__PID := musicPlayer__PID
        


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


