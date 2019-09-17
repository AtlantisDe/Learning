# IIS 支持 PHP

## 步骤

### 1. 安装

- [Windows10 IIS 配置 PHP 运行环境（原创） - 闻海南 - 博客园](https://www.cnblogs.com/wenhainan/p/5600346.html)

- FastCgiModule
- ![avatar](https://images.cnblogs.com/cnblogs_com/haocool/201210/201210142044268882.jpg)

```text
名称:PHP
名称:PHP 7.3.4nts
D:\phpstudy_pro\Extensions\php\php7.3.4nts\php-cgi.exe
D:\phpStudy\PHPTutorial\php\php-5.6.27-nts\php-cgi.exe
C:\Lib\php\56\php-cgi.exe

IIS-----处理程序映射----添加模块映射

1. 请求路径: *.php
2. 模块:FastCgiModule
3. 可执行文件 D:\phpStudy\PHPTutorial\php\php-7.2.1-nts\php-cgi.exe
4. 名称:PHP_FastCGI

可选操作:
配置默认文档
index.php
```

### 2. 版本

```c#
php.exe -v
```
