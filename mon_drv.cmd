@echo off
mountvol>mount.txt
find /I "\\?\Volume{" mount.txt>lista.txt
for /F "skip=2 tokens=1" %%a in (lista.txt) do start /wait /min automnt.cmd %%a
exit