@echo off
if exist "*.tmp" del *.tmp
if exist "*.txt" del *.txt

:part_info
echo %computername%>partinfo.txt
bootpart>>partinfo.txt
echo ******************************************************************************>>partinfo.txt
goto sair

:sair
if exist "*.tmp" del *.tmp
exit