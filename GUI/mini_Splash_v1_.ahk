
;#Requires AutoHotkey v2.0
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 12:29:26  on 2/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}

mini_splash_v1("c:\Users\Max_Laptop\Programming\Github\xMaxrayx_Github\MaxWorkstaion-Rev1\old\KeyRemap\Windows\copyrighted-picture\done_cat.jpg","UL",,10,50)



class mini_splash_v1 {
    picture := ""
    size := "H240 W240"
    location := "H0 W0"
    guiID := unset

    static Call(picture,location:= 0, size := "H240 W240" , FadeEffect_Out := 0, FadeEffect_out__time := 50 ) => this._show(picture,location, size ,FadeEffect_Out , FadeEffect_out__time )
    


    static _show(picture,location?, size := "H240 W240" , FadeEffect_Out:=0, FadeEffect_out__time := 50) {
        
    s := Gui("+E0x20 -Caption +LastFound +ToolWindow ")
    s.MarginX := 0
    s.MarginY := 0
    s.AddPicture(size ,picture)

    

    switch location, 0 {
        case  "ul":
            __location := "y0 x0"

        case "lc":
            ; MsgBox
            __location := "y" (A_ScreenHeight/2)-picture_Height  " x0"
        
        case "ll":
            __location := "y0 x" (A_ScreenWidth/2)-120


            default:

            __location :=  ""
    } 






    s.Show("NoActivate " __location,)
    i := FadeEffect_Out
    L := 250
    
    this.guiID := WinGetID()
    ; MsgBox(this.guiID)

    while  L > 0{
        WinSetTransparent(L, "ahk_id " this.guiID )
        L := L - i
        Sleep(FadeEffect_out__time)
    
    }
   s.Hide()


    }








    
}

