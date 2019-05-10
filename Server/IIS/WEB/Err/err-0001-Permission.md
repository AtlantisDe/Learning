# Permission

- [HTTP 错误 401.3 - Unauthorized](https://blog.csdn.net/chenzhijie101/article/details/75089472)
- [ASP.NET 对路径&quot;xxxxx&quot;的访问被拒绝的解决方法小结](https://www.cnblogs.com/qiywtc/p/3782179.html)
- [对路径“c:\windows\system32\inetsrv\syslog”的访问被拒绝](https://blog.csdn.net/hht006158/article/details/80674716)
- [VS2013 IIS Express 没有权限访问元数据库的一种解决方法](https://blog.csdn.net/huangwei858/article/details/51783194)
- [Understanding Built-In User and Group Accounts in IIS 7](https://docs.microsoft.com/en-us/iis/get-started/planning-for-security/understanding-built-in-user-and-group-accounts-in-iis)
- [What are all the user accounts for IIS/ASP.NET and how do they differ?](https://stackoverflow.com/questions/5729264/what-are-all-the-user-accounts-for-iis-asp-net-and-how-do-they-differ)
- [使用 vs2015 自带 IIS 调试 web 程序，访问本机文件的时候权限不足怎么解决？*已解决*博问\_博客园](https://q.cnblogs.com/q/106100/)
- [Running IIS Express without Administrative Privileges](https://docs.microsoft.com/en-us/iis/extensions/using-iis-express/running-iis-express-without-administrative-privileges)
- [IIS Express 開啟 Windows 身分驗證-黑暗執行緒](https://blog.darkthread.net/blog/iis-express-authentication/)
- [asp.net 项目中通过 Web.config 配置文件及文件夹的访问权限！](https://www.cnblogs.com/lsgsanxiao/p/4253441.html)

## 对路径“c:\windows\system32\inetsrv\syslog”的访问被拒绝

```shell
IIS---》应用程序池---》右键高级设置---》进程模型 中的标识改为 “localSytem” 然后重启IIS解决问题。

方法1：将IIS的执行用户修改为LocalService，默认的是NetworkService，权限较低

方法2：将路径的权限放开
```
