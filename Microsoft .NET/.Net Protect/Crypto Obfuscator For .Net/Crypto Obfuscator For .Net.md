# Crypto Obfuscator For .Net

- [light, Windows Phone 7 and ASP.Net Websites - Features](https://www.ssware.com/cryptoobfuscator/features.htm)
- [Version history - Crypto Obfuscator For .Net](https://www.ssware.com/cryptoobfuscator/versionsnet.htm)

## 基本配置

```c#
// 当前使用环境
C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\sn.exe
C:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x86\signtool.exe
//配置会自动配置在工程文档内,只需要一次

where sn

C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\sn.exe
C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.2 Tools\sn.exe

SignTool.exe
where SignTool.exe

C:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x86\signtool.exe
C:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x86\signtool.exe
```

## Crypto Obfuscator Command Line Interface

### 1.0 Exit Codes

```C#

If the project is successfully obfuscated, the co.exe process returns 0; if a general error/exception occurs, it returns 1, if a error related to the licensing of Crypto Obfuscator occurs (for example, if the evaluation of Crypto Obfuscator expires), it returns 2.

```

### 2.0 Examples

```C#

co.exe projectfile=c:\MyProject.obproj

The above command line opens the project file "c:\MyProject.obproj" and obfuscates it.


co.exe projectfile=c:\MyProject.obproj controlflow=Off obfuscationtype=Aggressive encryptstrings=false

The above command line opens the project file "c:\MyProject.obproj" and obfuscates it. Control flow and string encryptionis switched off and 'Aggressive' obfuscation mode is used.



co.exe getwatermarks=c:\MyApp.dll savewatermarks=c:\MyApp_watermarks.txt

The above command line retrieves watermarks embedded in the file "c:\MyApp.dll" and saves them to the file "c:\MyApp_watermarks.txt".



co.exe deobfuscatemapfile=c:\MyProj.obproj.map deobfuscateinputfile=c:\obfuscated_trace.txt deobfuscateoutputfile=c:\original_trace.txt

The above command line deobfuscates the stacktrace from "c:\obfuscated_trace.txt" and saves them to the file "c:\original_trace.txt". The map file "c:\MyProj.obproj.map" is used.




```

## 中文语言包

```c#
Exclusion/Inclusion Rules 排除/包含规则
Honor Obfuscation Attributes Used In Code 代码中使用的荣誉混淆属性

Error occurred while obfuscation:  - Authenticode signing failed for assembly 'Demo'. SignTool.exe returned with exit code 1. Possible causes: unspecified/incorrect password.

混淆时发生错误： - 程序集“Demo”的Authenticode签名失败。 SignTool.exe返回退出代码1.可能的原因：未指定/错误的密码。


Error occurred while obfuscation:  - The assembly 'AlePanel' is already obfuscated with Crypto Obfuscator.
If you have run the Visual Studio Project Integration Wizard on your Visual Studio projects, you cannot obfuscate from the Crypto Obfuscator UI
unless you first disable automatic obfuscation for this project from Crypto Obfuscator's 'Project' menu --> 'Enable/Disable Visual Studio Integration' and Rebuild your solution in Visual Studio to produce unobfuscated assemblies.

混淆时发生错误： - 程序集“AlePanel”已经使用Crypto Obfuscator进行了混淆。
如果已在Visual Studio项目上运行Visual Studio项目集成向导，则无法从Crypto Obfuscator UI中进行模糊处理
除非您首先从Crypto Obfuscator的“项目”菜单中禁用此项目的自动模糊处理 - >“启用/禁用Visual Studio集成”并在Visual Studio中重建您的解决方案以生成未经模糊处理的程序集。


The assembly 'DemoCore' was NOT originally signed but was signed after obfuscation. The assembly may not run correctly!
 -->Solution: Select this assembly in the list above, then via the 'Signing / Authenticode' tab, remove the key file specified for this assembly.
Loading assembly 'D:\a.dll'
Detected Assembly Target Framework: Normal

装配'DemoCore'最初没有签署，但在混淆后签署。 装配可能无法正常运行！
   - >解决方案：在上面的列表中选择此程序集，然后通过“签名/验证码”选项卡，删除为此程序集指定的密钥文件。
加载程序集'D：\ a.dll'
检测到的装配目标框架：正常

```

### 3. 常用调试命令

```c#
// ** Obfuscation completed successfully. **
C:\Program Files (x86)\LogicNP Software\Crypto Obfuscator For .Net 2018\co.exe projectfile="D:\demo\admin.obproj"
```

### 4. 秘钥文件提示

```c#
Error occurred while obfuscation:  - Unable to load specified key file for assembly 'Demo' - the path may be incorrect or password for pfx file may be incorrect.

混淆时发生错误：-无法为程序集“ Demo”加载指定的密钥文件-路径可能不正确，或者pfx文件的密码可能不正确。
```

### 5. SN.exe 文件找不到 在升级 VS 以后情况

```c#
// sn.exe utility not found for signing assembly.

// You will now be prompted to specify the full path of sn.exe on your machine.

// 找不到用于签名程序集的sn.exe实用工具。

// 现在将提示您指定计算机上sn.exe的完整路径。


C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\sn.exe
```
