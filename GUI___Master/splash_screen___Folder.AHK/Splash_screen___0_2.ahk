;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 09:03:01  on 25/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 09:03:01  on 25/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 09:03:01  on 25/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
;[done]do new file
;dont use location agr ;use forced location agr
;
; #Requires AutoHotkey v2.0
; #SingleInstance Force


; image := "c:\Users\Max_Laptop\Programming\Github\xMaxrayx_Github\MaxWorkstaion-Rev1\old\KeyRemap\Windows\copyrighted-picture\done_cat.jpg"
; l := mini_splash___0_2__v()
; l(image,500,300,,,," x500 y66")
; l.show()
; Sleep(500)
; l.hide()


; image := "c:\Users\Max_Laptop\Programming\Github\xMaxrayx_Github\MaxWorkstaion-Rev1\old\KeyRemap\Windows\copyrighted-picture\done_cat.jpg"
; l := mini_splash_v1()
; l.show(image , 400 ,350)
; l.Hide()
; ; l(image, A_ScreenWidth ,  A_ScreenHeight)

; l(image , A_ScreenWidth-500 ,A_ScreenHeight-500)


class mini_splash___0_2__v {
    image := unset
    location := unset
    guiID := unset
    imageSize := unset
    width := unset
    hight := unset
    GUI__objet := unset
    FadeEffect_Out := 10
    FadeEffect_out__time := 25 
    forcedLocationOption := unset
;<<<
    Call(
        image ,width? ,hight?
        ,location?
        ,FadeEffect_Out?
        ,FadeEffect_out__time?
        ,forcedLocationOption := unset
    ){

        if !IsSet(hight) || !IsSet(width){
            imageSize := getImageSize(image)
            hight := hight??imageSize.height
            width  := width??imageSize.width
            this.imageSize := imageSize
            ; MsgBox(imageSize.height '`n' imageSize.width)
            this.hight := imageSize.height
            this.width := imageSize.width
            
        }
    




        if width > A_ScreenWidth{
            width := this.width := A_ScreenWidth
        }
    
    
        if hight > A_ScreenHeight{
           hight:= this.hight :=  A_ScreenHeight
        }

        if IsSet(FadeEffect_Out){
            this.FadeEffect_Out := FadeEffect_Out
        }

        if IsSet(FadeEffect_out__time){
            this.FadeEffect_out__time := FadeEffect_out__time
        }

        if IsSet(forcedLocationOption){
            this.forcedLocationOption := forcedLocationOption
        }


    this.image := image
    this.width := width??unset
    this.hight := hight??unset
    this.location := location??unset
    this._____show(
        image, width??unset , hight??unset
        ,location?
        ,FadeEffect_Out?
        ,FadeEffect_out__time? 
    )


    getImageSize(imagePath){ ;original https://github.com/Masonjar13/AHK-Library/blob/master/Lib/getImageSize.ahk
        splitPath(imagePath,&fN,&fD)

        oS:=ComObject("Shell.Application")
        oF:=oS.namespace(fD?fD:a_workingDir)
        oFn:=oF.parseName(fD?fN:imagePath)
        size:=strSplit(oFn.extendedProperty("Dimensions"),"x"," ?" chr(8234) chr(8236))
        if size[1] > A_ScreenWidth{
            widthN :=  A_ScreenWidth
        }else{
            widthN := size[1]
        }



        if size[2] > A_ScreenHeight{
            hightN := A_ScreenHeight
            
        }else{
            hightN := size[2]
        }


        return {width: widthN,height: hightN}
    }





    
}
;>>>


    show(
        image := this.image ,width:=this.width ,hight:=this.hight
        ,forcedLocationOption?
        ,FadeEffect_Out?
        ,FadeEffect_out__time?
    ) {

        if IsSet(FadeEffect_Out){
            this.FadeEffect_Out := FadeEffect_Out
        }

        if IsSet(FadeEffect_out__time){
            this.FadeEffect_out__time := FadeEffect_out__time
        }
        A := this.forcedLocationOption??unset
        ; forcedLocationOption := this.forcedLocationOption??unset
        if IsSet(forcedLocationOption) || IsSet(A){
            forcedLocationOption := forcedLocationOption??A
            
            this.GUI__objet.Show("NoActivate " forcedLocationOption  )
        }else{
            
            this.GUI__objet.Show("NoActivate " this.location )

        }

    /*
    this.image := image??unset
    this.width := width??unset
    this.hight := hight??unset
    this.location := location??unset
    this._____show(
        image, width? , hight?
        ,location?
        ,FadeEffect_Out?
        ,FadeEffect_out__time? 
    )
    */
}


