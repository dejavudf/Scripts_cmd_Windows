@echo off
find /I "%1" sucesso.txt
if %errorlevel% == 0 goto sair

echo ******** SCRIPT - Instalação da MasterVirtual - AGENCIAS ********
rem Testa de a Estação está ativa
ping -n 8 -w 8000 %1 | find "TTL"
IF not %ERRORLEVEL% == 0 (
ECHO Estação %1 Inacessivel!
echo %1>>timeout.txt
GOTO sair
)

if not exist "\\%1\admin$\system32\" goto erro_ac
robocopy "Arquivos" \\%1\admin$\system32\mv /Z /E /XO /XX /R:5 /W:5 /LOG:logcp_%1.txt
set n_erro=1
findstr "Files" logcp_%1.txt>tst_cp_%1.tmp
for /F "tokens=7" %%a in (tst_cp_%1.tmp) do set n_erro=%%a
if %n_erro% NEQ 0 goto erro_cp
echo %1>>copia_ok.txt
type logcp_%1.txt>>logfull.txt
if exist "logcp_%1.txt" del logcp_%1.txt
sc delete psexesvc \\%1
goto w2k

:w2k
psexec \\%1 -w %systemdrive%\winnt\system32\mv %systemdrive%\winnt\system32\mv\Instmv.cmd
if not %errorlevel% == 0 goto wxp
echo 
echo %1>>sucesso.txt
echo 
goto sair

:wxp
psexec \\%1 -w %systemdrive%\windows\system32\mv %systemdrive%\windows\system32\mv\Instmv.cmd
if not %errorlevel% == 0 goto erro_st
echo 
echo %1>>sucesso.txt
echo 
goto sair

:erro_cp
echo %1>>erro_cp.txt
if exist "logcp_%1.txt" del logcp_%1.txt
goto sair

:erro_ac
echo %1>>negado.txt
goto sair

:erro_st
echo %1>>erro_st.txt
goto sair

:erro_inst
echo %1>>erro_st.txt
goto sair

:sair
if exist "tst_cp_%1.tmp" del "tst_cp_%1.tmp"
exit




