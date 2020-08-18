@echo off
find "%1" saraprod.txt
if %errorlevel% == 0 goto sair
echo %1>>saraprod.txt
