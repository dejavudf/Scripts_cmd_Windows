@echo off
find "%1" fullpartinfo.txt
if %errorlevel% == 0 goto sair

rem Testa de a Estação está ativa
ping -n 5 %1 | find "TTL"
IF not %ERRORLEVEL% == 0 (
ECHO Estação %1 Inacessivel!
GOTO timeout
)


if not exist "\\%1\admin$\system32\" goto erro_ac
robocopy "Arquivos" \\%1\admin$\system32 /Z /E /XX /XO /R:0 /LOG:logcp_%1.txt
set n_erro=1
findstr "Files" logcp_%1.txt>tst_cp_%1.tmp
for /F "tokens=7" %%a in (tst_cp_%1.tmp) do set n_erro=%%a
if %n_erro% NEQ 0 goto erro_cp
echo %1>>ok_copia.txt
type logcp_%1.txt>>logfull.txt
sc delete psexesvc \\%1
goto w2k

:w2k
psexec \\%1 -n 8 c:\winnt\system32\partinfo.cmd
if not %errorlevel% == 0 goto wxp
type \\%1\admin$\system32\partinfo.txt>>fullpartinfo.txt
goto sair

:wxp
psexec \\%1 -n 8 c:\windows\system32\partinfo.cmd
if not %errorlevel% == 0 goto sair
type \\%1\admin$\system32\partinfo.txt>>fullpartinfo.txt
goto sair

:erro_cp
echo %1>>erro_cp.txt
type logcp_%1.txt>>logfull.txt
if exist "logcp_%1.txt" del logcp_%1.txt
set tempo=2
goto sair

:erro_ac
echo %1>>negado.txt
goto sair

:timeout
echo %1>>timeout.txt
goto sair

:sair
if exist "*.tmp" del *.tmp
if exist "logcp_%1.txt" del logcp_%1.txt
exit




