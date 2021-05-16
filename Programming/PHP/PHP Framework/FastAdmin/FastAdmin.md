# FastAdmin

- [FastAdmin 开发文档](https://doc.fastadmin.net/)
- [介绍 - FastAdmin 框架文档 - FastAdmin 开发文档](https://doc.fastadmin.net/docs)
- [开发文档 - FastAdmin 开发者文档 - FastAdmin 开发文档](https://doc.fastadmin.net/developer)

```c#
// 特别鸣谢
// 感谢以下的项目,排名不分先后

ThinkPHP：http://www.thinkphp.cn

AdminLTE：https://adminlte.io

Bootstrap：http://getbootstrap.com

jQuery：http://jquery.com

Bootstrap-table：https://github.com/wenzhixin/bootstrap-table

Nice-validator: https://validator.niceue.com

SelectPage: https://github.com/TerryZ/SelectPage
```

## 0. Installation

- [安装 - FastAdmin 框架文档 - FastAdmin 开发文档](https://doc.fastadmin.net/doc/install.html)

```c#
// 环境要求
// FastAdmin推荐你使用阿里云和腾讯云服务器

PHP >= 7.1 且 < 7.3 (推荐PHP7.1版本)
Mysql >= 5.5.0 (需支持innodb引擎)
Apache 或 Nginx
PDO PHP Extension
MBstring PHP Extension
CURL PHP Extension
Node.js (可选,用于安装Bower和LESS,同时打包压缩也需要使用到)
Composer (可选,用于管理第三方扩展包)
Bower (可选,用于管理前端资源)
Less (可选,用于编辑less文件,如果你需要增改css样式,最好安装上)

FastAdmin开发环境配置教程：https://www.fastadmin.net/video/environment.html




// 完整包安装
// 前往官网下载页面(https://www.fastadmin.net/download.html)下载完整包解压到你的项目目录
// 添加站点并绑定到项目中的public目录为运行目录
// 访问 http://www.yoursite.com/install.php 进行安装
// 为了安全，安装完成后会在public目录生成随机后台入口，请通过随机后台入口登录管理后台


```

## 1. 命令行

```c#

```

### 1. 一键安装 FastAdmin

```c#
//一键安装 FastAdmin
php think install
//配置数据库连接地址为127.0.0.1
php think install -a 127.0.0.1
//配置数据库用户名密码
php think install -u root -p 123456
//配置数据库表名为dbname
php think install -d dbname
//配置数据库表前缀为ff_
php think install -r ff_
//强制重新安装FastAdmin
php think install -f 1


D:\phpstudy_pro\Extensions\php\php7.3.4nts\php.exe think install  -a 127.0.0.1  -u root -p root  -d DB_FastAdminDemo

// 下载前端插件依赖包
bower install
// 下载PHP依赖包
composer install



```

### 2. 一键生成 API 文档

- [一键生成 API 文档 - FastAdmin 框架文档 - FastAdmin 开发文档](https://doc.fastadmin.net/doc/163.html)

```c#
//一键生成API文档
php think api --force=true
//指定https://www.example.com为API接口请求域名,默认为空
php think api -u https://www.example.com --force=true
//输出自定义文件为myapi.html,默认为api.html
php think api -o myapi.html --force=true
//修改API模板为mytemplate.html，默认为index.html
php think api -e mytemplate.html --force=true
//修改标题为FastAdmin,作者为作者
php think api -t FastAdmin -a Karson --force=true
//查看API接口命令行帮助
php think api -h

参数介绍
-u, --url[=URL]            默认API请求URL地址 [default: ""]
-m, --module[=MODULE]      模块名(admin/index/api) [default: "api"]
-o, --output[=OUTPUT]      输出文件 [default: "api.html"]
-e, --template[=TEMPLATE]  模板文件 [default: "index.html"]
-f, --force[=FORCE]        覆盖模式 [default: false]
-t, --title[=TITLE]        文档标题 [default: "FastAdmin"]
-a, --author[=AUTHOR]      文档作者 [default: "FastAdmin"]
-c, --class[=CLASS]        扩展类 (multiple values allowed)
-l, --language[=LANGUAGE]  语言 [default: "zh-cn"]
```
