@echo off

netsh interface ip set address "WLAN" static 192.168.3.158 255.255.255.0 192.168.3.1
netsh interface ip set dns "WLAN" static 192.168.3.1
netsh interface ip add dns "WLAN" 192.168.3.1
pause