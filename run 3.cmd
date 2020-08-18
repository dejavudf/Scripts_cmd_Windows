@echo off
set cont=1
:inicio
echo SCRIPT CMOSUPD - Total Loop: %cont%
for /F "tokens=1-2" %%a in (IP.txt) do start /min principal.cmd %%a & sleep 20
set /A cont+=1
cls
goto inicio