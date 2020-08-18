if exist "sucesso.txt" del "sucesso.tmp"
if exist "saraprod.txt" del "saraprod.tmp"
for /F "tokens=1 delims=_" %%a in (bd.txt) do start /min /wait calc.cmd %%a
if exist "*.tmp" del "*.tmp"
if exist "cont2.txt" del "cont2.txt"
if exist "cont.txt" del "cont.txt"