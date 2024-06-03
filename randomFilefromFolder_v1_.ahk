

;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 19:02:10  on 3/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}

; #Requires AutoHotkey v2.0
; #SingleInstance Force


; original code from ahk docomnation

; PlayMusicFolder("C:\Users\Max_Laptop\Programming\Github\xMaxrayx_Github\MaxWorkstaion-Rev1\KeyRemap\windows\Assists\rembg\done the rembg")
; MsgBox randomFile("C:\Users\Max_Laptop\Programming\Github\xMaxrayx_Github\MaxWorkstaion-Rev1\KeyRemap\windows\Assists\rembg\done the rembg")

randomFileFromFolder_v1_(folder , fileFormat := "wav"){

    listFiles := []
    Loop Files, folder "\*." fileFormat , "R" 
        {
            listFiles.Push(A_LoopFilePath)
           
        }

        return  (listFiles[Random(1 , listFiles.Length)])
        


}