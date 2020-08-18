@echo off
set path=%path%;d:\perl\bin
set email_status=dejavudf@yahoo.com.br,alessandro.silveira@hotmail.com,john@correios.com.br,soraiag@correios.com.br,aaires@correios.com.br,viniciub@hotmail.com,viniciusbezerra@correios.com.br
set email_saraprod=dejavudf@yahoo.com.br,alessandro.silveira@hotmail.com,aaires@correios.com.br,viniciub@hotmail.com,viniciusbezerra@correios.com.br

set sistema=SARA
set resultado=_1_0_1_0
set intervalo=1800

echo Status SDIS UPD
:inicio
echo STATUS ATUAL:>Status.txt
dir /b /on "D:\Projeto Master Virtual\bck\Logs">>Status.txt
echo ***************************************************************>>Status.txt
echo Lista PDL's:>>Status.txt
dir /b /on "D:\Projeto Master Virtual\bck\Logs\pdl">>Status.txt
blat -install smtp.correiosnet.int alexff@correios.com.br
Blat head.txt -subject "Status %sistema% UPD" -to %email_status% -attach Status.txt
sleep %intervalo%
if exist "D:\Projeto Master Virtual\bck\update.id" goto inicio
sleep 30
Blat head.txt -subject "FIM do SDIS - %sistema%" -to %email_status%
if exist "sucesso.txt" del "sucesso.txt"
if exist "saraprod.txt" del "saraprod.txt"
if exist "erro.txt" del "erro.txt"
if exist "filtro.txt" del "filtro.txt"
rem find /I "%resultado%" status.txt>filtro.txt
rem for /F "tokens=1 delims=_" %%a in (D:\Projet~1\bck\bdx.txt) do start /min /wait calc.cmd %%a
perl conta.cgi
Blat cadastro.txt -subject "Cadastro SARAPROD %sistema%" -to %email_saraprod% -attach saraprod.txt
if exist "*.tmp" del "*.tmp"
if exist "cont2.txt" del "cont2.txt"
if exist "cont.txt" del "cont.txt"
