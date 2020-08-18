@echo off
set ver_win=winnt
rem Testa de a Estação está ativa
ping -n 8 %1 | find "TTL"
IF not %ERRORLEVEL% == 0 (
ECHO Estação %1 Inacessivel!
GOTO timeout
)

find "%1" sucesso.txt
if %errorlevel% == 0 goto sair
if not exist "\\%1\admin$\system32\" goto erro_ac
robocopy "Arquivos" \\%1\admin$\system32\mv /Z /E /XO /XX /R:0 /LOG:logcp_%1.txt
set n_erro=1
findstr "Files" logcp_%1.txt>tst_cp_%1.tmp
for /F "tokens=7" %%a in (tst_cp_%1.tmp) do set n_erro=%%a
if %n_erro% NEQ 0 goto erro_cp
echo %1>>ok_copia.txt
type logcp_%1.txt>>logfull.txt
sc delete psexesvc \\%1
psexec -s \\%1 -w c:\%ver_win%\system32\mv c:\%ver_win%\system32\mv\mnu_mv.cmd rbt
if not %errorlevel% == 0 goto erro_ativa
echo %1>>sucesso.txt
goto sair

:erro_cp
echo %1>>erro_cp.txt
goto sair

:erro_ac
echo %1>>negado.txt
goto sair

:timeout
echo %1>>timeout.txt
goto sair

:erro_ativa
echo %1>>erro_ativa.txt
goto sair

:sair
if exist "tst_cp_%1.tmp" del tst_cp_%1.tmp
if exist "logcp_%1.txt" del logcp_%1.txt
exit




