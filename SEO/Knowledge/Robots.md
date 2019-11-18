# Robots

- [Robots.txt 的妙用 - zhouchangshun_666 的博客 - CSDN 博客](https://blog.csdn.net/zhouchangshun_666/article/details/81564878)
- [网站 robots.txt 使用中常见的误区](http://www.chinaz.com/web/2012/0428/248613.shtml)
- [网站 robots.txt 如何设置?-MetInfo](https://www.metinfo.cn/faq/2363.html)
- [设置 robots.txt，还是会被百度蜘蛛抓取 - 搜外问答](https://ask.seowhy.com/question/23740)

## 工具

- [sitemap 网站地图 生成工具](https://help.bj.cn/)
- [robots 文件生成 - 站长工具](http://tool.chinaz.com/robots/)

### 规范

```text
选项：编码格式：UTF-8；URL模式：notSelect；锚过滤：isSelect；内链/外链/全：allSelect；去掉标题为空：notSelect；自动补全URL：isSelect；死链判断：notSelect；次级链接页：notSelect。
网站robots.txt如何设置?

一、啥是robots.txt

笔者引证baidu站长对象中后段话来阐发。查找引擎运用spider措施自动会见互联网上的页面并获取页面信息。spider在会见一个网站时，会起首会 查察该网站的根域下是不是有一个叫做 robots.txt的纯文本文件，这个文件用于指定spider在您网站上的抓取打算。您可以在您的网站中创建一个robots.txt，在文件中声明 该网站中不想被查找引擎录入的有些或者指定查找引擎只录入特定的有些。

二、robots.txt如何设置

1、robots.txt文件必须放置在网站根目录;

2、robots.txt文件名必须小写。

根据上面两点提示我们查看到绝大部分网站的robots.txt文件，如果出现无法访问的现象，最大可能就是网站根目录中没有此文件。
```

### 代码

```c#
遵循语法的Robots.txt才可能被机器人识别，至于语法，介绍起来很繁琐，现简单举例如下：

1）禁止所有搜索引擎访问网站的任何部分（也就是网站彻底的拒绝所有搜索引擎收录）

User-agent: *

Disallow: /

2）允许所有的robot访问（也就是网站允许所有搜索引擎收录）

User-agent: *

Disallow:

3）禁止某个搜索引擎的访问（比如禁止百度收录，按如下的方式写）

User-agent: baiduspider

Disallow: /

4）允许某个搜索引擎的访问（比如允许百度收录，按如下的方式写）

User-agent: baiduspider

Disallow:

User-agent: *

Disallow: /

5）禁止搜索引擎访问某些目录
[Getting Title at 0:36](http://Hashtable)
User-agent: *

Disallow: /cgi-bin/

Disallow: /tmp/

Disallow: /images/
```

### Robots.txt 示例

```txt
User-agent: *
Disallow:
Crawl-delay: 120
Disallow: /cgi-bin/
Sitemap: http://www.yoursite.com/sitemap.gz

```

```txt
User-agent: *

Disallow: /i*/

Disallow: /a*d/

Disallow: /*.php

Disallow: /*/*.php

Disallow: /*/list*.html

Allow: /img/

Sitemap: https://域名/sitemap.xml
```

```txt
实例分析：淘宝网的 Robots.txt文件

User-agent: Baiduspider

Disallow: /

User-agent: *
User-agent: Googlebot
Disallow: /
```

- [在线 robots 文件生成-在线网站 robots.txt 文件生成器](http://www.jsons.cn/robots/)
- [robots 文件生成 在线网站 robots.txt 文件生成器](http://tool.ip138.com/robots/)

```txt
User-agent: Baiduspider
Disallow:
User-agent: Sosospider
Disallow:
User-agent: sogou spider
Disallow:
User-agent: YodaoBot
Disallow:
User-agent: Googlebot
Disallow: /
User-agent: Slurp
Disallow: /
User-agent: googlebot-image
Disallow: /
User-agent: googlebot-mobile
Disallow: /
User-agent: yahoo-mmcrawler
Disallow: /
User-agent: yahoo-blogs/v3.9
Disallow: /
User-agent: psbot
Disallow: /
User-agent: *
Disallow:
Crawl-delay: 10
Disallow: /
```
