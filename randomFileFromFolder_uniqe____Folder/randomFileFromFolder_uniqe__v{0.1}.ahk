
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 02:33:55  on 8/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}

;  v1.0

; #Requires AutoHotkey v2.0
; #SingleInstance Force




; MsgBox randomFileFromFolder_unique__v1_0("C:\Users\Max_Laptop\Programming\Github\xMaxrayx_Github\MaxWorkstaion-Rev1\KeyRemap\windows\Assists\rembg\done the rembg",,"i){gumi}")


randomFileFromFolder_unique__v0_2(folder , fileFormat := "wav" , RegexAvoidExpress := ""){

    listFiles := []
    Loop Files, folder "\*." fileFormat , "R" 
        {

            name := A_LoopFilePath

            if !(name ~= RegexAvoidExpress){
                listFiles.Push(name)
            }

        }

        A := (listFiles[Random(1 , Integer(listFiles.Length))])
        return A
        ; return  (listFiles[Random(1 , listFiles.Length)])


}   