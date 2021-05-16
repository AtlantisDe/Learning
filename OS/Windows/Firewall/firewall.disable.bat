@echo off
echo 用批处理关闭防火墙，包括家庭和工作网络位置、公用网络位置设置。
netsh firewall set opmode mode=disable profile=ALL
netsh firewall set opmode mode=disable
echo 防火墙已关闭
pause