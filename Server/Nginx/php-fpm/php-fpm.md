# php-fpm

## 查看版本号

```shell
sudo php -v
```

```text
PHP 7.2.17-0ubuntu0.18.10.1 (cli) (built: Apr 18 2019 14:09:30) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.2.0, Copyright (c) 1998-2018 Zend Technologies
with Zend OPcache v7.2.17-0ubuntu0.18.10.1, Copyright (c) 1999-2018, by Zend Technologies
```

## 安装注意事项

- 注意版本号

## 配置文件路径

```shell
/etc/php/7.2/fpm/php-fpm.conf
```

## 添加 PPA

```shell
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
```

## 安装 PHP

```shell
sudo apt install -y php7.3-fpm
sudo apt install -y php7.2-fpm
```

## PHP 拓展

```shell
sudo apt install -y php7.3-bcmath php7.3-curl php7.3-gd php7.3-mbstring php7.3-mysql php7.3-xml php7.3-zip
sudo apt install -y php7.2-bcmath php7.2-curl php7.2-gd php7.2-mbstring php7.2-mysql php7.2-xml php7.2-zip
```

## 配置 PHP

```shell
# TODO：进一步理解和优化配置。 这里是php7.3示例

# PHP CLI
sudo sed -i 's/display_errors = .*/display_errors = On/' /etc/php/7.3/cli/php.ini
sudo sed -i 's/error_reporting = .*/error_reporting = E_ALL/' /etc/php/7.3/cli/php.ini
sudo sed -i 's/memory_limit = .*/memory_limit = 512M/' /etc/php/7.3/cli/php.ini
sudo sed -i 's/;date.timezone.*/date.timezone = UTC/' /etc/php/7.3/cli/php.ini

# PHP FPM
sudo sed -i 's/error_reporting = .*/error_reporting = E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED/' /etc/php/7.3/fpm/php.ini
sudo sed -i 's/memory_limit = .*/memory_limit = 512M/' /etc/php/7.3/fpm/php.ini
sudo sed -i 's/upload_max_filesize = .*/upload_max_filesize = 50M/' /etc/php/7.3/fpm/php.ini
sudo sed -i 's/post_max_size = .*/post_max_size = 50M/' /etc/php/7.3/fpm/php.ini
sudo sed -i 's/;date.timezone.*/date.timezone = UTC/' /etc/php/7.3/fpm/php.ini

# PHP Pools
sudo sed -i 's/user = www-data/user = www/' /etc/php/7.3/fpm/pool.d/www.conf
sudo sed -i 's/group = www-data/group = www/' /etc/php/7.3/fpm/pool.d/www.conf
# sudo sed -i 's/listen =.*/listen = 127.0.0.1:9000/' /etc/php/7.3/fpm/pool.d/www.conf
sudo sed -i 's/listen.owner.*/listen.owner = www/' /etc/php/7.3/fpm/pool.d/www.conf
sudo sed -i 's/listen.group.*/listen.group = www/' /etc/php/7.3/fpm/pool.d/www.conf
sudo sed -i 's/;listen.mode.*/listen.mode = 0666/' /etc/php/7.3/fpm/pool.d/www.conf

sudo systemctl restart php7.3-fpm
sudo systemctl restart php7.2-fpm
```
