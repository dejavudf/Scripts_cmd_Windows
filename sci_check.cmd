@echo off
set path=c:\windows;c:\windows\system32;c:\perl\bin
set temp=c:\SCI
set tmp=c:\SCI

:inicio
sleep 300
c:\perl\bin\perl srv_tst.pl
if not %errorlevel% == 0 goto erro_cnt
psloglist \\sac0408 -o print -x -i 10 -s -c -t \t>lista.tmp
if not %errorlevel% == 0 goto erro_log
type lista.tmp>>lista.txt
find /I "System event log on sac0408 cleared" lista.tmp
if not %errorlevel% == 0 goto erro_clean
c:\perl\bin\perl strep.pl
if not %errorlevel% == 0 goto erro_cnt
if exist "lista.tmp" del "lista.tmp"
goto sair

:erro_log
echo ERRO_LOG_%date%_%time%>>erros.txt
net send mac01039772 Servico SCI com problema - ErroLOG
goto sair

:erro_cnt
net send mac01039772 Servico SCI com problema - ErroCNT
goto sair

:erro_pl
ERRO_PERL_%date%_%time%>>erros.txt
net send mac01039772 Servico SCI com problema - ErroPERL
goto sair

:erro_clean
ERRO_CLEAN_%date%_%time%>>erros.txt
net send mac01039772 Servico SCI com problema - ErroCLEAN
goto sair

:sair
goto inicio

