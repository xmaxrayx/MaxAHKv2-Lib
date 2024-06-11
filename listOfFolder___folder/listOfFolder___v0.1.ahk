;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 19:26:31  on 11/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}

; #Requires AutoHotkey v2.0
; #SingleInstance Force

; MsgBox listOfFolder___v0_1("C:\Users\Max_Laptop\AppData\Local\Programs\Python", 1)

listOfFolder___v0_1(folder, mode := 1){
    folderList := ""
    if mode == 1{
        loop files, folder "\*" , "D"
            folderList .= A_LoopFileFullPath    "`n"
    }else if mode == 2{
        loop files, folder "\*" , "R"
            folderList .= A_LoopFileFullPath "`n"
    }else if mode == 3{
        loop files, folder "\*" , "DR"
            folderList .= A_LoopFileFullPath "`n"
    }
    return folderList
}