# IIS 支持 PHP

## 1. QuickStart

### 1. 安装

- [Windows10 IIS 配置 PHP 运行环境（原创） - 闻海南 - 博客园](https://www.cnblogs.com/wenhainan/p/5600346.html)

- FastCgiModule
- ![avatar](https://images.cnblogs.com/cnblogs_com/haocool/201210/201210142044268882.jpg)

```c#
IIS-----处理程序映射----添加模块映射

D:\phpstudy_pro\Extensions\php
D:\phpstudy_pro\Extensions\php\php5.2.17nts
D:\phpstudy_pro\Extensions\php\php5.6.9nts

// 很多PHP程序可能版本不兼容高版本,往往得降级使用

1. 请求路径: *.php
2. 模块:FastCgiModule
3. 可执行文件:


C:\phpstudy_pro\Extensions\php\php7.3.4nts\php-cgi.exe
D:\phpstudy_pro\Extensions\php\php7.3.9nts\php-cgi.exe


D:\phpstudy_pro\Extensions\php\php5.6.9nts\php-cgi.exe
D:\phpstudy_pro\Extensions\php\php7.3.4nts\php-cgi.exe
D:\phpStudy\PHPTutorial\php\php-7.2.1-nts\php-cgi.exe

4. 名称:PHP_FastCGI

5. 可选操作: 配置默认文档 index.php


名称:PHP
名称:PHP 7.3.4nts

D:\phpstudy_pro\Extensions\php\php7.3.4nts\php-cgi.exe
D:\phpstudy_pro\Extensions\php\php5.2.17nts\php-cgi.exe

D:\phpStudy\PHPTutorial\php\php-5.6.27-nts\php-cgi.exe
C:\Lib\php\56\php-cgi.exe


```

### 2. 版本

```c#
php.exe -v
```

### 3. PHP 配置系统环境变量

```c#
编辑权限: 查看高级系统设置

查看权限: 环境变量

找到系统环境变量的: Path 输入Exe所在的文件夹路径即可.

D:\phpstudy_pro\Extensions\php\php7.3.4nts\
```
