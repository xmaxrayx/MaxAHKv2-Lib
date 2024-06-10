/************************************************************************
 * @description warning label whole the screen with blink and fade effect
 * @file warning_v1_.ahk
 * @author xmaxrayx Unbreakable-ray
 * @date 2024/05/30
 * @version 1.0.0
 ***********************************************************************/
; #Requires AutoHotkey v2.0

;original by unbreakable-ray converted to function by xmaxrayx (Same person)


; start at @xMaxrayx @Unbreakable-ray   at 11:46:12  on 19/7/2023   (24H Formart)  (UTC +2)
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 16:46:02  on 30/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}



; Gui_Warning_v1("Hello", true, 1000 , true ,+25 )





Warning_label_v1(message, isTransparentWhenBlink:= true , waitBeforeDisappear := 2000 , enableSound := false ,Fix_X_textStartLocation := 0 , Gui_Wrining_COLOR := "0xff0000" ,blinkColor := "0xffb5b5"  ,
fontOption := "s20 Bold cBlack" , fontName := "Calibri"  , BlinkingDurationCycle := 0 , fadeSpeed := 30) {
    ; blinkColor := "0xffb5b5" ;"0x000000"


	MyGui := Gui( , "Warning GUI")
    MyGui.Opt("-Caption -SysMenu +Owner +AlwaysOnTop")
    myGui.BackColor := Gui_Wrining_COLOR
    MyGui.Show(("w" . A_ScreenWidth) "h60" ("y" . (A_ScreenHeight-120)) )

    ;gui content
    MyGui.SetFont(fontOption, fontName)
	txtWarning := MyGui.AddText(("x" . ((A_ScreenWidth/2) - Fix_X_textStartLocation)) " y10 w1000" ,  message )

;==============       =========================================================================================================
;============== Blink =========================================================================================================
;==============       =========================================================================================================
   
; durationCycleForBlink := 6  ;loop for Blink effct
    reverseBlink := true

    while (BlinkingDurationCycle > 0)
        {
            if isTransparentWhenBlink == true{
                WinSetTransparent(255, "Warning GUI")
            }
            Sleep(300)
            BlinkingDurationCycle -= 1
                if (reverseBlink = true)
                    {
                        ;WinSetTransparent(0, "Warning GUI")
                        if (isTransparentWhenBlink == true){
                            WinSetTransparent(20, "Warning GUI")
                        }else{
                            MyGui.BackColor := blinkColor
                        }

                        ;WinSetTransColor(blinkColor , "Warning GUI" )
                        reverseBlink := false
                        ;MsgBox ;tst
                        SoundBeep (1200,150)
                    }
                else
                    {
                        ;WinSetTransparent(250, "Warning GUI")
                        MyGui.BackColor := Gui_Wrining_COLOR
                        reverseBlink := true

                        ;MsgBox "no" ;tst
                    }

        }

;=============={             }==========================================================================================================
;=============={ after Blink }==========================================================================================================
;=============={             }==========================================================================================================

    MyGui.BackColor := Gui_Wrining_COLOR ;safe code
    ;WinSetTransparent(250, "Warning GUI")
    Sleep(waitBeforeDisappear)



;=============               ==========================================================================================================
;==============  fade effect ==========================================================================================================
;==============              ==========================================================================================================

    i := 255 ;loop for transparnet-fade effect
    while (i > 0)
        {
            WinSetTransparent(i, "Warning GUI")
            i -= 10
            sleep(fadeSpeed)

        }
    MyGui.Destroy
  
	Return
}