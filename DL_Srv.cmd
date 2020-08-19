@echo off

REM - Modulo de DOWNLOAD
:cp_dadosr
robocopy "\\%srv_upd%\dados" "dados" /Z /E /W:300 /R:30 /LOG:rbcpr.sra
set n_erro=1
findstr "Files" rbcpr.sra>tst_cpr.tmp
for /F "tokens=7" %%a in (tst_cpr.tmp) do set n_erro=%%a
if %n_erro% NEQ 0 goto dlr_erro
ECHO S|cacls DADOS /T /C /G Todos:F
rmtshare \\%computername%\dados=%windir%\system32\xptoupd\dados /grant todos:read
net send %computername% Aten‡Æo: Dentro de 5 minutos sua m quina efetuar  LogOff para executar a atualiza‡Æo do Sistema. Salve todos os dados e Feche todos os Aplicativos abertos.
net send %computername% Aten‡Æo: Dentro de 5 minutos sua m quina efetuar  LogOff para executar a atualiza‡Æo do Sistema. Salve todos os dados e Feche todos os Aplicativos abertos.
net send %computername% Aten‡Æo: Dentro de 5 minutos sua m quina efetuar  LogOff para executar a atualiza‡Æo do Sistema. Salve todos os dados e Feche todos os Aplicativos abertos.
sleep 300
psloggedon -l -x>log_usr.tmp
find /I "No one is logged on locally." log_usr.tmp
if %errorlevel% == 1 psshutdown -f -o
sleep 300
echo >dl_ok.sra
set dl_ok=1
goto cp_local1

REM - Modulo de Atualizacao do xpto
:cp_local1
if not exist "\\%srv_upd%\MasterVirtual\bck\updbp.id" goto erro_cpl1
if %bp_usr% == 0 goto cp_local2
if exist "%systemdrive%\Docume~1\bancop~1\Config~1\Tempor~1" limp_dir /y %systemdrive%\Docume~1\bancop~1\Config~1\Tempor~1
robocopy "dados\Temporary Internet Files" "%systemdrive%\Documents and Settings\xpto\Configura‡äes locais\Temporary Internet Files"  /Z /E /R:20 /LOG:rbcpl1.sra
set n_erro=1
findstr "Files" rbcpl1.sra>tst_cpl1.tmp
for /F "tokens=7" %%b in (tst_cpl1.tmp) do set n_erro=%%b
if %n_erro% NEQ 0 goto erro_cpl1
echo >ok_bp.sra
set ok_bp=1
goto cp_local2

REM - Modulo de Atualizacao do xpto
:cp_local2
if not exist "\\%srv_upd%\MasterVirtual\bck\updxpto.id" goto erro_cpl2
CD\
CD %systemdrive%\Documents and Settings
FOR /D %%A IN (*) DO del %systemdrive%\Docume~1\%%A\java_p~1\*.* /s /q
FOR /D %%A IN (*) DO %windir%\SYSTEM32\xptoUPD\robocopy.exe "%windir%\system32\xptoupd\dados\java_plugin_AppletStore" "%systemdrive%\Documents and Settings\%%A\java_plugin_AppletStore" /Z /E /R:5 /LOG:rbcpl2.sra
CD\
CD %windir%\system32\xptoupd
set n_erro=1
findstr "Files" %systemdrive%\DOCUME~1\rbcpl2.sra>tst_cpl2.tmp
for /F "tokens=7" %%c in (tst_cpl2.tmp) do set n_erro=%%c
if %n_erro% NEQ 0 goto erro_cpl2
echo >ok_xpto.sra
set ok_xpto=1
goto cp_local3

REM - Modulo de Atualizacao do xpto
:cp_local3
if not exist "\\%srv_upd%\MasterVirtual\bck\updxpto.id" goto erro_cpl3
call %systemroot%\system32\xptoupd\dados\xpto\updxpto.cmd
if not %errorlevel% == 0 goto er_st_scd
find /I "versao=" %systemroot%\system32\xptoupd\dados\xpto\xpto.ini>ver_org.tmp
for /F "skip=2 tokens=1" %%d in (ver_org.tmp) do set ver_org=%%d
find /I "versao=" %systemdrive%\xpto3\xpto.ini>ver_dest.tmp
for /F "skip=2 tokens=1" %%e in (ver_dest.tmp) do set ver_dest=%%e
if /I not "%ver_org%" == "%ver_dest%" goto er_inst_scd
echo >ok_xpto.sra
set ok_xpto=1
goto pdl_wol

REM - Erro no Download do Pacote de Atualizacao
:dlr_erro
echo >erro_dl.sra
goto erro_av

REM - Erro na Atualizacao do xpto
:erro_cpl1
echo >erro_cpl1.sra
goto cp_local2

REM - Erro na Atualizacao do xpto
:erro_cpl2
echo >erro_cpl2.sra
goto cp_local3

REM - Erro na Atualizacao do xpto
:erro_cpl3 
echo >erro_cpl3.sra
goto pdl_wol

REM - Erro na Atualizacao do xpto
:er_st_scd
echo >er_st_scd.sra
goto pdl_wol

REM - Erro na Inicializacao do Script de Instalcao do xpto
:er_inst_scd
echo >er_inst_scd.sra
goto pdl_wol

REM - Inicia procedimento de WakeOnLan na Maquinas da Agencias
:pdl_wol
PDL_Wol
goto sair

:erro_av
net send %computername% Aten‡Æo: Erro na Atualiza‡Æo do Sistema! NÆo foi poss¡vel atualizar o Sistema. Entre em contato com os Administradores da Rede para mais detalhes.
net send %computername% Aten‡Æo: Erro na Atualiza‡Æo do Sistema! NÆo foi poss¡vel atualizar o Sistema. Entre em contato com os Administradores da Rede para mais detalhes.
net send %computername% Aten‡Æo: Erro na Atualiza‡Æo do Sistema! NÆo foi poss¡vel atualizar o Sistema. Entre em contato com os Administradores da Rede para mais detalhes.

:sair

