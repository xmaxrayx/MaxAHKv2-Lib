; #Requires AutoHotkey v2.0
; #SingleInstance Force
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 20:32:13  on 23/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}



;regex global multiline

/*
text :=' 
    (
    C:\Users\Max_Laptop\AppData\Local\Programs\Python\Python310
    C:\Users\Max_Laptop\AppData\Local\Programs\Python\Python312
    C:\Users\Max_Laptop\AppData\Local\Programs\Python\Python36
    C:\Users\Max_Laptop\AppData\Local\Programs\Python\Python37
    )'
RegexGlobalMultiLineExMatch___0_1(text,"Python[0-9]+")
*/




RegexGlobalMultiLineExMatch___0_1(object,regexExpression ,returnAsString := 0 ){
    
    if !(type(Object)='array'){
        Haystack__Array := StrSplit(Object, "`n")
    }

    ;================================
    
    RegExMatchInfo__Array:= []
    i := 1
    v := unset
    loop Haystack__Array.Length{
        if RegExMatch((Haystack__Array[i]),regexExpression,&V){

            if (type(v[0]??0)='string'){
                RegExMatchInfo__Array.push(v[])
    
            }

        }

        ; MsgBox(RegExMatchInfo__Array[i])


        i++
    }
    i := unset
    v := unset
    ;================================

    if !returnAsString {
        return RegExMatchInfo__Array
    }else{
        MsgBox("this future not erady yt")
    }

}

