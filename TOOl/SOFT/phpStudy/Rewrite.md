# Rewrite [Apache][htaccess]

- [htaccess 在线生成工具用法大全](https://www.cnblogs.com/zhang36/p/6170412.html)
- [.htaccess Editor](http://www.htaccesseditor.com/sc.shtml#a_redirect)
- [PHP 伪静态规则写法 RewriteRule-htaccess 详细语法使用](https://blog.csdn.net/chentaoxie/article/details/52425531)

## .htaccess 例子

```shell
RewriteEngine On
RewriteRule index.html index.php
```

```shell
RewriteEngine On
RewriteRule ^index\.html$ /index.php [L]
RewriteRule ^sitemap\.html$ /sitemap.php [L]
RewriteRule ^baidu\/$ /sitemap.php [L]
RewriteRule ^robots\.txt$ /robots.php [L]
RewriteRule ^(.*)\/$ /index.php?list=$1 [L]
RewriteRule ^(.*)\/index\.html$ /index.php?list=$1 [L]
RewriteRule ^(.*)\/([0-9]+)\.html$ /index.php?list=$1&page=$2 [L]
```

```shell
RewriteEngine On
RewriteRule index.html index.php
RewriteRule demo.html demo.php
RewriteRule sitemap.html sitemap.php
RewriteRule robots.txt robots.php
#RewriteRule (.*)$index.php?page=$1
RewriteRule (.*)index.html$ index.php?page=$1
```

```shell
RewriteEngine On
RewriteRule index.html index.php

# 比如：http://www.yzzmf.com/index.html  -> http://www.yzzmf.com/index.php

RewriteRule ^test([0-9]*).html$ test.php?id=$1

# 比如：http://www.yzzmf.com/test8.html  -> http://www.yzzmf.com/test.php?id=8

RewriteRule ^cat-([0-9]+)-([0-9]+)\.html$ cat.php?id1=$1&id2=$2

# 比如：http://www.yzzmf.com/cat-1-3.html -> http://www.yzzmf.com/cat.php?id1=1&id2=3

RewriteRule ^cat-([a-zA-Z0-9\-]*)-([0-9]+)-([0-9]+)\.html$ cat.php?id0=$1&id1=$2&id2=$3

# 比如：http://www.yzzmf.com/cat-zbc2ac-3-5.html -> http://www.yzzmf.com/cat.php?id0=zbc2ac&id1=3&id2=5

RewriteRule ^cat1-([0-9]+)-([0-9]+)-([0-9]+)\.html$ cat1.php?id1=$1&id2=$2&id3=$3

# 比如：http://www.yzzmf.com/cat1-4-3-8.html -> http://www.yzzmf.com/cat1.php?id1=4&id2=3&id3=8

RewriteRule ^cat([0-9]*)/$ cat.php?id1=$1

# 比如：http://www.yzzmf.com/cat5/ -> http://www.yzzmf.com/cat.php?id1=5

RewriteRule ^catm([0-9]*)/([0-9]*)/$ catm.php?id1=$1&id2=$2

# 比如：http://www.yzzmf.com/catm6/3/ -> http://www.yzzmf.com/catm.php?id1=6&id2=3

RewriteRule index.html index.php
```
