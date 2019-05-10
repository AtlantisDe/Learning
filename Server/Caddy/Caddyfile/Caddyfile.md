# Caddyfile

- [Caddyfile 入门 - Caddy 中文文档](https://dengxiaolong.com/caddy/zh/caddyfile.html)
- [使用 caddy 作为微服务的 API gateway - Docker 和微服务 - SegmentFault 思否](https://segmentfault.com/a/1190000008752864)
- [初试搭建 caddy 服务 GGBOND](https://www.ggbond.cc/index.php/%E5%88%9D%E8%AF%95%E6%90%AD%E5%BB%BAcaddy%E6%9C%8D%E5%8A%A1/comment-page-1/)

## 配置文件示例 1

```shell
## 文件夹:my-domain.com
## 根目录:/var/www/
## 域名:ateamagencies.000webhostapp.com
my-domain.com {
    root /var/www/ ateamagencies.000webhostapp.com
}
www.hicaddy.com {
    root /var/www/sites www.hicaddy.com:8088
}
mysite.com {
    root /www/mysite.com
}

sub.mysite.com {
    root /www/sub.mysite.com
    gzip
    log ../access.log
}

localhost:80
log access.log
markdown /mk
```

## 配置文件示例 2

```shell
www.ctguggbond.com {
    root /var/www/qmx_wecenter
    fastcgi / 127.0.0.1:9000 php
    errors stdout
}
```
