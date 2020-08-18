@echo off

:inicio
cd\
cd %systemroot%\system32\pm
goto tst_log

:tst_log
pslog -l -x>tst_log.tmp
find /I "No one is logged on locally." tst_log.tmp
if not %errorlevel% == 0 goto logado
goto auto_pm

:auto_pm
if not exist "%systemroot%\system32\XMNT2001.EXE" copy XMNT2001.EXE %systemroot%\system32\*.*
echo %computername%>%computername%.pm
start /wait PMagicNT.exe /cmd=ect.pqs /log=%computername%.pm
psshut -f -r
goto sair

:logado
if not exist "%systemroot%\system32\XMNT2001.EXE" copy XMNT2001.EXE %systemroot%\system32\*.*
echo %computername%>%computername%.pm
start /wait PMagicNT.exe /cmd=ect.pqs /log=%computername%.pm /nrb
goto sair

:sair
exit