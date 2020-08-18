@echo off
echo %1>>wol_list.sra
wol %1>>wol_list.sra
sleep 5
wol %1
sleep 5
wol %1
exit



