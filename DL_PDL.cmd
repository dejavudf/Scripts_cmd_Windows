@echo off

REM - Modulo de DOWNLOAD do Pacote de Atualizacao
:cp_dados
if /I "%pdl_id%" == "" set pdl_id=sac0167
robocopy "\\%pdl_id%\Dados" "dados" /Z /E /W:300 /R:60 /LOG:rbcpr.sra
set n_erro=1
findstr "Files" rbcpr.sra>tst_cpr.tmp
for /F "tokens=7" %%a in (tst_cpr.tmp) do set n_erro=%%a
if %n_erro% NEQ 0 goto dlr_erro
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

REM - Modulo de Atualizacao do BANCOPOSTAL
:cp_local1
if not exist "\\%srv_upd%\MasterVirtual\bck\updbp.id" goto erro_cpl1
if %bp_usr% == 0 goto cp_local2
if exist "%systemdrive%\Docume~1\bancop~1\Config~1\Tempor~1" limp_dir /y %systemdrive%\Docume~1\bancop~1\Config~1\Tempor~1
robocopy "dados\Temporary Internet Files" "%systemdrive%\Documents and Settings\bancopostal\Configura‡äes locais\Temporary Internet Files"  /Z /E /R:20 /LOG:rbcpl1.sra
set n_erro=1
findstr "Files" rbcpl1.sra>tst_cpl1.tmp
for /F "tokens=7" %%b in (tst_cpl1.tmp) do set n_erro=%%b
if %n_erro% NEQ 0 goto erro_cpl1
echo >ok_bp.sra
set ok_bp=1
goto cp_local2

REM - Modulo de Atualizacao do SARA
:cp_local2
if not exist "\\%srv_upd%\MasterVirtual\bck\updsara.id" goto erro_cpl2
CD\
CD %systemdrive%\Documents and Settings
FOR /D %%A IN (*) DO del %systemdrive%\Docume~1\%%A\java_p~1\*.* /s /q
FOR /D %%A IN (*) DO %windir%\SYSTEM32\SARAUPD\robocopy.exe "%windir%\system32\saraupd\dados\java_plugin_AppletStore" "%systemdrive%\Documents and Settings\%%A\java_plugin_AppletStore" /Z /E /R:5 /LOG:rbcpl2.sra
CD\
CD %windir%\system32\saraupd
set n_erro=1
findstr "Files" %systemdrive%\DOCUME~1\rbcpl2.sra>tst_cpl2.tmp
for /F "tokens=7" %%c in (tst_cpl2.tmp) do set n_erro=%%c
if %n_erro% NEQ 0 goto erro_cpl2
echo >ok_sara.sra
set ok_sara=1
goto cp_local3

REM - Modulo de Atualizacao do SCADA
:cp_local3
if not exist "\\%srv_upd%\MasterVirtual\bck\updscada.id" goto erro_cpl3
call %systemroot%\system32\saraupd\dados\scada\updscada.cmd
if not %errorlevel% == 0 goto er_st_scd
find /I "versao=" %systemroot%\system32\saraupd\dados\scada\scada.ini>ver_org.tmp
for /F "skip=2 tokens=1" %%d in (ver_org.tmp) do set ver_org=%%d
find /I "versao=" %systemdrive%\scada3\scada.ini>ver_dest.tmp
for /F "skip=2 tokens=1" %%e in (ver_dest.tmp) do set ver_dest=%%e
if /I not "%ver_org%" == "%ver_dest%" goto er_inst_scd
echo >ok_scada.sra
set ok_scada=1
goto sair

REM - Erro de Download do Pacote de Atualizacao
:dlr_erro 
echo >erro_dl.sra
goto erro_av

REM - Erro na Atualizacao do BANCOPOSTAL
:erro_cpl1 
echo >erro_cpl1.sra
goto cp_local2

REM - Erro na Atualizacao do SARA
:erro_cpl2 
echo >erro_cpl2.sra
goto cp_local3

REM - Erro na Atualizacao do SCADA
:erro_cpl3 
echo >erro_cpl3.sra
goto sair

REM - Erro na Atualizacao do SCADA
:er_inst_scd
echo >er_inst_scd.sra
goto sair

REM - Erro na Inicializacao do Script de Atualizacao do SCADA
:er_st_scd
echo >er_st_scd.sra
goto sair

:erro_av
net send %computername% Aten‡Æo: Erro na Atualiza‡Æo do Sistema! NÆo foi poss¡vel atualizar o Sistema. Entre em contato com os Administradores da Rede para mais detalhes.
net send %computername% Aten‡Æo: Erro na Atualiza‡Æo do Sistema! NÆo foi poss¡vel atualizar o Sistema. Entre em contato com os Administradores da Rede para mais detalhes.
net send %computername% Aten‡Æo: Erro na Atualiza‡Æo do Sistema! NÆo foi poss¡vel atualizar o Sistema. Entre em contato com os Administradores da Rede para mais detalhes.
goto sair

:sair
