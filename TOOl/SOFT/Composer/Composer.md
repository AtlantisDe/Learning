# Composer

- [Composer](https://getcomposer.org/download/)

- [还没安装 Composer 吗？请往下看如何安装 Composer](https://pkg.phpcomposer.com/)
- [Ubuntu 安装 PHP 和 Composer](https://learnku.com/articles/21392)
- [Ubuntu 安装 PHP 和 Composer | Laravel China 社区 - 高品质的 Laravel 开发者社区](https://learnku.com/articles/21392)
- [ubuntu 安装 composer[推荐]](https://www.cnblogs.com/jiqing9006/p/8796310.html)

## 安装 Composer

```shell
# 请先安装PHP,这里省略,或者直接上面链接找一体化安装
sudo apt install unzip

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
sudo mv composer.phar /usr/local/bin/composer
```

## 安装 Composer wget 方式

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
