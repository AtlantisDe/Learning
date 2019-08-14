# reptile

- [爬虫之 scrapy-splash——scrapy+js 渲染容器](https://www.jianshu.com/p/2516138e9e75?open_source=weibo_search)

## Wiki

### 结合 js 的爬虫

```c#
目前，我知道的结合js的爬虫有以下3种。（有补充的，麻烦大神留言。）

selenium+webdriver（如firefox，chrome等）。这要求你系统有对应浏览器，并且过程中要全程开浏览器。说白了，就是你通过浏览器能看到啥，就能抓到啥。一般遇到特别复杂的验证码时，这个方法是有必要的，当然，开着浏览器爬虫的效率可想而知。
selenium+phantomjs。PhantomJS是一个WebKit，他的使用方法和webdriver一样，但是他不需要开浏览器，你可以直接跑在无需GUI的linux服务器上，这点很赞。

scrapy-splash。这个和以上两种方法比，优势有以下几点。



splash 作为js渲染服务，是基于Twisted和QT开发的轻量浏览器引擎，并且提供直接的http api。快速、轻量的特点使其容易进行分布式开发。
splash 和scrapy融合，两种互相兼容彼此的特点，抓取效率较好。
虽然目前只有英文文档，但写的已经很详细了，仔细阅读便能快速开发。

```
