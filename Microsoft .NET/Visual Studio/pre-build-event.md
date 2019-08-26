# pre-build-event

- [预生成事件/生成后事件命令行对话框 - Visual Studio](https://docs.microsoft.com/zh-cn/visualstudio/ide/reference/pre-build-event-post-build-event-command-line-dialog-box?view=vs-2019)
- [VS2013 生成事件，删除不必要的 DLL - felixnet - 博客园](https://www.cnblogs.com/felixnet/p/5132189.html)

## 事件 Demo 代码

### 1. 删除不不要 DLL

```c#
IF EXIST $(TargetDir)Oracle.ManagedDataAccess.dll DEL $(TargetDir)Oracle.ManagedDataAccess.dll

IF EXIST $(TargetDir)Npgsql.dll DEL $(TargetDir)Npgsql.dll

IF EXIST $(TargetDir)MySql.Data.dll DEL $(TargetDir)MySql.Data.dll

IF EXIST $(TargetDir)*.pdb DEL $(TargetDir)*.pdb



set TargetDir="" & DEL %TargetDir%Oracle.ManagedDataAccess.dll

```

### 2. 命令行

```c#
xcopy /r /y $(TargetPath) $(ProjectDir)..\Bin\
xcopy /r /y $(TargetDir)$(TargetName).pdb $(ProjectDir)..\Bin\
xcopy /r /y $(TargetPath) $(ProjectDir)..\Release\
xcopy /r /y $(TargetDir)$(TargetName).pdb $(ProjectDir)..\Release\

xcopy /r /y $(ProjectDir)Resource\zh-CN\NeoNetech.LiveFP.V2.resources.dll $(ProjectDir)..\Bin\zh-CN\
xcopy /r /y $(ProjectDir)Resource\en-US\NeoNetech.LiveFP.V2.resources.dll $(ProjectDir)..\Bin\en-US\
xcopy /r /y $(ProjectDir)Resource\NeoNetech.LiveFP.V2.dll $(ProjectDir)..\Bin
```

### 3. 编译之前运行 bat 脚本

```c#
cd $(ProjectDir)\Resource
BuildResource.bat
```

### 999. 其它 DEMO

```c#
IF EXIST $(TargetDir)Pechkin.dll DEL $(TargetDir)Pechkin.dll

RMDIR "$(OutDir)"
RMDIR /Q "$(OutDir)"
// rm (选项)(参数)

```
