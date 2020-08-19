@echo off
findstr /x "%1" xptoprod.txt
if %errorlevel% == 0 goto sair
echo %1>>xptoprod.txt
