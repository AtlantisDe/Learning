# Rewrite Tool

- [htaccess Tester](https://htaccess.madewithlove.be/)
- [Rewrite 伪静态规则转换工具 | URL RewriteRule conversion tool](https://www.onexin.net/rewrite.php)
- [htaccess to nginx converter](https://winginx.com/en/htaccess)
- [Nginx location match tester](https://nginx.viraptor.info/)
- [htaccess 转 nginx - 在线工具](https://tool.lu/htaccess2nginx/)

## 使用场景一

```shell
# 我想用Nginx的rewrite重写，实现类似以下的功能：
tools.baidu.com               访问http://www.baidu.com/tools
tools.baidu.com/apidocs       访问http://www.baidu.com/tools/apidocs
tools.baidu.com/contrast/hct  访问http://www.baidu.com/tools/contrast/hct
blog.baidu.com/*/*  也是如此
```
