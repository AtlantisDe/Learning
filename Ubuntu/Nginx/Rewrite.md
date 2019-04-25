# Rewrite

- [nginx伪静态（超级简单）](https://blog.csdn.net/wojiuwangla/article/details/82259629)
- [Nginx伪静态配置和常用Rewrite伪静态规则 - 鲍攻城 - 博客园](https://www.cnblogs.com/baobaobao/p/6305705.html)
- [Nginx - Rewrite伪静态配置](http://www.youhutong.com/index.php/article/index/99.html)
- [Nginx伪静态配置和常用Rewrite伪静态规则集锦](https://www.cnblogs.com/yangchunlong/articles/8495085.html)
- [Rewrite规则 在Nginx中的使用-菜鸟HOW站长](https://www.cnhzz.com/creating-nginx-rewrite-rules/)

## 将客户请求重定向到一个新的域名

```shell
server {
listen 80;
listen 443 ssl;
server_name www.old-name.com;
return 301 $scheme://www.new-name.com$request_uri;
}
```

## 3xx系列的HTTP状态码中指定重写后的URL：

```shell
return (301 | 302 | 303 | 307) url;
```