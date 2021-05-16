# Scoop

```Scoop
Scoop is a command-line installer for Windows.
```

- [lukesampson/scoop](https://github.com/lukesampson/scoop)
- [Scoop](https://scoop.sh/)
- [scoop——强大的 Windows 命令行包管理工具](https://www.jianshu.com/p/50993df76b1c)

## Requirements

- Windows 7 SP1+ / Windows Server 2008+
- PowerShell 5 (or later, include PowerShell Core) and .NET Framework 4.5 (or later)
- PowerShell must be enabled for your user account e.g. Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

## 安装 scoop

```c#
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex
```

## Scoop installs the tools you know and love

```c#
scoop install curl
```
