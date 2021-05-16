# Lucene.Net

- [Welcome to the Lucene.Net website! | Apache Lucene.NET 4.8.0](http://lucenenet.apache.org/)
- [apache/lucenenet](https://github.com/apache/lucenenet)
- [Namespace Lucene.Net.Demo | Apache Lucene.NET 4.8.0 Documentation](https://lucenenetdocs.azurewebsites.net/api/Lucene.Net.Demo/Lucene.Net.Demo.html)
- [SimpleFacetsExample.cs Shazwazza/lucenenet](https://github.com/Shazwazza/lucenenet/blob/master/src/Lucene.Net.Demo/Facet/SimpleFacetsExample.cs)
- [仿造百度实现基于 Lucene.net 全文检索](https://developer.51cto.com/art/201207/350987.htm)
- [1、什么是 Lucene，Lucene 能干什么](https://blog.csdn.net/gebitan505/article/details/51701203)
- [使用 Lucene.Net 实现全文检索 - MeteorSeed](https://www.cnblogs.com/MeteorSeed/archive/2012/12/24/2703716.html)
- [Lucene.net 的简单使用 - 善良的小赵 - 博客园](https://www.cnblogs.com/XZhao/p/7222174.html)
- [HubbleDotNet+Mongodb 构建高性能搜索引擎--概述 - eaglet - 博客园](https://www.cnblogs.com/eaglet/archive/2012/05/10/2494073.html)
- [搜索结果提示 - 博客园找找看](https://zzk.cnblogs.com/s?w=Lucene.Net)
- [c# - Lucene.net 范围查询&#43;突出显示 - IT 工具网](https://www.coder.work/article/1611985)

## Nugget

- [Lucene.Net](https://www.nuget.org/packages/Lucene.Net/)

## 常用

- [使用 Lucene.Net 做一个简单的搜索引擎-全文索引](http://www.zkea.net/codesnippet/detail/lucene-net.html)

```c#
// 常用思路
1. 创建索引并定义文本分析器 Create an index and define a text analyzer

2. 添加到索引 Add to the index

3. 构造查询 Construct a query

4. 取得结果 Fetch the results

// Ensures index backwards compatibility 确保索引向后兼容
var AppLuceneVersion = Lucene.Net.Util.LuceneVersion.LUCENE_48;
var indexLocation = @"C:\Index";
var dir = Lucene.Net.Store.FSDirectory.Open(indexLocation);

// create an analyzer to process the text 创建一个分析器来处理文本
var analyzer = new Lucene.Net.Analysis.Standard.StandardAnalyzer(AppLuceneVersion);

// create an index writer 创建一个索引编写器
var indexConfig = new Lucene.Net.Index.IndexWriterConfig(AppLuceneVersion, analyzer);
var writer = new Lucene.Net.Index.IndexWriter(dir, indexConfig);

var writer = new Lucene.Net.Index.IndexWriter(dir, new Lucene.Net.Index.IndexWriterConfig(AppLuceneVersion, analyzer));

// 添加到索引
var source = new
{
    Name = "Kermit the Frog",
    FavoritePhrase = "The quick brown fox jumps over the lazy dog"
};
var doc = new Lucene.Net.Documents.Document
{
    // StringField indexes but doesn't tokenize
    new Lucene.Net.Documents.StringField("name",
        source.Name,
        Lucene.Net.Documents.Field.Store.YES),
    new Lucene.Net.Documents.TextField("favoritePhrase",
        source.FavoritePhrase,
        Lucene.Net.Documents.Field.Store.YES)
};


var doc = new Lucene.Net.Documents.Document
{
    new Lucene.Net.Documents.StringField("name","",Lucene.Net.Documents.Field.Store.YES),
    new Lucene.Net.Documents.TextField("favoritePhrase","",Lucene.Net.Documents.Field.Store.YES)
};

var doc = new Lucene.Net.Documents.Document
{
    new Lucene.Net.Documents.StringField("Url",url,Lucene.Net.Documents.Field.Store.YES),
    new Lucene.Net.Documents.Int64Field("Date",date,Lucene.Net.Documents.Field.Store.YES)
};

writer.AddDocument(doc);
writer.Flush(triggerMerge: false, applyAllDeletes: false);


// re-use the writer to get real-time updates 重复使用编写器以获取实时更新
```

## Packages

- [Lucene.Net.Analysis.SmartCn](https://www.nuget.org/packages/Lucene.Net.Analysis.SmartCn)

```c#
Install-Package Lucene.Net.Analysis.SmartCn -Version 4.8.0-beta00011
```

## Other

- [qiuhaotc/CodeIndex](https://github.com/qiuhaotc/CodeIndex)
- [ThinhDDo/LuceneExplorer](https://github.com/ThinhDDo/LuceneExplorer)
- [reinaldoarrosi/CSharp-BitmapIndex](https://github.com/reinaldoarrosi/CSharp-BitmapIndex)

## Lucene.Net.Search.IndexSearcher

- [Lucene.Net: Lucene.Net.Search.IndexSearcher Class Reference](https://lucenenet.apache.org/docs/3.0.3/df/dbe/class_lucene_1_1_net_1_1_search_1_1_index_searcher.html)
- [利用 Lucene.net 搜索引擎进行多条件搜索的做法 *IT 牛蛙的笔记-CSDN 博客*搜索引擎 多条件 或](https://blog.csdn.net/hehui21/article/details/2874113)
- [Lucene.Net 实现搜索功能 - 锦大大的博客呀！ - 博客园](https://www.cnblogs.com/wangjinya/p/10755160.html)
- [Lucene.net 范围查询+突出显示](https://www.coder.work/article/1611985)
- [Windows Developer Power Tools](https://www.oreilly.com/library/view/windows-developer-power/0596527543/ch04s04.html)
- [Error Happened](https://www.codeproject.com/Articles/320219/Lucene-Net-ultra-fast-search-for-MVC-or-WebForms)
- [mikhail-tsennykh/Lucene.Net-search-MVC-sample-site](https://github.com/mikhail-tsennykh/Lucene.Net-search-MVC-sample-site)
- [C#编写了一个基于 Lucene.Net 的搜索引擎查询通用工具类：SearchEngineUtil - 梦在旅途 - 博客园](https://www.cnblogs.com/zuowj/p/11689563.html)

```c#
TotalHits /*总命中*/
MaxScore /*最大分数*/
ScoreDocs /*评分*/

StringField /*字符串字段*/
TextField /*文本域*/

Store /*存储*/



ANALYZED /*分析*/
NOT_ANALYZED /*未分析*/


Lucene.Net.Search.AutomatonQuery /*自动查询*/
Lucene.Net.Search.BitsFilteredDocIdSet /*Bits过滤的文档ID集*/
Lucene.Net.Search.BooleanClause /**/
Lucene.Net.Search.MultiPhraseQuery /*多词查询*/

```
