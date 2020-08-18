@echo off
find "%1" sucesso.txt
if %errorlevel% == 0 goto sair

rem Testa de a Estação está ativa
ping -n 8 %1 | find "TTL"
IF not %ERRORLEVEL% == 0 (
ECHO Estação %1 Inacessivel!
GOTO timeout
)

if not exist "\\%1\admin$\system32\" goto erro_ac
pskill \\%1 pm
robocopy "Arquivos" \\%1\admin$\system32\pm /Z /E /XO /XX /R:0 /LOG:logcp_%1.txt
set n_erro=1
findstr "Files" logcp_%1.txt>tst_cp_%1.tmp
for /F "tokens=7" %%a in (tst_cp_%1.tmp) do set n_erro=%%a
if %n_erro% NEQ 0 goto erro_cp
echo %1>>ok_copia.txt
type logcp_%1.txt>>logfull.txt
sc delete psexesvc \\%1
psexec \\%1 -w c:\winnt\system32\pm c:\winnt\system32\pm\pm.cmd
type \\%1\admin$\system32\pm\*.pm>%1_pm.tmp
find "Error #" %1_pm.tmp
if errorlevel 1 goto pm_ok
if errorlevel 0 goto erro_pm
goto sair

:erro_cp
echo %1>>erro_cp.txt
type logcp_%1.txt>>logfull.txt
if exist "logcp_%1.txt" del logcp_%1.txt
set tempo=2
goto sair

:pm_ok
echo **************************************************>>full_pm_ok.txt
echo %1>>full_pm_ok.txt
type \\%1\admin$\system32\pm\*.pm>>full_pm_ok.txt
Echo %1>>Sucesso.txt
goto sair

:erro_pm
echo %1>>erro_pm.txt
echo **************************************************>>full_pm_error.txt
echo %1>>full_pm_error.txt
type \\%1\admin$\system32\pm\*.pm>>full_pm_error.txt
if exist "logcp_%1.txt" del logcp_%1.txt
goto sair

:erro_ac
echo %1>>negado.txt
goto sair

:timeout
echo %1>>timeout.txt
goto sair

:erro_log
echo %1>>logado.txt

:sair
if exist "*.tmp" del *.tmp
if exist "logcp_%1.txt" del logcp_%1.txt
exit




