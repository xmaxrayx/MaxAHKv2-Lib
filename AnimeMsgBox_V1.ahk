#Requires AutoHotkey v2.0
/************************************************************************
 * @description  A more customizable MsgBox
 * @file CustomMsgBox.ahk
 * @author xMaxrayx
 * @date 2023/09/12
 * @version 0.0.3
 ***********************************************************************/

#Requires AutoHotkey v2.0
#SingleInstance Force

;add these

/*
ForceWaitt

*/



;we need to work on "option"

global defaultCustomMsgBoxImagePFP := "C:\Users\max\Desktop\utau utane1 small.jpg"
global defaultCustomMsgBoxImageBackground := "C:\Users\max\Pictures\Pictures Max\light_gray.png"
; global defaultTextMainFontOptions := "c464668 s10 "
; global defaultTextMainFont := "Segoe UI"
global defaultTextMainFontOptions := "s8 Norm cBlack"
global defaultTextMainFont := "Segoe UI"

global forceExtended := 1
global defaultForceWait := true

;OptionDetecter

/*
ErrorMessageShow()
ErrorMessage()
ErrorMessageExtended()
*/
; CustomMsgBox.Mini("Hi I love you")
; CustomMsgBox.Mini( " Can't escape `n Error: 777", "a Secret" , , , ,true )
; CustomMsgBox("ggggggggggggggggggggggggg ghhhhhhhhhhhhhhhhhh")

;MsgBox("hello")



; CustomMsgBox.Mini("yay wtf your doing around wondeing?")
; CustomMsgBox.Mini("Does love really exits or its fake? `nI think it's a unressteble as bait for human trap? 'mayb'")
; CustomMsgBox.Mini("Baka it's fake it won't be happened unless you are rich or famous sinpia ")
; ;Sleep(1000)
; CustomMsgBox.mini("Stop belive in non-sense senpai and stop watching too much anime senpai")
; CustomMsgBox.Mini("but hi love you")
; CustomMsgBox.Mini("may I cant see you senpai promise me dont be stupid and watch yourself")
; CustomMsgBox.Mini("good bye i will miss you sinpai")


class CustomMsgBox {
    __New(text := "Click Ok to continue" , title := A_ScriptName , 
    option? ,imagePFP := defaultCustomMsgBoxImagePFP , 
    imageBackground := defaultCustomMsgBoxImageBackground , addCopyButton := false) {
        
        ; text := text?? "Click Ok to continue"
        ; title := title?? A_ScriptName
        ; imagePFP := imagePFP??  defaultCustomMsgBoxImagePFP
        ; imageBackground := imageBackground?? defaultCustomMsgBoxImageBackground
        ; addCopyButton := addCopyButton?? False



        ErrorMessage_Fuc(text , title, imagePFP, imageBackground, False , addCopyButton)
        
    } ;end of _New of "CustomMsgBox"

    class Mini {
        __New(text? , title? , option? ,imagePFP?, imageBackground? , addCopyButton?) {
            text := text?? "Click Ok to continue"
            title := title?? A_ScriptName
            imagePFP := imagePFP??  defaultCustomMsgBoxImagePFP
            imageBackground := imageBackground?? defaultCustomMsgBoxImageBackground
            addCopyButton := addCopyButton?? False


            ErrorMessage_Fuc(text , title, imagePFP, imageBackground, true , addCopyButton)
        }

        static NonStop(text? , title? , option? ,imagePFP?, imageBackground? , addCopyButton?) {
            text := text?? "Click Ok to continue"
            title := title?? A_ScriptName
            imagePFP := imagePFP??  defaultCustomMsgBoxImagePFP
            imageBackground := imageBackground?? defaultCustomMsgBoxImageBackground
            addCopyButton := addCopyButton?? False


            ErrorMessage_Fuc(text , title, imagePFP, imageBackground, true , addCopyButton, , , false) 

        }



        
    }
} ;end of Main class "CustomMsgBox"





;global ErrorMessageText := "Tell a programmer : Cant save baka id  `n`n`nError 120aaedwa"
;global ErrorMessageText := "I love you"
;global ErrorMessageText := "I want to see you in mee garbage lol alo ke d  dk dkd kd lspss;s; d;s djejesi d skdjskdjksd al s sjk  tshis shjs sthis is last word"

;ErrorMessageExtended()

/*
global text := "lol"
global title := "Error" ;Warning ;Info
global imageBackground := "C:\Users\max\Pictures\Pictures Max\light_gray.png"
global imagePFP := "C:\Users\max\Desktop\utau utane1 small.jpg"
global isMini := false
global forceExtended := 2
*/



;global ErrorMessageText
;ErrorMessageShow()

ErrorMessageMiniShow()
{
    global isMini := true
    ErrorMessageShow_Func()
}

ErrorMessageShow_Func(){
global title := A_ScriptName
global ErrorMessageBackground := "C:\Users\max\Pictures\Pictures Max\light_gray.png"
global isMini := true
ErrorMessage_Fuc()
}


