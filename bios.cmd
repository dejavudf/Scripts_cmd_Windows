@echo off
set tipomaq=no_id
cd\
cd %windir%\system32\updbios
if exist "*.txt" del *.txt
if exist "*.tmp" del *.tmp
echo. |biosid>biosid.tmp
goto tst_id_nd

:tst_id_nd
findstr /L "6A6LIG0BC-00" biosid.tmp
if errorlevel 1 goto tst_id_p
if errorlevel 0 goto novadata

:tst_id_p
findstr /L "GA-6VMM7C-00" biosid.tmp
if errorlevel 1 goto tst_id_i
if errorlevel 0 goto procomp

:tst_id_i
findstr /L "6A69MS2BC-00" biosid.tmp
if errorlevel 1 goto erro
if errorlevel 0 goto ibm
goto sair

:novadata
set tipomaq=novadata
if exist "biosupd.txt" del biosupd.txt
instdrv gwiopm remove
instdrv gwiopm %windir%\system32\updbios\gwiopm.sys
echo %computername% - %tipomaq%>biosupd.txt
echo 2|cmospwd_nt /r novadata.sav>>biosupd.txt
echo 
echo ******************************************************>>biosupd.txt
instdrv gwiopm remove
goto sair

:procomp
set tipomaq=procomp
if exist "biosupd.txt" del biosupd.txt
instdrv gwiopm remove
instdrv gwiopm %windir%\system32\updbios\gwiopm.sys
echo %computername% - %tipomaq%>biosupd.txt
echo 2|cmospwd_nt /r procomp.sav>>biosupd.txt
echo 
echo ******************************************************>>biosupd.txt
instdrv gwiopm remove
goto sair

:ibm
set tipomaq=ibm
if exist "biosupd.txt" del biosupd.txt
instdrv gwiopm remove
instdrv gwiopm %windir%\system32\updbios\gwiopm.sys
echo %computername% - %tipomaq%>biosupd.txt
echo 2|cmospwd_nt /r ibm.sav>>biosupd.txt
echo 
echo ******************************************************>>biosupd.txt
instdrv gwiopm remove
goto sair

:erro
echo %computername% - %tipomaq%>>biosupd.txt
echo Bios ID Nao Encontrado!>>biosupd.txt
echo ******************************************************>>biosupd.txt
goto sair

:sair
