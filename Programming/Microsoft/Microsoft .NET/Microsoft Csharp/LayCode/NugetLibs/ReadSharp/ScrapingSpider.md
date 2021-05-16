# ScrapingSpider

- [stanzhai/ScrapingSpider](https://github.com/stanzhai/ScrapingSpider)

## 常用

```c#
Settings说明
Init Seeds: 初始Url地址，多个地址使用回车分开。
Regex Filter: 通过正则表达式过滤Url，多个正则使用回车隔开。
Keyword: 关键字，按照指定的关键字爬取，多个关键字使用回车分开。
Crawl Depth: 爬取深度，小于0表示不限
Escape Links: 要过滤的链接，如：.jpg|.rar|.exe
Keep Cookie: 抓取过程中是否保留Cookie
Lock Host: 是否锁定Host，锁定后，指抓取站点相关链接。
Limit Speed: 是否智能限速。
Threads: 线程数量，启用多个线程有利于提高爬取效率。
Timeout: 超时时间，以毫秒为单位。
User Agent: http协议UserAgent设置。
```
