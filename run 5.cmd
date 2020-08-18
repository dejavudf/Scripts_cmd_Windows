@echo off
:inicio
echo ******** Script - Checagem do BACKUP da MasterVirtual ********
for /F "tokens=1-2" %%a in (IP.txt) do start /min principal.cmd %%a & sleep 10
rem goto inicio