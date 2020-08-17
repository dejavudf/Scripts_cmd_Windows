@echo off
echo %1
echo %2
echo %3
echo %3 | findstr /l "te."
echo %errorlevel%
pause