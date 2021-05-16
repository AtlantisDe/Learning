@ECHO OFF
 
@ECHO           *********************************************************************************************************
@ECHO                                               Win10 桌面壁纸导出工具                                                                                                                               
@ECHO                          导出图片文件放在“导出壁纸”文件夹中，请稍后刷新当前目录查看
@ECHO                          导出的某些文件可能不是图片，如不能正常显示，请忽略
@ECHO                          原创：https://blog.csdn.net/hongweigg
@ECHO           *********************************************************************************************************
 
REM 导出文件文件夹名
set FOLDERNAME=导出壁纸
 
set ASSETS=AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets
REM  echo %USERPROFILE%\%ASSETS%
 
setlocal 
set PICDIR=%USERPROFILE%\%ASSETS%  
mkdir %FOLDERNAME%
set TO_DIR=%~dp0%FOLDERNAME%
cd %PICDIR%
 
for /F "delims==" %%i in ('dir /b') do (
@	REM echo %%~fi
	copy %%~fi  %TO_DIR%\%%i.png
)
endlocal
 
echo 图片找出成功，请刷新当前目录查看......
pause > nul