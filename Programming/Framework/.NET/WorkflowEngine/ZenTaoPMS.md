# ZenTaoPMS | 禅道

- [项目管理软件 开源项目管理软件 免费项目管理软件 - 禅道开源项目管理软件](https://www.zentao.net/index.html)

```c#

```

## 0. Installation

- [禅道 12.5.3 版本发布，主要重构年度汇总功能 - 禅道下载 - 禅道开源项目管理软件](https://www.zentao.net/dynamic/zentaopms12.5.3-80319.html)
- [选择适合您的安装方法 - 禅道开源版使用帮助 - 禅道开源项目管理软件](https://www.zentao.net/book/zentaopmshelp/40.html)
- [解决一键安装包密码口令弱的问题 - 禅道开源版使用帮助 - 禅道开源项目管理软件](https://www.zentao.net/book/zentaopmshelp/467.html)
- [禅道 Mysql 默认密码修改 - 亲爱的伟哥哥 - 博客园](https://www.cnblogs.com/weigege/p/9287972.html)

```c#
// 直接用这个安装,Windows一键安装包 64位

// 使用源码包安装 (不推荐,直接下载一键安装)
https://dl.cnezsoft.com/zentao/12.5.3/ZenTaoPMS.12.5.3.zip
https://www.zentao.net/dl/zentao/12.5.3/ZenTaoPMS.12.5.3.zip

// 安装要领
// 使用源码包安装(windows系统)
// 如果电脑上,安装了其它PHP环境套件,直接修改下Mysql端口和Apache端口即可

Apache,端口号为：11808
mysql,端口号为：3386


// 禅道控制面板
账号: zentao
密码: uUTaRMhXSmHr


// 第一次登陆需要修改密码即可
// 易软天创项目管理系统
默认账号: admin
密码: 123456


// 禅道控制面板 2.1.8
// php版本：PHP 7.2.33 (cli) (built: Aug  4 2020 11:50:49) ( ZTS MSVC15 (Visual C++ 2017) x64 )
// apache版本：Server version: Apache/2.4.46 (Win64)
// mysql版本：D:\Site\DemoSites\ZenTaoPMS_11215\xampp\mysql\bin\mysqld.exe  Ver 10.4.14-MariaDB for Win64 on AMD64 (mariadb.org binary distribution)
// 禅道版本：12.5.3
// 禅道专业版版本：pro9.0.3
// 禅道企业版版本：biz4.1.3

// 当前目录：D:\Site\DemoSites\ZenTaoPMS_11215\xampp\

// 正在停止服务：apachezt...服务没有安装。
// 正在卸载服务：apachezt...成功卸载。
// 正在停止服务：mysqlzt...服务没有安装。
// 正在卸载服务：mysqlzt...成功卸载。
// 正在停止服务：xxdzt...服务没有安装。
// 正在卸载服务：xxdzt...成功卸载。

// 正在启动聊天服务......
// 正在安装服务：xxdzt...安装成功。
// 正在启动服务：xxdzt...
// 成功启动服务，端口号为：11443
// 聊天服务正在运行，服务器地址为 http://0.0.0.0:11443。



11999-ZenTaoPMS

netsh advfirewall firewall add rule name="ZenTaoPMS HTTP Server for Inbound TCP/11999" protocol=TCP dir=in localport=11999 action=allow

// 阿里云安全组:
允许 1 自定义 TCP 目的: 11999/11999 源: 0.0.0.0/0


```

## 1. 使用源码包

```c#
// 使用源码包安装(windows系统)

// 安装要领
// 如果电脑上,安装了其它PHP环境套件,直接修改下Mysql端口和Apache端口即可
```
