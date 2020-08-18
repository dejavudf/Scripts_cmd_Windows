@echo off

:busca_tabela_arp_CORE1
set host=10.3.1.254
set ip_arp=10.3.1.254_arp
echo %host% 23>%ip_arp%.tmp
echo WAIT "?">>%ip_arp%.tmp
echo SEND "y\m">>%ip_arp%.tmp
echo WAIT "Username:">>%ip_arp%.tmp
echo SEND "ro\m">>%ip_arp%.tmp
echo WAIT "Password:">>%ip_arp%.tmp
echo SEND "anaagencia\m">>%ip_arp%.tmp
echo WAIT ")->">>%ip_arp%.tmp
echo SEND "set length 0\m">>%ip_arp%.tmp
echo WAIT ")->">>%ip_arp%.tmp
echo SEND "router\m">>%ip_arp%.tmp
echo WAIT ")->">>%ip_arp%.tmp
echo SEND "show arp\m">>%ip_arp%.tmp
echo WAIT ")->">>%ip_arp%.tmp
tst10.exe /r:%ip_arp%.tmp /o:%ip_arp%_resultado.log
findstr /l "ge." %ip_arp%_resultado.log >Lista_arp_%ip_arp%.txt
findstr /l "lag.0.40" %ip_arp%_resultado.log >>Lista_arp_%ip_arp%.txt
del *.tmp
del *.log
goto busca_tabela_mac_CORE1

:busca_tabela_mac_CORE1
set host=10.3.1.254
set ip_mac=10.3.1.254_mac
echo %host% 23>%ip_mac%.tmp
echo WAIT "?">>%ip_mac%.tmp
echo SEND "y\m">>%ip_mac%.tmp
echo WAIT "Username:">>%ip_mac%.tmp
echo SEND "ro\m">>%ip_mac%.tmp
echo WAIT "Password:">>%ip_mac%.tmp
echo SEND "anaagencia\m">>%ip_mac%.tmp
echo WAIT ")->">>%ip_mac%.tmp
echo SEND "set length 0\m">>%ip_mac%.tmp
echo WAIT ")->">>%ip_mac%.tmp
echo SEND "show mac\m">>%ip_mac%.tmp
echo WAIT ")->">>%ip_mac%.tmp
tst10.exe /r:%ip_mac%.tmp /o:%ip_mac%_resultado.log
findstr /l "ge." %ip_mac%_resultado.log | findstr /l "learned" > Lista_mac_%ip_mac%.txt
del *.tmp
del *.log
goto busca_tabela_arp_CORE2

:busca_tabela_arp_CORE2
set host=10.3.1.253
set ip_arp=10.3.1.253_arp
echo %host% 23>%ip_arp%.tmp
echo WAIT "?">>%ip_arp%.tmp
echo SEND "y\m">>%ip_arp%.tmp
echo WAIT "Username:">>%ip_arp%.tmp
echo SEND "ro\m">>%ip_arp%.tmp
echo WAIT "Password:">>%ip_arp%.tmp
echo SEND "anaagencia\m">>%ip_arp%.tmp
echo WAIT ")->">>%ip_arp%.tmp
echo SEND "set length 0\m">>%ip_arp%.tmp
echo WAIT ")->">>%ip_arp%.tmp
echo SEND "router\m">>%ip_arp%.tmp
echo WAIT ")->">>%ip_arp%.tmp
echo SEND "show arp\m">>%ip_arp%.tmp
echo WAIT ")->">>%ip_arp%.tmp
tst10.exe /r:%ip_arp%.tmp /o:%ip_arp%_resultado.log
findstr /l "ge." %ip_arp%_resultado.log >Lista_arp_%ip_arp%.txt
findstr /l "lag.0.40" %ip_arp%_resultado.log >>Lista_arp_%ip_arp%.txt
del *.tmp
del *.log
goto busca_tabela_mac_CORE2

:busca_tabela_mac_CORE2
set host=10.3.1.253
set ip_mac=10.3.1.253_mac
echo %host% 23>%ip_mac%.tmp
echo WAIT "?">>%ip_mac%.tmp
echo SEND "y\m">>%ip_mac%.tmp
echo WAIT "Username:">>%ip_mac%.tmp
echo SEND "ro\m">>%ip_mac%.tmp
echo WAIT "Password:">>%ip_mac%.tmp
echo SEND "anaagencia\m">>%ip_mac%.tmp
echo WAIT ")->">>%ip_mac%.tmp
echo SEND "set length 0\m">>%ip_mac%.tmp
echo WAIT ")->">>%ip_mac%.tmp
echo SEND "show mac\m">>%ip_mac%.tmp
echo WAIT ")->">>%ip_mac%.tmp
tst10.exe /r:%ip_mac%.tmp /o:%ip_mac%_resultado.log
findstr /l "ge." %ip_mac%_resultado.log | findstr /l "learned" >Lista_mac_%ip_mac%.txt
del *.tmp
del *.log
goto procura_mac

:procura_arp_CORE1
for /F "tokens=1-2,6" %%a in (Lista_arp_10.3.1.254_arp.txt) do start /min prin_core1.cmd %%a %%b %%c && sleep 5
goto procura_mac_CORE2

:procura_arp_CORE2
for /F "tokens=1-2,6" %%a in (Lista_arp_10.3.1.253_arp.txt) do start /min prin_core2.cmd %%a %%b %%c && sleep 5
goto sair

:sair
exit