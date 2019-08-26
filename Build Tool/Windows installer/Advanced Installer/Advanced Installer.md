# Advanced Installer

- [Free Windows Installer - MSI Installer Tool](https://www.advancedinstaller.com/)
- [安装包制作工具 Advanced Installer v16.1 + v16.0 付费汉化版！心海首发！-心海 e 站](https://hrtsea.com/27808.html)
- [Advanced Installer](https://www.youtube.com/user/AdvancedInstaller/videos)
- [如何使用 AdvancedInstaller 在安装包中运行一个.bat 文件-云栖社区-阿里云](https://yq.aliyun.com/articles/263493)
- [AdvanceInstaller 打包安装及完成后调用 .bat 文件方法 - Microchen2008 的专栏 - CSDN 博客](https://blog.csdn.net/Microchen2008/article/details/47293491)

## 常用知识点

### 1. App-V Context Menu Shortcuts

- [App-V Context Menu Shortcuts](https://www.advancedinstaller.com/app-v-context-menu-shortcuts.html)
- [Import Registry File (Advanced)](https://www.advancedinstaller.com/user-guide/registry-import-file-advanced.html)

### 2. logo

- [Removing this banner? - Advanced Installer](https://www.advancedinstaller.com/forums/viewtopic.php?t=19509)

### 3. Install Sequence 安装顺序

### 4. 添加忽略文件

- [Advanced Installer 添加忽略文件 - 小数点儿的博客 - CSDN 博客](https://blog.csdn.net/qq_33074817/article/details/97245547)

### 5. 卸载保留文件

- [How do I prevent a file or registry entry from being uninstalled or&#xA; repaired?](https://www.advancedinstaller.com/user-guide/qa-keep-file.html)
- [advanced installer 卸载软件时保留一些文件-CSDN 论坛](https://bbs.csdn.net/topics/390792061/)

```c#
to prevent it from being uninstalled check the "Permanent" attribute
```

### 6. 安装区间 删除文件

- [How to remove a file or a folder during installation](https://www.advancedinstaller.com/user-guide/qa-remove-file-or-folder.html)
- [File Removal Dialog](https://www.advancedinstaller.com/user-guide/file-removal-dialog.html)

### 7. LZMA Compression

- [LZMA Compression](https://www.advancedinstaller.com/user-guide/lzma-compression.html)
- [Unzip 7zip while installing - Advanced Installer](https://www.advancedinstaller.com/forums/viewtopic.php?t=30632)

### 8. Extract Archive Dialog

- [Extract Archive Dialog](https://www.advancedinstaller.com/user-guide/extract-archive-dialog.html)
- Remove archive after extraction 提取后删除存档
- Remove extracted files on uninstall 在卸载时删除提取的文件

### 9. 安装成功后执行

- [AdvanceInstaller 打包安装及完成后调用 .bat 文件方法 - Microchen2008 的专栏 - CSDN 博客](https://blog.csdn.net/Microchen2008/article/details/47293491)

### 10. Command line

```c#
devenv.com
devenv.com "D:\demo.sln" /Build "Release|x64" /project "D:\demo.csproj"
C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\
Demo Description

MSBuild.exe
msbuild "D:\demo.sln" /p:DeployOnBuild=true /p:PublishProfile="D:\demo1\Properties\PublishProfiles\Release.x64.pubxml"
C:\Windows\Microsoft.NET\Framework\v4.0.30319\
Demo Description

MSBuild.exe
msbuild "D:\demo.sln" /p:DeployOnBuild=true /p:PublishProfile="D:\demo1\Properties\PublishProfiles\Release.x64.pubxml"
C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\
Demo Description

// 2019
C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\amd64
C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin

devenv.com
devenv.com "D:\demo.sln" /Build "Release|x64" /project "D:\demo.csproj"
C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\
Demo Description

MSBuild.exe
msbuild "D:\demo.sln" /p:DeployOnBuild=true /p:PublishProfile="D:\demo1\Properties\PublishProfiles\Release.x64.pubxml"
C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\
Demo Description


```

### 11. 语言包 中文

```c#
Wizard

// WelcomeDlgSubTitle
The [Wizard] will install [ProductName] on your computer. Click [Text_Next] to continue or close the window to exit the [Wizard].

[Wizard]将在您的计算机上安装[ProductName]。 单击[Text_Next]继续或关闭窗口以退出[向导]。


// ResumeDlgDescription
The [Wizard] will complete the installation of [ProductName] on your computer.  Click Install to continue or close the window to exit the [Wizard].
[Wizard]将在您的计算机上完成[ProductName]的安装。 单击“安装”继续或关闭窗口以退出[Wizard]。

// SetupTypeDlgTypicalLabel
Install Now
现在安装

// SetupTypeDlgTypicalDesc
Installs most common features
安装最常见的功能
安装最常见的功能(推荐这个安装,默认根路径是D盘,当然你也可以安装到其它盘!)
推荐这个安装,默认根路径是D盘

// SetupTypeDlgCustomLabel
Custom
自定义安装


// SetupTypeDlgCustomDesc
Choose features to install
选择要安装的功能
选择要安装的功能(不推荐)

// ExitDlgSubTitle
[ProductName] has been successfully [Finish1].
[ProductName] 已成功 [Finish1].

// Finish1
installed
安装


// MaintWelcomeDlgSubTitle
The [Wizard] will allow you to change the way [ProductName] features are installed on your computer or even to remove [ProductName] from your computer.  Click [Text_Next] to continue or close the window to exit the [Wizard].

[Wizard]将允许您更改计算机上安装[ProductName]功能的方式，甚至可以从计算机中删除[ProductName]。 单击[Text_Next]继续或关闭窗口以退出[Wizard]。


// MaintTypeDlgTitle
Change [ProductName] Installation
更改 [ProductName] 安装

// MaintTypeDlgModifyLabel
Modify
修改

// MaintTypeDlgModifyDesc
Add or remove features
添加或删除功能

// MaintTypeDlgRepairLabel
Repair
修复

// MaintTypeDlgRepairDesc
Fix missing or corrupt files
修复丢失或损坏的文件

// MaintTypeDlgRemoveLabel
Uninstall
卸载

// MaintTypeDlgRemoveDesc
Remove [ProductName]
删除 [ProductName]


// PreparePrereqDlgSubTitle
Please wait while the [Wizard] prepares to guide you through the installation.
请等待[Wizard]准备引导您完成安装。

ProgressPrereqDlgSubTitle
Please wait while the [Wizard] [Progress2] prerequisites for [ProductName].  This may take several minutes.
请等待[ProductName]的[Wizard] [Progress2]先决条件。 这可能会需要几分钟。

// VerifyRemoveDlgDescription
Click Remove to remove [ProductName] from your computer.  If you want to review or change any of your installation settings, click Back.  Close the window to exit the wizard.

单击“删除”从计算机中删除[ProductName]。 如果要查看或更改任何安装设置，请单击“上一步”。 关闭窗口以退出向导。

// CtrlEventRemoved
removed
删除


// CustomizeDlgTitle
Installation Option
安装选项

// CustomizeDlgSubTitle
Customize how [ProductName] will be installed
自定义[ProductName]的安装方式

// CustomizeDlgSpaceReq
Total space required on drive: [PrimaryVolumeSpaceRequired]
驱动器所需的总空间：[PrimaryVolumeSpaceRequired]

// FolderDlgSpaceReq
Total space required on drive: [PrimaryVolumeSpaceRequired]
驱动器所需的总空间：[PrimaryVolumeSpaceRequired]

// CustomizeDlgSpaceAvail
Space available on drive: [PrimaryVolumeSpaceAvailable]
驱动器上的可用空间：[PrimaryVolumeSpaceAvailable]


// FolderDlgSpaceAvail
Space available on drive: [PrimaryVolumeSpaceAvailable]
驱动器上的可用空间：[PrimaryVolumeSpaceAvailable]

// FolderDlgSpaceRem
Remaining free space on drive: [PrimaryVolumeSpaceRemaining]
驱动器上剩余的可用空间：[PrimaryVolumeSpaceRemaining]


// VerifyReadyDlgSubTitle
Click Install to begin the installation.  If you want to review or change any of your installation settings, click Back.  Close the window to exit the wizard.

单击“安装”开始安装。 如果要查看或更改任何安装设置，请单击“上一步”。 关闭窗口以退出向导。

// VerifyRepairDlgDescription
Click Repair to repair the installation of [ProductName].  If you want to review or change any of your installation settings, click Back.  Close the window to exit the wizard.

单击“修复”以修复[ProductName]的安装。 如果要查看或更改任何安装设置，请单击“上一步”。 关闭窗口以退出向导。

// WelcomePrereqDlgSubTitle
The setup has determined that some of the prerequisites needed to run [ProductName] are missing. This wizard will assist you in getting and installing those prerequisites. Click "[Text_Next]" to continue or "[ButtonText_Cancel]" to exit the [Wizard].

安装程序已确定缺少运行[ProductName]所需的某些先决条件。 该向导将帮助您获取和安装这些先决条件。 单击“[Text_Next]”继续或“[ButtonText_Cancel]”退出[Wizard]。

// ExitDlgClose
Close
关闭

// CtrlEventConfigured
configured
配置


Are you sure you want to uninstall [ProductName]?
您确定要卸载[ProductName]吗？

// LaunchProdCheckBox
启动 [ProductName]

```

### 12. 中文注解

```c#
launch 运行 发起 发射
Remove extracted files on uninstall 在卸载时删除提取的文件
disable 禁用
Package Definition 包装定义
sequence 顺序
immediately 立即 马上 随即 即刻 即 瞬间
when the system is being modified 当修改系统时
during installaction rollback 在安装回滚期间
after the system has been successfully modified (commit) 系统成功修改后（提交）
Execution Stage Condition 执行阶段条件
install 安装
Uninstall 卸载
Maintenance 保养 维护
upgrade 升级
Merge Modules 合并模块
MainFeature 主要特征
New File Removal 新文件删除
features and components 功能和组件
```

### 13. 注册表

```reg
[WindowsFolder]regedit.exe
```

### 14. Windows Installer Custom Actions

### 15. 复制执行 CMD Demo CODE

- 要点:注意/c 后不能直接跟随& 一定是跟随一条执行 CMD 命令才不会报错

```c#
// protect
"C:\Program Files (x86)\LogicNP Software\Crypto Obfuscator For .Net 2018\co.exe" projectfile="D:\Work\DemoRelease\InstallPackage\SaveProject\Protect-Regmanagement.obproj"

// design
del "D:\Work\DemoRelease\MainRoot\DemoSoft\WebSoft\wwwroot\Regmanagement\bin\*.pdb"

/c
xcopy "D:\Work\DemoRelease\InstallPackage\SaveProject\Dotfuscated\Regmanagement\Democore.dll"
"D:\Work\DemoRelease\MainRoot\DemoSoft\WebSoft\wwwroot\Regmanagement\bin\Democore.dll" /y
& xcopy "D:\Work\DemoRelease\InstallPackage\SaveProject\Dotfuscated\Regmanagement\DemoRegcore.dll"
"D:\Work\DemoRelease\MainRoot\DemoSoft\WebSoft\wwwroot\Regmanagement\bin\DemoRegcore.dll" /y
& xcopy "D:\Work\DemoRelease\InstallPackage\SaveProject\Dotfuscated\Regmanagement\DemoRegmanagement.dll"
"D:\Work\DemoRelease\MainRoot\DemoSoft\WebSoft\wwwroot\Regmanagement\bin\DemoRegmanagement.dll" /y
& xcopy "D:\Work\DemoRelease\InstallPackage\SaveProject\Dotfuscated\Regmanagement\DeviceId.dll"
"D:\Work\DemoRelease\MainRoot\DemoSoft\WebSoft\wwwroot\Regmanagement\bin\DeviceId.dll" /y
& exit
& pause

// code

/c xcopy "D:\Work\DemoRelease\InstallPackage\SaveProject\Dotfuscated\Regmanagement\Democore.dll" "D:\Work\DemoRelease\MainRoot\DemoSoft\WebSoft\wwwroot\Regmanagement\bin\Democore.dll" /y & xcopy "D:\Work\DemoRelease\InstallPackage\SaveProject\Dotfuscated\Regmanagement\DemoRegcore.dll" "D:\Work\DemoRelease\MainRoot\DemoSoft\WebSoft\wwwroot\Regmanagement\bin\DemoRegcore.dll" /y & xcopy "D:\Work\DemoRelease\InstallPackage\SaveProject\Dotfuscated\Regmanagement\DemoRegmanagement.dll" "D:\Work\DemoRelease\MainRoot\DemoSoft\WebSoft\wwwroot\Regmanagement\bin\DemoRegmanagement.dll" /y & xcopy "D:\Work\DemoRelease\InstallPackage\SaveProject\Dotfuscated\Regmanagement\DeviceId.dll" "D:\Work\DemoRelease\MainRoot\DemoSoft\WebSoft\wwwroot\Regmanagement\bin\DeviceId.dll" /y & exit



```
