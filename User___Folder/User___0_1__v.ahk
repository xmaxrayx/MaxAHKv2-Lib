; #Requires AutoHotkey v2.0
; #SingleInstance Force
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 10:09:51  on 30/6/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}





class User {

    static Call(*){
        return this.______work()
    }


    static Download(){
        return this.______work() . "\Downloads"
    }


    static Pictures(){
        return this.______work() . "\Pictures"
    }


    static  Music(){
        return this.______work() . "\Music"
    }

    static Videos(){
         return this.______work() . "\Videos"
    }


    static Documents(){
        return  this.______work() . "\Documents"
    }


    static ______work(){
        A_UserPath__str := A_MyDocuments
        A_UserPath__str := RegExReplace(A_UserPath__str, "\\Documents" , "")
        return A_UserPath__str
    }


}