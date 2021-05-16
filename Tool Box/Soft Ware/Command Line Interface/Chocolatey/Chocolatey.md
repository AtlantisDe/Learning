# Chocolatey (巧克力)

- [Chocolatey - The package manager for Windows](https://chocolatey.org/)

```c#
The Package Manager for Windows
Modern Software Automation
```

## 1. Windows 安装使用

- [Installation](https://chocolatey.org/docs/installation)
- [Windows 下 Chocolatey 上手教程](https://www.jianshu.com/p/5325decea0d2)
- [Installation](https://chocolatey.org/docs/installation#non-administrative-install)
- [Installation](https://chocolatey.org/docs/installation#completely-offline-install)

```c#
choco -v

choco

Chocolatey v0.10.15


// Install with cmd.exe
// 管理员的身份 运行CMD命令:

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"


// Install with PowerShell.exe
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

// Completely offline install
https://chocolatey.org/packages/chocolatey

// Requirements
// Windows 7+ / Windows Server 2003+
// PowerShell v2+ (Not PowerShell Core yet though)(minimum is v3 for install from this website due to TLS 1.2 requirement)
// .NET Framework 4+ (the installation will attempt to install .NET 4.0 if you do not have it installed)(minimum is 4.5 for install from this website due to TLS 1.2 requirement)


// Installing Chocolatey
// Chocolatey installs in seconds. You are just a few steps from running choco right now!

1. First, ensure that you are using an administrative shell - you can also install as a non-admin, check out Non-Administrative Installation.
2. Copy the text specific to your command shell - cmd.exe or powershell.exe.
3. Paste the copied text into your shell and press Enter.
4. Wait a few seconds for the command to complete.
5. If you don't see any errors, you are ready to use Chocolatey! Type choco or choco -? now, or see Getting Started for usage instructions.



// Chocolatey的使用也很简单，使用指令如下：
choco search <keyword>    搜索软件
choco list <keyword>  跟 search 命令功能类似
choco install <package1 package2 package3...>  安装软件
choco install <package>  -version *** 安装指定版本
choco  uninstall name 卸载软件
choco version <package>  查看安装包的版本情况
choco  upgrade <package>   更新某个软件
choco list -localonly        查看一下所有安装在本地的包的列表
choco list -lo       功能同上

```

## 2. 其它相关项目

- [chocolatey/ChocolateyGUI](https://github.com/chocolatey/ChocolateyGUI)
- [ChocolateyGUI](https://chocolatey.github.io/ChocolateyGUI/about)
