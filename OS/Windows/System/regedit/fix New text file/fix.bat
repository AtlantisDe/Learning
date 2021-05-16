@echo off
chcp 1200
echo 修复右键没有新建文本文档
pause
reg add "HKEY_CLASSES_ROOT\.txt" /ve /d "txtfile" /f
reg add "HKEY_CLASSES_ROOT\.txt\ShellNew" /v "NullFile" /f
pause