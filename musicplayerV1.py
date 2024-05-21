import sys
from playsound import playsound
import os

#[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 11:29:14  on 16/5/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
#final version

#######################


EnableLoop = 0


########################


print (os.getpid())


try:
    EnableLoop = int(sys.argv[2])
except:
    EnableLoop = 0
    

try :
    loopTime = int(sys.argv[3])
except:
    loopTime = 0


#################################
'''
musicpath(str) , enableLoop(1,0) , loopTime(int)

agrument
    1-            music path (str)
    2-(optional)  EnableLoop (1,0)
    3-(optional)  loopTime() (0 mean infinite, int (number count)

'''









#

try:
    music = sys.argv[1]
except:
    print("please provide a sound file as agrunment")
    exit()
    

if  int(EnableLoop) == 1:
    if loopTime == 0:
        i = 0
        while i == 0:
            playsound(music)
    else :
        i = int(loopTime)
        while (i != 0) & (i > 0):
            playsound(music)
            i = i - 1
else :
    playsound(music)







