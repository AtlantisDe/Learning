@ECHO OFF
 
@ECHO           *********************************************************************************************************
@ECHO                                               Win10 �����ֽ��������                                                                                                                               
@ECHO                          ����ͼƬ�ļ����ڡ�������ֽ���ļ����У����Ժ�ˢ�µ�ǰĿ¼�鿴
@ECHO                          ������ĳЩ�ļ����ܲ���ͼƬ���粻��������ʾ�������
@ECHO                          ԭ����https://blog.csdn.net/hongweigg
@ECHO           *********************************************************************************************************
 
REM �����ļ��ļ�����
set FOLDERNAME=������ֽ
 
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
 
echo ͼƬ�ҳ��ɹ�����ˢ�µ�ǰĿ¼�鿴......
pause > nul