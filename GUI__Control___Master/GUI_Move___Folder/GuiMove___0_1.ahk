; #Requires AutoHotkey v2.0
; #SingleInstance Force

winMoveRespectTraySystem(x , Y , window){

WinGetPos(, , , &TrayHeight, "ahk_class Shell_TrayWnd")



; height := A_ScreenHeight-485-TrayHeight

;  WinGetPos(&X, &Y, &Width, &Height, )
; MaxX := A_ScreenWidth - Width - 5 ; This will put the Gui to the right of the monitor...adjust the "10" value as needed.
; MaxY := A_ScreenHeight - Height - TrayHeight ; This will put the Gui above the taskbar...adjust the "45" value as needed.


if y == A_ScreenHeight{ 
    y := y - TrayHeight
}
else{
    y := y
}



WinMove(x, y,, , window)

}    
