;#Requires AutoHotkey v2.0
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 18:06:26  on 28/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}


;MsgBox CMD_system("ipconfig")

/**
 * CMD command in root Position
 * @param command {string} CMD command
 */
CMD_system(command){
    return (ComObject("WScript.Shell").Exec('cmd.exe /c "' command '"').StdOut.ReadAll()) 
}
