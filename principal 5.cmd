@echo off
findstr /I "%1" lista.txt
if %errorlevel% == 0 goto sair

echo SCRIPT CMOSUPD SARA
rem Testa de a Estação está ativa
ping -n 5 -w 5000 %1 | find "TTL"
IF not %ERRORLEVEL% == 0 (
ECHO Estação %1 Inacessivel!
findstr /I "%1" timeout.txt
if %errorlevel% == 0 goto sair
echo %1 >>timeout.txt
GOTO sair
)

if not exist "\\%1\admin$\system32\" goto erro_ac
robocopy "Arquivos" \\%1\admin$\system32\updbios /Z /E /R:5 /W:5 /LOG:logcp_%1.txt
set n_erro=1
findstr "Files" logcp_%1.txt>tst_cp_%1.tmp
for /F "tokens=7" %%c in (tst_cp_%1.tmp) do set n_erro=%%c
if %n_erro% NEQ 0 goto erro_cp
echo %1>>copia_ok.txt
type logcp_%1.txt>>logfull.txt
if exist "logcp_%1.txt" del logcp_%1.txt
psexec \\%1 c:\winnt\system32\updbios\bios.cmd
type \\%1\admin$\system32\updbios\biosupd.txt>>lista.txt
goto sair

:erro_cp
echo %1>>erro_cp.txt
goto sair

:erro_ac
echo %1>>negado.txt
goto sair

:sair
if exist "tst_cp_%1.tmp" del "tst_cp_%1.tmp"
exit
