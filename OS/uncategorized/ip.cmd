@echo off 
for /l %%a in (1,1,253) do netsh interface ip add address name="NIC1" addr=103.26.127.%%a mask=255.255.255.0