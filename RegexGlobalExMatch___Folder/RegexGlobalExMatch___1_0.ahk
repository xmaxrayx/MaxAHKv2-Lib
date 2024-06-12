; #Requires AutoHotkey v2.0
; #SingleInstance Force

;lazy work not optimized for CPU


;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 09:59:22  on 12/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
; text :=' 
;     (
;     C:\Users\Max_Laptop\AppData\Local\Programs\Python\Python310
;     C:\Users\Max_Laptop\AppData\Local\Programs\Python\Python312
;     C:\Users\Max_Laptop\AppData\Local\Programs\Python\Python36
;     C:\Users\Max_Laptop\AppData\Local\Programs\Python\Python37
;     )'

    



; MsgBox(RegexGlobalExMatch___1_0(text,"\/|\\Python[0-9]+" , 1))    ; MsgBox text{}

RegexGlobalExMatch___1_0(text,RegexExpression, convertResult_to_String:=0){

    regexResult := 0
    ball := 0
    regexMatch__es:= []
    while RegExMatch(text, RegexExpression, &ball){
        RegExMatch(text, RegexExpression, &ball)
        text := RegExReplace(text,RegexExpression, "", ,1)
        regexMatch__es.Push(ball[])
    }

    if convertResult_to_String{

        i := 1
        final_RegexMatchesResult := ""
        loop regexMatch__es.Length{
            final_RegexMatchesResult .= regexMatch__es[i] . "`n"
            i++
        }
        return final_RegexMatchesResult
            ; final_RegexMatchesResult .= ball[i] . "`n"
        
    }   

    return regexMatch__es

}