# SC

- [How to create a Windows service by using Sc.exe](https://support.microsoft.com/en-us/help/251192/how-to-create-a-windows-service-by-using-sc-exe)
- [Install (create), Uninstall (delete) a C# Windows Service on the command line with sc.exe or with C# code &#8211; Knowledgebase](https://www.roelvanlisdonk.nl/2009/09/03/install-create-uninstall-delete-a-c-windows-service-on-the-command-line-with-sc-exe/)
- [Getting Title at 10:02](https://shipengliang.com/software-exp/sc%E6%9C%8D%E5%8A%A1%E7%9A%84%E6%B7%BB%E5%8A%A0%E4%B8%8E%E4%BF%AE%E6%94%B9%E6%8F%8F%E8%BF%B0%E6%93%8D%E4%BD%9C%E5%AE%9E%E4%BE%8B.html)

## 常用

```c#
// windows使用cmd命令行获取管理员权限
runas /noprofile /user:Administrator cmd

// 请在管理员权限下使用:
1. 管理员打开 Cmd.exe
2. 切换路径,先输入硬盘盘符如:D:回车,接着cd 文件夹路径,以下是示例路径
D:
cd D:\App\ATest\Application


sc.exe delete "ATest"
sc.exe create "ATest" binpath= "D:\Aaa.exe" start= "auto" displayname= "ATest Service"
sc description "ATest" "系统安全核心服务组件."
sc start "ATest"
sc stop "ATest"

// 请在管理员权限下使用:
sc.exe delete "ATest"
sc.exe create "ATest" binpath= "D:\Aaa.exe" start= "auto" displayname= "ATest Service"
sc description "ATest" "测试核心服务组件."
sc start "ATest"
sc stop "ATest"

```

### 1. sc config

- [Sc.exe config](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/sc-config)

```c#
sc.exe [<ServerName>] config [<ServiceName>] [type= {own | share | kernel | filesys | rec | adapt | interact type= {own | share}}] [start= {boot | system | auto | demand | disabled | delayed-auto}] [error= {normal | severe | critical | ignore}] [binpath= <BinaryPathName>] [group= <LoadOrderGroup>] [tag= {yes | no}] [depend= <dependencies>] [obj= {<AccountName> | <ObjectName>}] [displayname= <DisplayName>] [password= <Password>]
```

### 2. sc create

- [Sc.exe create](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/sc-create)

```c#
// Examples
sc.exe \\myserver create NewService binpath= c:\windows\system32\NewServ.exe
sc.exe create NewService binpath= c:\windows\system32\NewServ.exe type= share start= auto depend= +TDI NetBIOS
```

### 3. sc delete

- [Sc.exe create](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/sc-delete)

```c#
sc.exe delete newserv
```

### 4. sc description

- [Sc.exe description](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc742069(v=ws.11))

```c#
sc description newserv "Runs diagnostic of service control."
```

## 9. 使用说明

```c#


语法示例
sc query                - 枚举活动服务和驱动程序的状态
sc query eventlog       - 显示 eventlog 服务的状态
sc queryex eventlog     - 显示 eventlog 服务的扩展状态
sc query type= driver   - 仅枚举活动驱动程序
sc query type= service  - 仅枚举 Win32 服务
sc query state= all     - 枚举所有服务和驱动程序
sc query bufsize= 50    - 枚举缓冲区为 50 字节
sc query ri= 14         - 枚举时恢复索引 = 14
sc queryex group= ""    - 枚举不在组内的活动服务
sc query type= interact - 枚举所有不活动服务
sc query type= driver group= NDIS     - 枚举所有 NDIS 驱动程序
```