    hide(AutoKill := 1){

        
        if this.FadeEffect_Out > 0{
            /*
            I_counter := this.FadeEffect_Out
            i_transparentFade := this.FadeEffect_out__time??50
            ; lll := WinGetID(this.GUI__objet)
            f := I_counter / i_transparentFade
            while I_counter > 0{
                f := 250 - f
                f := Integer(f)
                
                ; WinMove(-1 , -1,,,this.GUI__objet)
                WinSetTransparent(f, this.GUI__objet)
                I_counter--
                ; MsgBox(i)
            }
                */


            i_counter := this.FadeEffect_Out
            
            i_transparentLevel := 255
            
            this.guiID := WinGetID(this.GUI__objet)
            ; MsgBox(this.guiID)
        
            while  i_transparentLevel > 0{
                WinSetTransparent(i_transparentLevel , "ahk_id " this.guiID )
                i_transparentLevel := i_transparentLevel - i_counter
                Sleep(this.FadeEffect_out__time??10)
            
            }





        }

        this.GUI__objet.Hide()
        if AutoKill{
            this.GUI__objet.Destroy()
        }
    }




    _____show(
        image ,width? ,hight?
        ,location?
        ,FadeEffect_Out:=0
        ,FadeEffect_out__time := 50
        ,AutoShow := 0
    ){
        
        this.image := image




    
    if !IsSet(hight) || !IsSet(width){
        imageSize := getImageSize(image)
        hight := hight??imageSize.height
        width  := width??imageSize.width
        this.imageSize := imageSize
        ; MsgBox(imageSize.height '`n' imageSize.width)
        this.hight := imageSize.height
        this.width := imageSize.width
        
    }





    if this.width > A_ScreenWidth{
        this.width := A_ScreenWidth
    }


    if this.hight > A_ScreenHeight{
        this.hight :=  A_ScreenHeight
    }

    
    this.GUI__objet := Gui("+E0x20 -Caption +LastFound +ToolWindow ") 

    
    switch location??0, 0 {
        case  "ul":
            splashScreen_gui__location := "y0 x0"
            

        case "lc": ;good standing
            ; MsgBox
            splashScreen_gui__location 
                := "y" (A_ScreenHeight/2)-(hight -2)  " x0"
        
        case "ll":
            splashScreen_gui__location 
                := "y" (A_ScreenHeight  - hight)  ;)
            MsgBox(hight)

            default:
                splashScreen_gui__location 
                    := "Center"
    }

    this.location := splashScreen_gui__location

    
    this.GUI__objet.MarginX := 0 
    this.GUI__objet.MarginY := 0
    ; SplashScreen_GUI.AddPicture("y" hight " x" width , image )
    this.GUI__objet.Add("Picture" , "w" width " h" hight , image)
    
    if AutoShow{
        this.GUI__objet.Show("NoActivate " splashScreen_gui__location,)
    }
    
    i := FadeEffect_Out

    
    this.guiID := WinGetID(this.GUI__objet)



    ;//////////////////////////////////////////////////
    ;func
    ;//////////////////////////////////////////////



    getImageSize(imagePath){ ;original https://github.com/Masonjar13/AHK-Library/blob/master/Lib/getImageSize.ahk
        splitPath(imagePath,&fN,&fD)

        oS:=ComObject("Shell.Application")
        oF:=oS.namespace(fD?fD:a_workingDir)
        oFn:=oF.parseName(fD?fN:imagePath)
        size:=strSplit(oFn.extendedProperty("Dimensions"),"x"," ?" chr(8234) chr(8236))
        if size[1] > A_ScreenWidth{
            widthN :=  A_ScreenWidth
        }else{
            widthN := size[1]
        }



        if size[2] > A_ScreenHeight{
            hightN := A_ScreenHeight
            
        }else{
            hightN := size[2]
        }


        return {width: widthN,height: hightN}
    }









    }






}