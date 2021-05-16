# Composer

- [Composer](https://getcomposer.org/download/)
- [Packagist](https://packagist.org/)
- [还没安装 Composer 吗？请往下看如何安装 Composer](https://pkg.phpcomposer.com/)
- [Ubuntu 安装 PHP 和 Composer](https://learnku.com/articles/21392)
- [Ubuntu 安装 PHP 和 Composer | Laravel China 社区 - 高品质的 Laravel 开发者社区](https://learnku.com/articles/21392)
- [ubuntu 安装 composer[推荐]](https://www.cnblogs.com/jiqing9006/p/8796310.html)

## 0. 常用

- [composer 安装项目依赖-百度经验](https://jingyan.baidu.com/article/e5c39bf5168d3a39d660337a.html)
- [composer.json 文件详解-composer-PHP 中文网](https://www.php.cn/tool/composer/427621.html)
- [库（资源包） | Composer 中文文档 | Composer 中文网](https://docs.phpcomposer.com/02-libraries.html)

```c#
// composer init 以交互方式填写composer.json文件信息
// composer install 从当前目录读取composer.json文件，处理依赖关系，并安装到vendor目录下
// composer update 获取依赖的最新版本，升级composer.lock文件
// composer require 添加新的依赖包到composer.json文件中并执行更新
// composer search 在当前项目中搜索依赖包
// composer show 列举所有可用的资源包
// composer validate 检测composer.json文件是否有效
// composer self-update 将composer工具更新到最新版本
// composer create-project 基于composer创建一个新的项目
// composer dump-autoload 在添加新的类和目录映射时更新autoloader

composer init

{
    "require": {
        "monolog/monolog": "1.2.*"
    }
}
// 接下来只要运行以下命令即可安装依赖包：
composer install

// require 命令
// 除了使用 install 命令外，我们也可以使用 require 命令快速的安装一个依赖而不需要手动在 composer.json 里添加依赖信息：

$ composer require monolog/monolog

```

## 0. Windows 安装 Composer

```shell
# Download and run Composer-Setup.exe - it will install the latest composer version whenever it is executed.

{
    "scripts": {
        "post-update-cmd": "MyVendor\\MyClass::postUpdate",
        "post-package-install": [
            "MyVendor\\MyClass::postPackageInstall"
        ],
        "post-install-cmd": [
            "MyVendor\\MyClass::warmCache",
            "phpunit -c app/"
        ],
        "post-autoload-dump": [
            "MyVendor\\MyClass::postAutoloadDump"
        ],
        "post-create-project-cmd": [
            "php -r \"copy('config/local-example.php', 'config/local.php');\""
        ]
    }
}
```

## 1. 安装 Composer

```shell
# 请先安装PHP,这里省略,或者直接上面链接找一体化安装
sudo apt install unzip

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
sudo mv composer.phar /usr/local/bin/composer
```

## 2. 安装 Composer wget 方式

```shell
wget https://getcomposer.org/composer.phar
mv composer.phar composer
chmod +x composer
sudo mv composer /usr/local/bin
# 测试
/opt$ composer
# 引入一个类库，并使用。
sudo composer require aferrandini/phpqrcode
# 使用的时候，很简单，只要引入一下自动加载就可以了。
require '../vendor/autoload.php';
\PHPQRCode\QRcode::png("Test", "../tmp/qrcode.png", 'L', 4, 2);
# 如果是tp等框架，可以将引入部分放在index.php的入口文件，这样每个地方都可以灵活使用插件了。
```
