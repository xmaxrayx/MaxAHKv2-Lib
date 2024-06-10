
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 11:25:04  on 10/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}




; l := indicator_GUI__v1_0()

; l.show( "Waring" , "2fff00",,, 100)
; Sleep 500


; l.change("ok","ff003c")

; Sleep 500
; l.close()




class indicator_GUI__v0_1{


    id := unset
    text := unset
    color := unset
    Indicator__text := ""
    Indicator__color := ""
    AHK_Indicator__GUI := Gui("+E0x20 -Caption +LastFound +ToolWindow +AlwaysOnTop")


    show(text := "Waring" ,color := "2fff00",location_X := 10 , location_Y := (A_ScreenHeight/3.5) , TransparentVAlue := 255 ){
    AHK_Indicator__GUI:= this.AHK_Indicator__GUI
    ; AHK_Indicator__GUI := Gui("+E0x20 -Caption +LastFound +ToolWindow +AlwaysOnTop")
    WinSetTransparent(TransparentVAlue)
    ; AHK_Indicator__GUI.BackColor := color
    this.Indicator__text := AHK_Indicator__GUI.Add("Text", , text)
    AHK_Indicator__GUI.BackColor := color
    
    AHK_Indicator__GUI.Show("y" location_Y " x" location_X )

    this.id := WinGetID()
    
    ;///////////////////
    this.text := text
    this.color := color
    
    }
    change(Text? , color?){
        if IsSet(Text){
            this.Indicator__text.text := Text
            ; this.AHK_Indicator__GUI.Redraw
        }

        if IsSet(color){
            this.AHK_Indicator__GUI.BackColor := color
        }


        

    }

    close()
    {
        WinKill("ahk_id " this.id)
    }


    
    ;/////////////////// setter and getter

    ; pid {
    ;     set{
    ;         this.pid := value
    ;     }
    ;     get{
    ;         return this.pid
    ;     }
    ; }
    ; text {
    ;     set{
    ;         this.tex := value
    ;     }
    ;     get{
    ;         return this.tex
    ;     }
    ; }
    ; color {
    ;     set{
    ;         this.color := value
    ;     }
    ;     get{
    ;         return this.color
    ;     }
    ; }



}







/*

{   ;gui initialization
    AHK_capsIndicatorGUI := Gui("+E0x20 -Caption +LastFound +ToolWindow +AlwaysOnTop","AHK_capsstatus")
    WinSetTransparent(250)
    AHK_capsIndicatorGUI.BackColor := "2fff00"
    capsStatus := AHK_capsIndicatorGUI.Add("Text", , inspectCapsStatus_for_AHK_capsIndicatorGUI())
    AHK_capsIndicatorGUI.Show("y" A_ScreenHeight/3.5 " x" 10 ,)
    if !GetKeyState("CapsLock", "T"){
        AHK_capsIndicatorGUI.Hide()
    }
}



inspectCapsStatus_for_AHK_capsIndicatorGUI(){
    if GetKeyState("CapsLock", "T") {
        AHK_capsIndicatorGUI.BackColor := "22ff00"
        SoundBeep
        return "Capslock  On"
    }else{
        AHK_capsIndicatorGUI.BackColor := "fc0000"
        AHK_capsIndicatorGUI.Hide()
        return "Capslock OFF"
    }
}

*/