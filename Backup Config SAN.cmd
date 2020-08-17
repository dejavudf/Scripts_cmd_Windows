@echo on

cd "C:\Script_Backup_Switch_SAN"

echo %date:~00,10%>data.txt
for /F "tokens=1 delims=/" %%a in (data.txt) do set dia=%%a
for /F "tokens=2 delims=/" %%a in (data.txt) do set mes=%%a
for /F "tokens=3 delims=/" %%a in (data.txt) do set ano=%%a

:sw1a
echo 10.1.1.24 23>script.txt
echo WAIT "login:">>script.txt
echo SEND "admin\m">>script.txt
echo WAIT "Password:">>script.txt
echo SEND "ruosA961LfE\m">>script.txt
echo WAIT " proceed.">>script.txt
echo SEND "\">>script.txt
echo WAIT ":admin">>script.txt
echo SEND "configupload\m">>script.txt
echo WAIT "[ftp]:">>script.txt
echo SEND "ftp\m">>script.txt
echo WAIT "[host]:">>script.txt
echo SEND "10.1.10.3\m">>script.txt
echo WAIT "[user]:">>script.txt
echo SEND "root\m">>script.txt
echo WAIT ".txt]:">>script.txt
echo SEND "backup_swsan/bck_sw_san01A_%dia%_%mes%_%ano%.cfg\m">>script.txt
echo WAIT "all]):">>script.txt
echo SEND "all\m">>script.txt
echo WAIT "Password:">>script.txt
echo SEND "Ab123456\m">>script.txt
echo WAIT "admin>">>script.txt
echo SEND "exit\m">>script.txt
tst10.exe /r:C:\Script_Backup_Switch_SAN\script.txt
rem tst10.exe /r:C:\Script_Backup_Switch_SAN\script.txt /o:output_sw1a.txt /m
goto sw2a

:sw2a
echo 10.1.1.25 23>script.txt
echo WAIT "login:">>script.txt
echo SEND "admin\m">>script.txt
echo WAIT "Password:">>script.txt
echo SEND "ruosA961LfE\m">>script.txt
echo WAIT " proceed.">>script.txt
echo SEND "\">>script.txt
echo WAIT ":admin">>script.txt
echo SEND "configupload\m">>script.txt
echo WAIT "[ftp]:">>script.txt
echo SEND "ftp\m">>script.txt
echo WAIT "[host]:">>script.txt
echo SEND "10.1.10.3\m">>script.txt
echo WAIT "[user]:">>script.txt
echo SEND "root\m">>script.txt
echo WAIT ".txt]:">>script.txt
echo SEND "backup_swsan/bck_sw_san02A_%dia%_%mes%_%ano%.cfg\m">>script.txt
echo WAIT "all]):">>script.txt
echo SEND "all\m">>script.txt
echo WAIT "Password:">>script.txt
echo SEND "Ab123456\m">>script.txt
echo WAIT "admin>">>script.txt
echo SEND "exit\m">>script.txt
tst10.exe /r:C:\Script_Backup_Switch_SAN\script.txt
rem tst10.exe /r:C:\Script_Backup_Switch_SAN\script.txt /o:output_sw1a.txt /m
goto sw1b

:sw1b
echo 10.1.1.26 23>script.txt
echo WAIT "login:">>script.txt
echo SEND "admin\m">>script.txt
echo WAIT "Password:">>script.txt
echo SEND "ruosA961LfE\m">>script.txt
echo WAIT " proceed.">>script.txt
echo SEND "\">>script.txt
echo WAIT ":admin">>script.txt
echo SEND "configupload\m">>script.txt
echo WAIT "[ftp]:">>script.txt
echo SEND "ftp\m">>script.txt
echo WAIT "[host]:">>script.txt
echo SEND "10.1.10.3\m">>script.txt
echo WAIT "[user]:">>script.txt
echo SEND "root\m">>script.txt
echo WAIT ".txt]:">>script.txt
echo SEND "backup_swsan/bck_sw_san01B_%dia%_%mes%_%ano%.cfg\m">>script.txt
echo WAIT "all]):">>script.txt
echo SEND "all\m">>script.txt
echo WAIT "Password:">>script.txt
echo SEND "Ab123456\m">>script.txt
echo WAIT "admin>">>script.txt
echo SEND "exit\m">>script.txt
tst10.exe /r:C:\Script_Backup_Switch_SAN\script.txt
rem tst10.exe /r:C:\Script_Backup_Switch_SAN\script.txt /o:output_sw1a.txt /m
goto sw2b

:sw2b
echo 10.1.1.27 23>script.txt
echo WAIT "login:">>script.txt
echo SEND "admin\m">>script.txt
echo WAIT "Password:">>script.txt
echo SEND "ruosA961LfE\m">>script.txt
echo WAIT " proceed.">>script.txt
echo SEND "\">>script.txt
echo WAIT ":admin">>script.txt
echo SEND "configupload\m">>script.txt
echo WAIT "[ftp]:">>script.txt
echo SEND "ftp\m">>script.txt
echo WAIT "[host]:">>script.txt
echo SEND "10.1.10.3\m">>script.txt
echo WAIT "[user]:">>script.txt
echo SEND "root\m">>script.txt
echo WAIT ".txt]:">>script.txt
echo SEND "backup_swsan/bck_sw_san02B_%dia%_%mes%_%ano%.cfg\m">>script.txt
echo WAIT "all]):">>script.txt
echo SEND "all\m">>script.txt
echo WAIT "Password:">>script.txt
echo SEND "Ab123456\m">>script.txt
echo WAIT "admin>">>script.txt
echo SEND "exit\m">>script.txt
tst10.exe /r:C:\Script_Backup_Switch_SAN\script.txt
rem tst10.exe /r:C:\Script_Backup_Switch_SAN\script.txt /o:output_sw1a.txt /m
goto saida

:saida
exit