ErrorMessage_Fuc(text? , title?, imagePFP? , imageBackground?  ,isMini? , addCopyButton? ,fontName? ,fontOptions? , forceWait?){
    
    fontName := fontName?? defaultTextMainFont
    fontOptions := fontOptions?? defaultTextMainFontOptions



    ;======================================
    ;gui build 
    ;====================================
    local WidthLengthVariable := WidthLength(text , isMini)
    local CustomMsgBoxWidth := WidthLengthVariable+10
    local MyGuiHight := 149
    

  
    CustomGui := Gui()
    
    
    CustomGui.AddPicture("x8 y11 w81 h82" , imagePFP)
    CustomGui.AddPicture("x0 y" . (MyGuiHight - 45) . "  w" . CustomMsgBoxWidth . " h45" , imageBackground)
    textMain:= CustomGui.AddText("x103 y17 w" . (WidthLengthVariable - 105) . " h75 Wrap", text)
    textMain.SetFont( defaultTextMainFontOptions, defaultTextMainFont)
    ;CustomGui.AddPicture("x-1 y100 w489 h100" , imageBackground)
    OkButton := CustomGui.AddButton( "x" . (WidthLengthVariable - (WidthLengthVariable/2.5) ) . " y113  w" . (WidthLengthVariable/2.5) . " h27 Default" ,"OK") 
    ;OkButton.MarginY(-100)
    
    CustomGui.Opt(" -MinimizeBox -MaximizeBox AlwaysOnTop")
    CustomGui.Title := ErrorMessageTitleMath(title)
    ;MyGui.MarginY -= 99
    ;MsgBox MyGui.MarginY
    CustomGui.Show("Center w" . CustomMsgBoxWidth . "h" . MyGuiHight)
    

    ;== gui build func math call=={
    addCopyButton_GUIBuildMath()
    ; }===============================



    ;=================================
    ;gui build func math
    ;=================================
    
    addCopyButton_GUIBuildMath(){
    if addCopyButton  == true
        {
            CopyButton:= CustomGui.AddButton( "x8 y114 w81 h26 ", "Copy")
            CopyButton.OnEvent("Click",(*) => G_CopyMSG() )

        }
    
        
    }




    
    ;=================================
    ;gui bind
    ;=================================
    OkButton.OnEvent("Click",(*) => G_Destroy())
    
   
    ;=================================
    ;gui x gui func
    ;=================================
    G_Destroy(){
        CustomGui.Destroy()
    }
    G_CopyMSG(){    
    local copyOutput := "==[" . (CustomGui.Title) . "]==" . "`n" . (textMain.Text) . "`n==(End)==" 
    ;+ MsgBox x 
    A_Clipboard := copyOutput
    
    
    }
    ;=================================
    ;gui math func 
    ;=================================
    
    ErrorMessageTitleMath(title)
    {
        
        if title == ""
            {
                title := "Error"
            }
        return title
    }

    
    WidthLength(text , isMini)
    {
        ; global text
        ; global isMini
        if text == "" 
            {
                return 487
            }
        else
            {
                local Width :=  ((StrLen(text)) * 3.5)
                if isMini == true 
                {
                    if 200 > Width { ;safe code for size
                        Width := 200 
                        return Width
                    }
                    else {
                        return Width
                    }
                }
                else
                {
                    if 290 > Width { ;safe code for size
                        Width := 290 
                        return Width
                    }
                    else {
                        return Width
                    }
                }
                
            }
        
    }

    global defaultForceWait
    forceWait := forceWait?? defaultForceWait
    if forceWait == true {
       
        GuiID := (WinGetID("A"))
        WinWaitClose(GuiID)

    }

    


;md
} ;end of func






ErrorMessageExtended(){
    ;======================================
    ;gui build 
    ;====================================
    WidthLengthVariable := WidthLength()
    global forceExtended
    global ErrorMessageBackground
    text := ""
    imagePFP := ""




  
    MyGui := Gui()
    
    MyGui.AddPicture("x-1 y" (100 * forceExtended) " w489 h100", ErrorMessageBackground )
    TextMAin:= MyGui.AddText("x103 y17 w" . (WidthLengthVariable - 105) . " h" (75 * forceExtended) " Wrap", text)
    MyGui.AddPicture("x8 y11 w81 h82", imagePFP)
    OkButton := MyGui.AddButton( "x" . (WidthLengthVariable - (WidthLengthVariable/2.5) ) . " y" (113 * forceExtended) "  w" . (WidthLengthVariable/2.5) . " h27 Default" ,"OK") 
    ;OkButton.MarginY(-100)
    CopyButton:= MyGui.AddButton( "x8 y" (114 * forceExtended) " w81 h26 ", "Copy")
    MyGui.Opt(" -MinimizeBox -MaximizeBox AlwaysOnTop")
    MyGui.Title := ErrorMessageTitleMath()
    ;MyGui.MarginY -= 99
    ;MsgBox MyGui.MarginY
    MyGui.Show("Center w" . (WidthLengthVariable+10) . "h" (149 * forceExtended) "")


    
    ;=================================
    ;gui bind
    ;=================================
    OkButton.OnEvent("Click",(*) => G_Destroy())
    CopyButton.OnEvent("Click",(*) => G_CopyMSG() )
   

    ;=================================
    ;gui x gui func
    ;=================================

    G_Destroy(){
        MyGui.Destroy()
    }

    G_CopyMSG(){
    
    local x := "==[" . (MyGui.Title) . "]==" . "`n" . (TextMAin.Text) . "`n==(End)==" 
    ;+ MsgBox x 
    A_Clipboard := x
    
    

    }


    ;=================================
    ;gui math func 
    ;=================================
    
    ErrorMessageTitleMath()
    {
        global title
        if title == ""
            {
                title := "Error"
            }
        return title
    }

    WidthLength()
    {
        ; global text
        ; global isMini

        if text == "" 
            {
                return 487
            }
        else
            {
                local Width :=  ((StrLen(text)) * 3.5)
                if isMini == true 
                {
                    if 200 > Width { ;safe code for size
                        Width := 200 
                        return Width
                    }
                    else {
                        return Width
                    }
                }
                else
                {
                    if 290 > Width { ;safe code for size
                        Width := 290 
                        return Width
                    }
                    else {
                        return Width
                    }
                }
                
            }
        
    }

;md



} ;end of func


