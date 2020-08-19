@echo off

:MON_D
dir "D:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_E
set drvletra=D
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_E
dir "E:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_F
set drvletra=E
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_F
dir "F:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_G
set drvletra=F
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_G
dir "G:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_H
set drvletra=G
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_H
dir "H:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_I
set drvletra=H
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_I
dir "I:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_J
set drvletra=I
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_J
dir "J:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_K
set drvletra=J
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_K
dir "K:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_L
set drvletra=K
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_L
dir "L:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_M
set drvletra=L
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_M
dir "M:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_N
set drvletra=M
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_N
dir "N:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_O
set drvletra=N
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_O
dir "O:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_P
set drvletra=O
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_P
dir "P:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_Q
set drvletra=P
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_Q
dir "Q:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_R
set drvletra=Q
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_R
dir "R:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_S
set drvletra=R
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_S
dir "S:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_T
set drvletra=S
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_T
dir "T:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_U
set drvletra=T
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_U
dir "U:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_V
set drvletra=U
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_V
dir "V:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_W
set drvletra=V
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_W
dir "W:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_X
set drvletra=W
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_X
dir "X:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_Y
set drvletra=X
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_Y
dir "Y:\ac_xpto.mv" 
if not %errorlevel% == 0 goto MON_Z
set drvletra=Y
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:MON_Z
dir "Z:\ac_xpto.mv" 
if not %errorlevel% == 0 goto erro_umon
set drvletra=Z
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_umon
goto sair

:erro_umon
echo>erro_umon.mv
goto sair

:sair
exit
