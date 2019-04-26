# Rewrite

- [nginx 伪静态（超级简单）](https://blog.csdn.net/wojiuwangla/article/details/82259629)
- [Nginx 伪静态配置和常用 Rewrite 伪静态规则 - 鲍攻城 - 博客园](https://www.cnblogs.com/baobaobao/p/6305705.html)
- [Nginx - Rewrite 伪静态配置](http://www.youhutong.com/index.php/article/index/99.html)
- [Nginx 伪静态配置和常用 Rewrite 伪静态规则集锦](https://www.cnblogs.com/yangchunlong/articles/8495085.html)
- [Rewrite 规则 在 Nginx 中的使用-菜鸟 HOW 站长](https://www.cnhzz.com/creating-nginx-rewrite-rules/)
- [nginx 配置指令 rewrite 的 last、break、redirect、permanent 参数详解](https://www.jianshu.com/p/3e0be2b21737)
- [Nginx 中 last 和 break 及 permanent 和 redirect](https://blog.51cto.com/unixman/1711943)
- [nginx伪静态rewrite支持.htaccess - phpStudy](http://phpstudy.php.cn/a.php/177.html)

## 将客户请求重定向到一个新的域名

```shell
server {
listen 80;
listen 443 ssl;
server_name www.old-name.com;
return 301 $scheme://www.new-name.com$request_uri;
}
```

## permanent 和 redirect 总结如下

```shell
# permanent: 大家公认的信息 ，永久性重定向。请求日志中的状态码为301
# redirect： 大家公认的信息 ，临时重定向。请求日志中的状态码为302
```

## 3xx 系列的 HTTP 状态码中指定重写后的 URL：

```shell
return (301 | 302 | 303 | 307) url;
```

## 对于其他的 HTTP 状态码，你可以在响应的页面中自定义一个文本（标准的状态码文本信息依然会显示，比如『404 Not Found』）。文本中可包含 Nginx 变量。

```shell
return (1xx | 2xx | 4xx | 5xx) ["text"];
```

## 比如，这个命令就很适合在拒绝一个没有包含验证令牌的请求时给出一些提示：

```shell
return 401 "Access denied because token is expired or invalid";
```

## rewrite 命令

```shell
# 与`return`一样，也是将`rewrite`命令放到需要重写的URL所在的`server`或`location`上下文中。两个命令有更多的不同之处，`rewrite`使用上要复杂的多，虽然它的语法很简单：
rewrite regex URL [flag];
```

## 使用`rewrite`重写的例子

```shell
# 比如，/download/cdn-west/media/fil1 根据规则会被重写为 /download/cdn-west/mp3/file1.mp3。
server {
...
rewrite ^(/download/.*)/media/(.*)\..*$ $1/mp3/$2.mp3 last;
rewrite ^(/download/.*)/audio/(.*)\..*$ $1/mp3/$2.ra last;
return 403;
...
}
```

## rewrite Demo

```shell
rewrite /index.html /index.php redirect;
rewrite /index.html /index.php permanent;
rewrite /sitemap.html /sitemap.php permanent;
rewrite /robots.html /robots.php permanent;
rewrite ^(.*)/$ /index.php?page=$1 permanent;
rewrite ^(.*)/index.html$ /index.php?page=$1 permanent;

rewrite ^(.*)/$ /demo.php?page=$1;
rewrite ^(.*)/demo.html$ /demo.php?page=$1;

rewrite ^(.*)/$ /demo.php?page=$1 permanent;
rewrite ^(.*)/demo.html$ /demo.php?page=$1 permanent;
        rewrite /index.html /index.php permanent;
        rewrite /sitemap.html /sitemap.php permanent;
        rewrite /robots.html /robots.php permanent;
        rewrite ^(.*)/$ /index.php?page=$1 permanent;
        rewrite ^(.*)/index.html$ /index.php?page=$1 permanent;
        rewrite ^(.*)/$ /demo.php?page=$1 permanent;
        rewrite ^(.*)/demo.html$ /demo.php?page=$1 permanent;
```
