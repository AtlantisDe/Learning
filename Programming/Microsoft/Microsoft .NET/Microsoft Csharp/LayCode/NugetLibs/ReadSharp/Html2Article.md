# Html2Article

- [stanzhai/Html2Article](https://github.com/stanzhai/Html2Article)
- [我为开源做贡献，网页正文提取——Html2Article - StanZhai - 博客园](https://www.cnblogs.com/jasondan/p/3497757.html)

## 常用

```c#
// html为你要提取的html文本
string html = "<html>....</html>";
// article对象包含Title(标题)，PublishDate(发布日期)，Content(正文)和ContentWithTags(带标签正文)四个属性
Article article = Html2Article.GetArticle(html);
```
