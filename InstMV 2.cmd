regedit /s rmv_vdd.reg
@echo off
REM Arquivo Principal de instalacao da mastervirtual versao 8.1
Rem apaga arquivos temporarios e de logs
if exist "*.tmp" del *.tmp
if exist "*.mv" del *.mv

Rem Extrai pacote de instalacao da master virtual
:chk_hash
sha mv.cab>hash_tmp.tmp
find /I "3cecfd88ecf1ea3086c21cc223bbe928f2aff130" hash_tmp.tmp
if not %errorlevel% == 0 goto erro_hash
goto ext

:ext
extract /y /e mv.cab
if not %errorlevel% == 0 goto erro_ext
goto chk_hd

:chk_hd
set hdtotal=0
GDISK32.EXE>hd_sz.tmp
for /F "skip=1 tokens=6" %%a in (hd_sz.tmp) do set hdtotal=%%a
if %hdtotal% GEQ 22000 goto chk_bios_id
goto erro_hd

Rem Checa identificacao da BIOS
:chk_bios_id
set tipomaq=no_id
echo. |biosid>biosid.tmp
cls
if not %errorlevel% == 0 goto erro_id
goto tst_id_nvdat

REM inicio dos testes de verificacao do tipo de bios
REM verifica se maquina e do tipo NOVADATA - INTEL CELERON
:tst_id_nvdat
find "6A6LIG0BC-00" biosid.tmp
if %errorlevel% == 1 goto tst_id_proc
if %errorlevel% == 0 goto chk_part
goto sair

REM verifica se maquina e do tipo PROCOMP - INTEL CELERON
:tst_id_proc
find "GA-6VMM7C-00" biosid.tmp
if %errorlevel% == 1 goto tst_id_ibm
if %errorlevel% == 0 goto chk_part
goto sair

REM verifica se maquina e do tipo IBM - INTEL CELERON
:tst_id_ibm
find "6A69MS2BC-00" biosid.tmp
if %errorlevel% == 1 goto tst_id_posit
if %errorlevel% == 0 goto chk_part
goto sair

REM verifica se maquina e do tipo POSITIVO - AMD SEMPRON
:tst_id_posit
find "6A6LYG08C-00" biosid.tmp
if %errorlevel% == 1 goto tst_id_atp
if %errorlevel% == 0 goto chk_part
goto sair

REM verifica se maquina e do tipo ATP - AMD ATHLON
:tst_id_atp
find "-A7N8XÄXC-00" biosid.tmp
if %errorlevel% == 1 goto tst_id_nvdat2
if %errorlevel% == 0 goto chk_part
goto sair

REM verifica se maquina e do tipo NOVADATA - AMD ATHLON
:tst_id_nvdat2
find "6A6LYG0SC-00" biosid.tmp
if %errorlevel% == 1 goto tst_id_nvdat3
if %errorlevel% == 0 goto chk_part
goto sair

REM verifica se maquina e do tipo NOVADATA - INTEL P4
:tst_id_nvdat3
find "6A79AE19C-00" biosid.tmp
if %errorlevel% == 1 goto tst_posit2
if %errorlevel% == 0 goto chk_part
goto sair

REM verifica se maquina e do tipo NOVADATA - INTEL P4
:tst_posit2
find "6A6LWG0FC-00" biosid.tmp
if %errorlevel% == 1 goto erro_id
if %errorlevel% == 0 goto chk_part
goto sair

Rem checa qual tipo de particao e fat32_primaria 
:chk_part
cls
diskpart /s info.txt>lista.txt
findstr /I "Parti‡Æo 3    Prim rio" lista.txt
if not %errorlevel% == 0 goto sair
BOOTPART >bootpart.txt
findstr "type=c" bootpart.txt>bptmp.tmp
if not %errorlevel% == 0 goto erro_bp
for /F "tokens=1" %%b in (bptmp.tmp) do set unit=%%b
if %unit% LEQ 3 goto chk_os
goto erro_bt

Rem checa qual tipo de sistema operacional
:chk_os
ver>versao.tmp
for /F "skip=1 tokens=3" %%c in (versao.tmp) do set so=%%c
echo %so%
if /I "%so%" == "XP" goto bootxp
if %so% == 2000 goto boot2k
goto erro_os

