@echo off

echo %date:~00,10%>data.txt
for /F "tokens=1 delims=/" %%a in (data.txt) do set dia=%%a
for /F "tokens=2 delims=/" %%a in (data.txt) do set mes=%%a
for /F "tokens=3 delims=/" %%a in (data.txt) do set ano=%%a

set contador=0

:inicio
SET /A contador=contador + 1
SET ip=10.3.55.%contador%

ping -n 2 -w 2000 %ip% | find "TTL"
IF not %ERRORLEVEL% == 0 (
ECHO Estação %1 Inacessivel!
GOTO inicio
)

:backup
echo %ip% 23>%IP%.txt
echo WAIT "Username:">>%IP%.txt
echo SEND "admin\m">>%IP%.txt
echo WAIT "Username:">>%IP%.txt
echo SEND "admin\m">>%IP%.txt
echo WAIT "Password:">>%IP%.txt
echo SEND "america2017\m">>%IP%.txt
echo WAIT ">">>%IP%.txt
echo SEND "save\m">>%IP%.txt
echo WAIT "?[Y/N]">>%IP%.txt
echo SEND "Y\m">>%IP%.txt
echo WAIT ">">>%IP%.txt
echo SEND "save backup.zip\m">>%IP%.txt
echo WAIT "?[Y/N]">>%IP%.txt
echo SEND "Y\m">>%IP%.txt
echo WAIT ">">>%IP%.txt
echo SEND "tftp 10.1.10.3 put backup.zip %IP%_%dia%%mes%%ano%.zip\m">>%IP%.txt
echo WAIT ">">>%IP%.txt
echo SEND "quit\m">>%IP%.txt
goto telnet

:telnet
tst10.exe /r:%IP%.txt /o:%IP%.log
del %ip%.txt
del %ip%.log
if %contador% == 99 goto sair
goto inicio

:sair
exit
