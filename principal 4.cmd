@echo off
find /I "%1" status.txt
if %errorlevel% == 0 goto sair

rem Testa de a Estação está ativa
ping -n 5 %1 | find "TTL"
IF not %ERRORLEVEL% == 0 (
ECHO Estação %1 Inacessivel!
echo %1>>timeout.txt
GOTO sair
)

REM if not exist "\\%1\admin$\system32\" goto erro_ac
robocopy "Arquivos" \\%1\admin$\system32\mv /Z /E /XX /XO /R:0 /W:0 /LOG:logcp_%1.txt
set n_erro=1
findstr "Files" logcp_%1.txt>tst_cp_%1.tmp
for /F "tokens=7" %%a in (tst_cp_%1.tmp) do set n_erro=%%a
if %n_erro% NEQ 0 goto erro_cp
echo %1>>copia_ok.txt
rem type logcp_%1.txt>>logfull.txt
if exist "logcp_%1.txt" del logcp_%1.txt
goto w2k

:w2k
psexec \\%1 -w %systemdrive%\winnt\system32\mv %systemdrive%\winnt\system32\mv\chk_mv.cmd
if not %errorlevel% == 0 goto wxp
rem echo 
type \\%1\admin$\system32\mv\mv_status.txt>>Status.txt
if not %errorlevel% == 0 goto erro_st
echo %1>>sucesso.txt
sc delete psexesvc \\%1
goto sair

:wxp
psexec \\%1 -w %systemdrive%\windows\system32\mv %systemdrive%\windows\system32\mv\chk_mv.cmd
if not %errorlevel% == 0 goto erro_ps
rem echo 
type \\%1\admin$\system32\mv\mv_status.txt>>Status.txt
if not %errorlevel% == 0 goto erro_st
echo %1>>sucesso.txt
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

:erro_ps
echo %1>>erro_ps.txt
goto sair

:erro_inst
echo %1>>erro_inst.txt
goto sair

:sair
if exist "tst_cp_%1.tmp" del "tst_cp_%1.tmp"
exit




