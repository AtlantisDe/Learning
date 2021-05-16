# win-acme

- [win-acme](https://www.win-acme.com/)
- [win-acme/win-acme](https://github.com/win-acme/win-acme)
- [win-acme 2.1.12.932](https://www.nuget.org/packages/win-acme)
- [IIS 使用 Let&#39;s Encrypt 并配置 HTTP 跳转 HTTPS - xuxuzhaozhao - 博客园](https://www.cnblogs.com/xuxuzhaozhao/p/8184282.html)

## 1. 安装

```c#
dotnet tool install --global win-acme --version 2.1.12.932
```

## 2. Windows 安装使用

- [win-acme](https://www.win-acme.com/reference/plugins/installation/script)

```c#
https://github.com/win-acme/win-acme/releases/download/v2.1.12/win-acme.v2.1.12.943.x64.pluggable.zip

%ProgramData%\win-acme

```

## 3. 了解

```c#
A simple Windows ACMEv2 client (WACS)
 Software version 2.1.11.917 (RELEASE, PLUGGABLE, 64-bit)
 ACME server https://acme-v02.api.letsencrypt.org/
 IIS version 10.0
 Running with administrator credentials
 Scheduled task not configured yet
 Please report issues at https://github.com/win-acme/win-acme

 一个简单的Windows ACMEv2客户端（WACS）
  软件版本2.1.11.917（发布，可插入，64位）
  ACME服务器https://acme-v02.api.letsencrypt.org/
  IIS 10.0版
  使用管理员凭据运行
  预定任务尚未配置
  请在https://github.com/win-acme/win-acme报告问题

N: Create certificate (default settings)
M: Create certificate (full options)
R: Run renewals (0 currently due)
A: Manage renewals (0 total)
O: More options...
Q: Quit

N：创建证书（默认设置）
M：创建证书（完整选项）
R：运行续订（0到期）
答：管理续订（共0个）
O：更多选择...
问：退出



```

## 4. 自动续约

- [win-acme](https://www.win-acme.com/manual/automatic-renewal)
- [DefaultCentralSslPfxPassword Problem · Issue #1071 · win-acme/win-acme](https://github.com/win-acme/win-acme/issues/1071)

```c#
Automatic renewal
Scheduled task
A single scheduled task is responsible to renew all certificates created by the program, but will only do so when it’s actually neccessary. The task is created by the program itself after successfully creating the first certificate. The task runs every day and checks two conditions to determine if it should renew:

If the certificate is getting too old. This is based on the known history stored in the file.
If the target (list of domains) has changed, e.g. an extra binding has been added to an IIS site.
Customization
The default renewal period of 55 days can be changed in settings.json. Other properties of the scheduled task can also be changed that way, or from the Task Scheduler itself, as long as its name left unmodified. By default it runs at 9:00 am using the SYSTEM account.

Health checks
The health of the scheduled task is checked each time the program is run manually. It can also be (re)created from the menu (More options... > (Re)create scheduled task).

Monitoring
The renewal process can be monitored from the Windows Event Viewer and log files written to %programdata%\win-acme\$baseuri$\Log. You can also set up email notifications by configuring a mail server in settings.json. You can test these notifications from the menu (More options... > Test email notification).

Testing and troubleshooting
To test or troubleshoot the renewal process, renewals can be triggered manually from the menu or the command line with the --renew --force switches. We recommend doing so while running with the --verbose parameter to get maximum log visibility. When listing the details for a renewal, the program will show any errors that have been recorded during previous runs.

// 自动续订
// 计划任务
// 一个预定的任务负责更新该程序创建的所有证书，但是只有在确实需要时才这样做。成功创建第一个证书后，程序将自己创建任务。该任务每天运行，并检查两个条件以确定是否应续签：

// 如果证书太旧。这基于存储在文件中的已知历史记录。
// 如果目标（域列表）已更改，例如，一个额外的绑定已添加到IIS站点。
// 客制化
// 可以在settings.json中更改默认的55天续订时间。计划任务的其他属性也可以用这种方法更改，也可以从任务计划程序本身更改，只要其名称保持不变即可。默认情况下，它使用该SYSTEM帐户在上午9:00运行。

// 健康检查
// 每次手动运行程序时，都会检查计划任务的运行状况。也可以从菜单（More options...> (Re)create scheduled task）（重新）创建。

// 监控方式
// 可以从Windows Event Viewer监视续订过程，并将日志文件写入%programdata%\win-acme\$baseuri$\Log。您还可以通过在settings.json中配置邮件服务器来设置电子邮件通知。您可以从菜单（More options...> Test email notification）测试这些通知。

// 测试和故障排除
// 要对续订过程进行测试或排除故障，可以通过菜单或命令行中的--renew --force开关手动触发续订。我们建议在使用--verbose参数运行时这样做， 以获得最大的日志可见性。当列出续订的详细信息时，该程序将显示以前运行期间记录的所有错误。
```

## 5. 语言翻译

```c#
Automatic renewal  //自动续约 续期
Export/Import Certificate // 导入导入证书

A simple Windows ACMEv2 client (WACS) // 一个简单的Windows ACME v2客户端（WAS）

```
