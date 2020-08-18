@echo off
getmac>mac.tmp
strep mac.tmp mactmp.tmp
for /F "tokens=3" %%a in (mactmp.tmp) do set macadress=%%a
findstr "%macadress%" \\sac0167\MasterVirtual\bck\bd.txt>dmacl.tmp
for /F "tokens=1 delims=_" %%b in (dmacl.tmp) do set sto=%%b
findstr "%sto%" \\sac0167\MasterVirtual\bck\bd.txt>grupo.tmp
for /F "tokens=2 delims=_" %%c in (grupo.tmp) do start /min st_wol.CMD %%c & sleep 5
