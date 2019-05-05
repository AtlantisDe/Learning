@echo off
chcp 65001
rem  重启动..
Echo Windows 远程桌面(mstsc)不能复制粘贴的解决办法
Echo 正在结束进程...
taskkill /f /im rdpclip.exe
echo 重启UI..
start rdpclip.exe
pause