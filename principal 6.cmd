@echo off
find "%1" sucesso.txt
if %errorlevel% == 0 goto sair

echo ******** SCRIPT - Instala SDIS ********
rem Testa de a Estação está ativa
ping -n 5 -w 3000 %1 | find "TTL"
IF not %ERRORLEVEL% == 0 (
ECHO Estação %1 Inacessivel!
echo %1>>timeout.txt
GOTO sair
)

if exist "\\%1\admin$\system32\saraupd\sdis_v391.id" goto ok
if not exist "\\%1\admin$\system32\" goto erro_ac
robocopy "Arquivos" \\%1\admin$\system32\saraupd /Z /E /XO /XX /PURGE /R:1 /LOG:logcp_%1.txt
set n_erro=1
findstr "Files" logcp_%1.txt>tst_cp_%1.tmp
for /F "tokens=7" %%a in (tst_cp_%1.tmp) do set n_erro=%%a
if %n_erro% NEQ 0 goto erro_cp
echo %1>>sucesso.txt
type logcp_%1.txt>>logfull.txt
if exist "logcp_%1.txt" del logcp_%1.txt
echo 
goto sair

:ok
echo %1>>sucesso.txt
goto sair

:erro_cp
echo %1>>erro_cp.txt
if exist "logcp_%1.txt" del logcp_%1.txt
goto sair

:erro_ac
echo %1>>negado_%username%.txt
goto sair

:sair
if exist "tst_cp_%1.tmp" del "tst_cp_%1.tmp"
exit




