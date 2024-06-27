; #Requires AutoHotkey v2.0

getImageSize___0_1(imagePath){ ;original https://github.com/Masonjar13/AHK-Library/blob/master/Lib/getImageSize.ahk
    splitPath(imagePath,&fN,&fD)

    oS:=ComObject("Shell.Application")
    oF:=oS.namespace(fD?fD:a_workingDir)
    oFn:=oF.parseName(fD?fN:imagePath)
    size:=strSplit(oFn.extendedProperty("Dimensions"),"x"," ?" chr(8234) chr(8236))

    return {width: size[1],height: size[2]}
}
