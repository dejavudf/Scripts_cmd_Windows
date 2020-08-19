@echo off
set diskfull=0

:Mon_drv
start /wait MON_DRV.CMD
goto CHK_D

:CHK_D
dir "D:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_E
set drvletra=D
goto CHK_MV

:CHK_E
dir "E:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_F
set drvletra=E
goto CHK_MV

:CHK_F
dir "F:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_G
set drvletra=F
goto CHK_MV

:CHK_G
dir "G:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_H
set drvletra=G
goto CHK_MV

:CHK_H
dir "H:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_I
set drvletra=H
goto CHK_MV

:CHK_I
dir "I:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_J
set drvletra=I
goto CHK_MV

:CHK_J
dir "J:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_K
set drvletra=J
goto CHK_MV

:CHK_K
dir "K:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_L
set drvletra=K
goto CHK_MV

:CHK_L
dir "L:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_M
set drvletra=L
goto CHK_MV

:CHK_M
dir "M:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_N
set drvletra=M
goto CHK_MV

:CHK_N
dir "N:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_O
set drvletra=N
goto CHK_MV

:CHK_O
dir "O:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_P
set drvletra=O
goto CHK_MV

:CHK_P
dir "P:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_Q
set drvletra=P
goto CHK_MV

:CHK_Q
dir "Q:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_R
set drvletra=Q
goto CHK_MV

:CHK_R
dir "R:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_S
set drvletra=R
goto CHK_MV

:CHK_S
dir "S:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_T
set drvletra=S
goto CHK_MV

:CHK_T
dir "T:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_U
set drvletra=T
goto CHK_MV

:CHK_U
dir "U:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_V
set drvletra=U
goto CHK_MV

:CHK_V
dir "V:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_W
set drvletra=V
goto CHK_MV

:CHK_W
dir "W:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_X
set drvletra=W
goto CHK_MV

:CHK_X
dir "X:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_Y
set drvletra=X
goto CHK_MV

:CHK_Y
dir "Y:\ac_xpto.mv" 
if not %errorlevel% == 0 goto CHK_Z
set drvletra=Y
goto CHK_MV

:CHK_Z
dir "Z:\ac_xpto.mv" 
if not %errorlevel% == 0 goto erro_chk
set drvletra=Z
goto CHK_MV

:CHK_MV
set data_b=Null
set data_r=Null
set data_bce=Null
set data_rce=Null
set hora_b=Null
set hora_r=Null
set hora_bce=Null
set hora_rce=Null
set datainst=Null
set mac=Null
set ip=Null
if exist "%drvletra%:\sucesso.bck" call var set data_b=DATE of %drvletra%:\sucesso.bck
if exist "%drvletra%:\sucesso.bck" call var set hora_b=TIME of %drvletra%:\sucesso.bck
if exist "%drvletra%:\sucesso.rst" call var set data_r=DATE of %drvletra%:\sucesso.rst
if exist "%drvletra%:\sucesso.rst" call var set hora_r=TIME of %drvletra%:\sucesso.rst
if exist "%drvletra%:\erro.bck" call var set data_bce=DATE of %drvletra%:\erro.bck
if exist "%drvletra%:\erro.bck" call var set hora_bce=TIME of %drvletra%:\erro.bck
if exist "%drvletra%:\erro.rst" call var set data_rce=DATE of %drvletra%:\erro.rst
if exist "%drvletra%:\erro.rst" call var set hora_rce=TIME of %drvletra%:\erro.rst
if exist "%drvletra%:\mv_inst.id" call var set datainst=DATE of %drvletra%:\mv_inst.id
find /I "Error Number: (11100)" %drvletra%:\GHOSTERR.TXT
if %errorlevel% == 0 set diskfull=1
getmac>mac.tmp
for /F "tokens=3" %%a in (mac.tmp) do set mac=%%a
getip %computername%>ip.tmp
for /F "tokens=1" %%b in (ip.tmp) do set ip=%%b
echo %computername%_%ip%_%mac%_%data_b%_%hora_b%_%data_r%_%hora_r%_%data_bce%_%hora_bce%_%data_rce%_%hora_rce%_%datainst%_%diskfull%>mv_status.txt
start /wait DES_DRV.CMD
goto sair

:erro_chk
start /wait DES_DRV.CMD
if %erro% = 1

:sair
exit
