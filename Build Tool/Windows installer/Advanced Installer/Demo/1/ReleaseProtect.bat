@echo off


Echo Protecting.....

del "D:\Work\Obproj\DemoProject\DemoProject.zip"

del D:\Work\Obproj\DemoProject\Protect\*.* /f/s/q/a

"C:\Program Files (x86)\LogicNP Software\Crypto Obfuscator For .Net 2018\co.exe" projectfile="D:\Work\Obproj\DemoProject\DemoProject.obproj"

xcopy "D:\Work\Obproj\DemoProject\Protect\*.*" "D:\Work\Obproj\DemoProject\Release" /y


"C:\Program Files\WinRAR\WinRAR.exe" a -r  -ep1 "D:\Work\Obproj\DemoProject\DemoProject.zip" "D:\Work\Obproj\DemoProject\Release"


certutil -hashfile "D:\Work\Obproj\DemoProject\DemoProject.zip" MD5 >>"D:\Work\Obproj\DemoProject\MD5.txt"

Echo Complete.

pause