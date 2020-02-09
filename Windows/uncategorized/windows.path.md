# windows.path

- [window 系统下获取当前用户目录 - Egan123 - 博客园](https://www.cnblogs.com/egan123/p/10115639.html)

```c#
在cmd下输入echo %USERPROFILE%可以查看当前系统用户目录

这边列举一些其他常用的获取系统路径的：

%WINDIR%                 {系统目录 - C:\WINDOWS}

%SYSTEMROOT%             {系统目录 - C:\WINDOWS}

%SYSTEMDRIVE%            {系统根目录 - C:}

%HOMEDRIVE%              {当前用户根目录 - C:}

%USERPROFILE%            {当前用户目录 - C:\Documents and Settings\wy}

%HOMEPATH%               {当前用户路径 - \Documents and Settings\wy}

%TMP%                    {当前用户临时文件夹 - C:\DOCUME~1\wy\LOCALS~1\Temp}

%TEMP%                   {当前用户临时文件夹 - C:\DOCUME~1\wy\LOCALS~1\Temp}

%APPDATA%                {当前用户数据文件夹 - C:\Documents and Settings\wy\Application Data}

%PROGRAMFILES%           {程序默认安装目录 - C:\Program Files}

%COMMONPROGRAMFILES%     {文件通用目录 - C:\Program Files\Common Files}

%USERNAME%               {当前用户名 - wy}

%ALLUSERSPROFILE%        {所有用户文件目录 - C:\Documents and Settings\All Users}

%OS%                     {操作系统名 - Windows_NT}

%COMPUTERNAME%           {计算机名 - IBM-B63851E95C9}

%NUMBER_OF_PROCESSORS%   {处理器个数 - 1}

%PROCESSOR_ARCHITECTURE% {处理器芯片架构 - x86}

%PROCESSOR_LEVEL%        {处理器型号 - 6}

%PROCESSOR_REVISION%     {处理器修订号 - 0905}

%USERDOMAIN%             {包含用户帐号的域 - IBM-B63851E95C9}

%PATH%    {搜索路径}
```
