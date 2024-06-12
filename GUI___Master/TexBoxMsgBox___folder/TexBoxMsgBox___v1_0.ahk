; #Requires AutoHotkey v2.0
; #SingleInstance Force
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 19:44:46  on 11/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 20:31:34  on 11/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}



; #Include <maxray\listOfFolder___folder\listOfFolder___v0.1>
; a := 1
; a:=listOfFolder___v0_1("C:\Users\Max_Laptop\AppData\Local\Programs\Python",2)
; MsgBox a
; TexBoxMsgBox___v1_0(a)
; a := StrReplace(a, "`n","`r`n")
; TexBoxMsgBox___v1_0(a,,,,,1)





TexBoxMsgBox___v1_0(text,title := A_ScriptName ,GuiWidth := A_ScreenWidth/4, GuiHight := A_ScreenHeight/3.5 ,fixNewLine := true ,moreLine := 0, Gui_ShowOption := "center"){
    TextBox__GUI__ := Gui(,title)
    if fixNewLine == 1{

        if moreLine ==1 {
            text := StrReplace(text, "`n","`r`n`r`n")
        }else{
            text := StrReplace(text, "`n","`r`n")

        }
    }
    

    textBox_Edit_GUI := TextBox__GUI__.add('Edit'," +Multi ReadOnly w" GuiWidth " h" GuiHight)
    textBox_Edit_GUI.Text := text
    TextBox__GUI__.Add("Button","x" ((GuiWidth/2)-10) " w50 h30", "OK").OnEvent('Click', (*)=> TextBox__GUI__.Destroy())

    TextBox__GUI__.Show(Gui_ShowOption)    
}