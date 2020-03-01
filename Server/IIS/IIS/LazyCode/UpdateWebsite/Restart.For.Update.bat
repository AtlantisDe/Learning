@echo off

color    0a

chcp 65001

Echo Restart For Update.....


%SYSTEMROOT%\System32\inetsrv\appcmd start apppool /apppool.name:"Web Control"
%SYSTEMROOT%\System32\inetsrv\appcmd start apppool /apppool.name:"Engine"
net start "Control System Core Service"

pause