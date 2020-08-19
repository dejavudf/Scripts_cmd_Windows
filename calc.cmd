REM SCRIPT - Atualizacao xpto

find /I "%1" sucesso.txt
if %errorlevel% == 0 goto sair
find /I "%1" erro.txt
if %errorlevel% == 0 goto sair

set total=0
set ok=0

find /c "%1" D:\Projet~1\bck\bdx.txt>count.tmp
for /F "skip=1 tokens=3" %%a in (count.tmp) do set total=%%a

find "%1" cont2.txt
if %errorlevel% == 0 goto sair
find /c "%1" filtro.txt>count2.tmp
for /F "skip=1 tokens=3" %%b in (count2.tmp) do set ok=%%b

set /A ok*=100
set /A ok/=%total%
if %ok% LEQ 49 goto erro
findstr /I "%1" D:\Projet~1\bck\bdx.txt>xptoprod.tmp
for /F "tokens=4 delims=_" %%c in (xptoprod.tmp) do call gera.cmd %%c
goto sair

:erro
echo %1>>erro.txt
goto sair

:sair
exit
