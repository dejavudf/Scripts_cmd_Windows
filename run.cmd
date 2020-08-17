for /F "tokens=1-2,6" %%a in (Lista_arp_10.3.1.254_arp.txt) do start /min prin_core1.cmd %%a %%b %%c && sleep 5
