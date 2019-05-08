:: 自己测试没成功,请直接打开文件夹删吧
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Default" /va /f
::attrib -s -h -r "%USERPROFILE%\My Documents\default.rdp"
::del /a:h "%USERPROFILE%\My Documents\default.rdp"
attrib -h "%USERPROFILE%\My Documents\default.rdp"
del "%USERPROFILE%\My Documents\default.rdp" /ah
pause
