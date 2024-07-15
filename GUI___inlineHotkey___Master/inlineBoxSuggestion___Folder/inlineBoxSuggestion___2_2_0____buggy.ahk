#Requires AutoHotkey >=2.1- <3.0
; #SingleInstance Force                                                                                                                                                                                           

#Include <maxray\others\Tebayaki\GetCaretPosEx> ;https://github.com/Tebayaki/AutoHotkeyScripts





inlineBox_object := inlineBox()  ;

a::
::/h::{
    inlineBox_object([
        "Welcome to the Customer Service. My name  is Alex the Dapper , the best dapping performance in the world. see you later."
        ,"Hi. How are you? fine thank you goodbye!"
        ,"hi five , how i can help you?"
        ,"Hi, im sleeping rn good bye, thanks for contacting best customer servers"
        ,1+1
        ,2+9/2*77
        ,FormatTime("dddd MMMM d, yyyy hh:mm:ss tt")
        ,"Time Is :`n" FormatTime("dddd MMMM d, yyyy hh:mm:ss tt")
        ,7777
        ,"i`ni`ni`n`ti"
        
        
    ]
    ,
    , "Choose1 W550" 
    
    )

}


#HotIf WinActive(inlineBox_object._inlineBox__GUI)

greetingSentence__Array := [
"howdy?" ,"Wasup?" ,"Hi","yoohoo"
,"greating?" ,"1011111010100101001010,"
,"#@@#$#@" , "💢💢💢" ,":3"
,"୧(๑•̀ᗝ•́)૭" , "⸜(｡˃ ᵕ ˂ )⸝♡", "(˶ᵔ ᵕ ᵔ˶)"
]


F1::{
    MsgBox(
        ;//msg
        greetingSentence__Array[
            Random(1,greetingSentence__Array.Length)
        ]
        ",`n  you select :`n"
        inlineBox_object._List_inlineBox__Listbox.Text

        ,"Attention!"

        ,"0x40"
    )

}



F2::{
    MsgBox(
            inlineBox_object
                    ._List_inlineBox__Listbox
                        .Text
            )
}


F3::MsgBox(inlineBox_object._List_inlineBox__Listbox.Text)


BackSpace::
Esc::{
    inlineBox_object.Destroy()
}














class inlineBox {

    _inlineBox__GUI := 0
    _List_inlineBox__Listbox := 0
    _List__ArrayObject := 0
    _ListOption := ""
    _listbox__Hwnd := 0
    ; _x := 0
    ; _y := 0


    Call(
    List__ArrayObject := [1,2,3,"777","car" , 9/3] 
    ,actionForExitedWindow := "Kill"
    ,ListOption := ""
    ,Darkmode := 0
    ,maxRow := 0
    ,autoShow := 1
    ){
  
        if (this._inlineBox__GUI??0){

            if(actionForExitedWindow  ~= "i)Kill"){
                this._inlineBox__GUI.Destroy()
                this._inlineBox__GUI := 0
                return
            }
            
            else if (actionForExitedWindow  ~= "i)move"){
                ;!?
            }
        } 

        {   ;//setter
        this._ListOption := ListOption
        this._List__ArrayObject := List__ArrayObject
        }


        this._inlineBox__GUI :=  Gui()
        this._inlineBox__GUI.Opt("-Caption +ToolWindow +AlwaysOnTop")
        this._inlineBox__GUI.MarginX := 0
        this._inlineBox__GUI.MarginY := 0
        

        
        if maxRow == 0{
            maxRow := this._List__ArrayObject.Length
            maxRow := " r" maxRow
        }
        

        this._List_inlineBox__Listbox := this._inlineBox__GUI.AddListBox( this._ListOption . maxRow ,this._List__ArrayObject)
        this._List_inlineBox__Listbox.OnEvent("DoubleClick" , _List_inlineBox__Listbox___DoubleClick)

        Hwnd := this._List_inlineBox__Listbox.Hwnd


        RemoveListViewSelectionBorder(Hwnd) {   ; by tmplinshi from v1 https://www.autohotkey.com/boards/viewtopic.php?p=49507#p49507
            static WM_CHANGEUISTATE := 0x127
                , WM_UPDATEUISTATE := 0x128
                , UIS_SET := 1
                , UISF_HIDEFOCUS := 0x1
                , wParam := (UIS_SET << 16) | (UISF_HIDEFOCUS & 0xffff)    ; MakeLong
          
            DllCall("PostMessage", "UInt", Hwnd, "UInt", WM_CHANGEUISTATE, "UInt", wParam, "UInt", 0)  
        }





        this._inlineBox__GUI.Add('Button', 'y-30 x-20 Default')
        .OnEvent('Click', secretButton___Click)
        
        secretButton___Click(*) {    
            A_Clipboard := (this._List_inlineBox__Listbox.text)
            this.Destroy()
            Sleep(50)
            SendInput("^v")

        }

        
        if autoShow??1 == 1{
            this.Show()
        }

        _List_inlineBox__Listbox___DoubleClick(ListBox,*){
            A_Clipboard := (this._List_inlineBox__Listbox.text)
            this.Destroy()

        }



    }

    Destroy(){
        this._inlineBox__GUI.Destroy()
        this._inlineBox__GUI:=0
    }
    
    Show(){



        GetCaretPosEx(&x ,,,&y )
        if !(x??0){
            MouseGetPos(&x)
        }

        if !(y??0){
            MouseGetPos(,&y)
        }

        
        
        
        


        this._inlineBox__GUI.Show("x" x " y" y " AutoSize")
        Hwnd := this._List_inlineBox__Listbox.Hwnd


        RemoveListViewSelectionBorder(Hwnd) {   ; by tmplinshi from v1 https://www.autohotkey.com/boards/viewtopic.php?p=49507#p49507
            static WM_CHANGEUISTATE := 0x127
                , WM_UPDATEUISTATE := 0x128
                , UIS_SET := 1
                , UISF_HIDEFOCUS := 0x1
                , wParam := (UIS_SET << 16) | (UISF_HIDEFOCUS & 0xffff)    ; MakeLong
          
            DllCall("PostMessage", "UInt", Hwnd, "UInt", WM_CHANGEUISTATE, "UInt", wParam, "UInt", 0)  
        }
        




    }



    
}