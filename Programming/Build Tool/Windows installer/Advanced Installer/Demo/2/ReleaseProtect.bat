@echo off

chcp 65001

Echo Protecting.....

Echo %~dp0

REM del "MD5.txt"

set projectTitle=GoogleDemo

set co="C:\Program Files (x86)\LogicNP Software\Crypto Obfuscator For .Net 2018\co.exe"
 

Echo %projectTitle%
Echo %co% 
 

Echo %~dp0ObpOutput\

del %~dp0ObpOutput\*.* /f/s/q/a

set ObpProjectPath=%~dp0ObpProject\%projectTitle%.obproj

Echo %ObpProjectPath% 


%co% projectfile=%ObpProjectPath%

echo %~dp0ReleaseProject\%projectTitle%\

xcopy %~dp0ObpOutput\*.* %~dp0ReleaseProject\%projectTitle%\*.* /y


Echo Complete.


set one=%1
set two=%2

if "%one%"=="" (
echo 空
pause
else (
echo %1
exit
)

 