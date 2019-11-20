@echo off

color    0a

chcp 65001

Echo "delete Default Web Site.....

%SYSTEMROOT%\System32\inetsrv\appcmd delete site "Default Web Site"

Echo "delete site 'Default Web Site'"

pause