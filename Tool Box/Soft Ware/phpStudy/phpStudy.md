# phpStudy

- [phpStudy - 让天下没有难配的服务器环境！](https://www.xp.cn/)
- [Windows版phpstudy下载 - phpStudy](https://www.xp.cn/download.html)
- [phpstudy 伪静态设置](https://jingyan.baidu.com/article/e9fb46e151a6557521f766d6.html)
- [尘封的记忆-phpstudy 本地环境开启.htaccess 伪静态](http://www.scbzlx.com/post/19.html)
- [phpstudy 配置伪静态的方法 - 心存善念 - 博客园](https://www.cnblogs.com/xcsn/p/6149080.html)
- [（转）php .htaccess 文件使用详解](https://www.cnblogs.com/yyl8781697/articles/php-htaccess.html)

## phpStudy 默认伪静态配置已经开启(高版本)

## rewrite 规则学习

```shell
# 我们新建一个.htaccess文件之后，就在里面写入以下内容：
RewriteEngine on #rewriteengine为重写引擎开关on为开启off为关闭
RewriteRule ([0-9]{1,})$index.php?id=$1
# 我讲解一下RewriteRule：RewriteRule是重写规则，支持正则表达式的，上面的([0-9]{1,})是指由数
# 字组成的，$是结束标志，说明是以数字结束！
# 好吧，现在我们可以实现伪静态页面了，写下一下的规则：
RewriteEngine on
RewriteRule ([a-zA-Z]{1,})-([0-9]{1,}).html$index.php?action=$1&id=$2
([a-zA-Z]{1,})-([0-9]{1,}).html$是规则，index.php?action=$1&id=$2是要替换的格式，$1代表第
# 一个括号匹配的值，$2代表第二个，如此类推！！
```

## 配置文件

```shell
D:\phpStudy\PHPTutorial\Apache\conf\vhosts.conf
```
