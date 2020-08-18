@echo off
if exist "*.tmp" del "*.tmp"

gdisk32 1 /MBR
if %errorlevel% == 0 goto tst_inst1
gdisk32 1 /MBR
if not %errorlevel% == 0 goto erro_inst
goto tst_inst1

:tst_inst1
find /I "mastervirtual" %systemdrive%\boot.ini
if not %errorlevel% == 0 goto erro_inst
find /I "C:\BOOTSECT.W40=" %systemdrive%\boot.ini
if not %errorlevel% == 0 goto erro_inst
goto tst_inst2

:tst_inst2
if exist "C:\BOOTSECT.W40" goto tst_inst3
goto erro_inst

:tst_inst3
START /WAIT MON_DRV.CMD
goto CHK_D

:CHK_D
dir "D:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_E
set drvletra=D
goto CHK_MV

:CHK_E
dir "E:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_F
set drvletra=E
goto CHK_MV

:CHK_F
dir "F:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_G
set drvletra=F
goto CHK_MV

:CHK_G
dir "G:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_H
set drvletra=G
goto CHK_MV

:CHK_H
dir "H:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_I
set drvletra=H
goto CHK_MV

:CHK_I
dir "I:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_J
set drvletra=I
goto CHK_MV

:CHK_J
dir "J:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_K
set drvletra=J
goto CHK_MV

:CHK_K
dir "K:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_L
set drvletra=K
goto CHK_MV

:CHK_L
dir "L:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_M
set drvletra=L
goto CHK_MV

:CHK_M
dir "M:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_N
set drvletra=M
goto CHK_MV

:CHK_N
dir "N:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_O
set drvletra=N
goto CHK_MV

:CHK_O
dir "O:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_P
set drvletra=O
goto CHK_MV

:CHK_P
dir "P:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_Q
set drvletra=P
goto CHK_MV

:CHK_Q
dir "Q:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_R
set drvletra=Q
goto CHK_MV

:CHK_R
dir "R:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_S
set drvletra=R
goto CHK_MV

:CHK_S
dir "S:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_T
set drvletra=S
goto CHK_MV

:CHK_T
dir "T:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_U
set drvletra=T
goto CHK_MV

:CHK_U
dir "U:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_V
set drvletra=U
goto CHK_MV

:CHK_V
dir "V:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_W
set drvletra=V
goto CHK_MV

:CHK_W
dir "W:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_X
set drvletra=W
goto CHK_MV

:CHK_X
dir "X:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_Y
set drvletra=X
goto CHK_MV

:CHK_Y
dir "Y:\ac_desan.mv" 
if not %errorlevel% == 0 goto CHK_Z
set drvletra=Y
goto CHK_MV

:CHK_Z
dir "Z:\ac_desan.mv" 
if not %errorlevel% == 0 goto erro_inst
set drvletra=Z
goto CHK_MV

:CHK_MV
if not exist "%drvletra%:\command.com" goto erro_inst
if not exist "%drvletra%:\msdos.sys" goto erro_inst
if not exist "%drvletra%:\io.sys" goto erro_inst
if not exist "%drvletra%:\menu.bat" goto erro_inst
if not exist "%drvletra%:\autoexec.bat" goto erro_inst
if not exist "%drvletra%:\ac_desan.mv" goto erro_inst
if not exist "%drvletra%:\Autobck.bat" goto erro_inst
if not exist "%drvletra%:\ghost\ghost.exe" goto erro_inst
if not exist "%drvletra%:\ghost\gdisk.exe" goto erro_inst
if not exist "%drvletra%:\Autobck.bat" goto erro_inst
copy /y "%systemroot%\system32\mv\Autobck.bat" "%drvletra%:\Autobck.bat"
copy /y "%systemroot%\system32\mv\Autorest.bat" "%drvletra%:\Autorest.bat"
start /wait DES_DRV.CMD
goto ativar_mv

:ativar_mv
gdisk32 1 /status>partstat.tmp
find /I "FAT32" partstat.tmp>num_part.tmp
for /F "skip=2 tokens=1" %%a in (num_part.tmp) do set num_part=%%a
if not %num_part% GEQ 3 goto erro_inst
echo select disk=0 >ativa2.txt
echo select partition=%num_part% >>ativa2.txt
echo active >>ativa2.txt
diskpart /s ativa2.txt
deslig.cmd
goto sair

:erro_inst
start /wait DES_DRV.CMD
if %erro% = 1

:sair
exit