Rem altera arquivo bootini do windows 2000
:boot2k
if exist "%systemdrive%\bootsect.w40" attrib -r -s -a -h %systemdrive%\bootsect.w40
if exist "%systemdrive%\bootsect.w40" del %systemdrive%\bootsect.w40
if exist "%systemdrive%\boot.ini" attrib -r -s -a -h %systemdrive%\boot.ini
if exist "%systemdrive%\boot.ini" del %systemdrive%\boot.ini
copy boot2K.ini %systemdrive%\boot.ini /y
if not %errorlevel% == 0 goto erro_bt
if exist "%systemdrive%\boot.ini" attrib +s +h -a +r %systemdrive%\boot.ini
goto instala

Rem altera arquivo bootini do windows XP
:bootxp
if exist "%systemdrive%\bootsect.w40" attrib -r -s -a -h %systemdrive%\bootsect.w40
if exist "%systemdrive%\bootsect.w40" del %systemdrive%\bootsect.w40
if exist "%systemdrive%\boot.ini" attrib -r -s -a -h %systemdrive%\boot.ini
if exist "%systemdrive%\boot.ini" del %systemdrive%\boot.ini
copy bootxp.ini %systemdrive%\boot.ini /y
if not %errorlevel% == 0 goto erro_bt
if exist "%systemdrive%\boot.ini" attrib +s +h -a +r %systemdrive%\boot.ini
goto instala

Rem instala a mastervirtual na particao 3 do disco 1
:instala
ghost32.exe -clone,mode=pload,src=mvghost.gho:1,dst=1:3 -sure -pmbr -batch
if not %errorlevel% == 0 goto erro_gt
BOOTPART %unit% %systemdrive%\BOOTSECT.W40 "MasterVirtual">bp_%computername%.mv
if not %errorlevel% == 0 goto erro_bp
if exist "%systemdrive%\bootsect.w40" attrib +r +s -a +h %systemdrive%\bootsect.w40
echo >mv_inst.id
goto tstdrv0

REM inicio dos testes da letra do drive que foi instalada a mastervirtual
:tstdrv0
set drvletra=D
if /I exist "d:\AC_DESAN.MV" goto ocultar
goto tstdrv1

:tstdrv1
set drvletra=E
if /I exist "e:\AC_DESAN.MV" goto ocultar
goto tstdrv2

:tstdrv2
set drvletra=F
if /I exist "f:\AC_DESAN.MV" goto ocultar
goto tstdrv3

:tstdrv3
set drvletra=G
if /I exist "g:\AC_DESAN.MV" goto ocultar
goto tstdrv4

:tstdrv4
set drvletra=h
if /I exist "h:\AC_DESAN.MV" goto ocultar
goto tstdrv5

:tstdrv5
set drvletra=i
if /I exist "i:\AC_DESAN.MV" goto ocultar
goto sair

Rem oculta particao que sera instalada a mastervirtual
:ocultar
echo >%drvletra%:\mv_inst.id
echo set drvletra=%drvletra%>drvletra.cmd
mountvol %drvletra%:\ /L>drive.mnt
mountvol %drvletra%:\ /D
if not %errorlevel% == 0 goto erro_oc
goto sair

REM erro na execucao do ghost
:erro_gt
echo erro>erro_gt.mv
if %erro% = 1

REM erro de identificacao da bios
:erro_id
echo erro>erro_id.mv
if %erro% = 1

REM erro na descompactacao do pacote de instalacao da mastervirtual
:erro_hash
echo erro>erro_hash.mv
if %erro% = 1

:erro_ext
echo erro>erro_ext.mv
if %erro% = 1

Rem erro verificacao das particoes via boot_part
:erro_bp
echo erro>erro_bp.mv
if %erro% = 1

Rem erro na criacao do arquivo bootini
:erro_bt
echo erro>erro_bt.mv
if %erro% = 1

Rem erro na ocultacao da particao onde sera instalada a mastervirtual
:erro_oc
echo erro>erro_oc.mv
if %erro% = 1

Rem erro na identificacao do sistema operacional da maquina
:erro_os
echo erro>erro_os.mv
if %erro% = 1

Rem erro na identificacao do sistema operacional da maquina
:erro_hd
set errorlevel=1
echo erro>erro_hd.mv
if %erro% = 1

Rem finalizacao do programa de instalacao
:sair
exit

