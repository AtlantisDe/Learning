@echo off

color    0a

chcp 65001

Echo Stop For Update.....


%SYSTEMROOT%\System32\inetsrv\appcmd stop apppool /apppool.name:"Web Control"
%SYSTEMROOT%\System32\inetsrv\appcmd stop apppool /apppool.name:"Engine"
net stop "Control System Core Service"

pause