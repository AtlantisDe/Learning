@echo off
chcp 65001
echo             使用前请下载好JRE安装包放在C盘
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

set myjrepath=C:\Java\jre

echo **********************************************
echo.
echo           将要安装软件运行环境jre
echo.
echo       安装请按任意键，退出直接关闭窗口
echo.
echo **********************************************

pause

echo.
echo 正在安装jre，请不要执行其他操作
echo.
echo 请稍等，这个时间大约需要四、五分钟
echo.
start /WAIT C:\jre-8u211-windows-x64.exe /s INSTALLDIR=C:\Java\jre
echo jre安装完毕

set JAVA_HOME=C:\Java
set PATH=%PATH%;%%JAVA_HOME%%\jre\bin
set CLASSPATH=.;%%JAVA_HOME%%\jre\lib

set RegV=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment

reg add "%RegV%" /v "JAVA_HOME" /d "%JAVA_HOME%" /f
reg add "%RegV%" /v "Path" /t REG_EXPAND_SZ /d "%PATH%" /f
reg add "%RegV%" /v "CLASSPATH" /d "%CLASSPATH%" /f
mshta vbscript:msgbox("Java环境已成功注册！",64,"成功")(window.close)

exit