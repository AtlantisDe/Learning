# jieba.NET

- [anderscui/jieba.NET](https://github.com/anderscui/jieba.NET)

## 1. 常用

```c#
jieba.NET
Install-Package jieba.NET
Install-Package jieba.NET -Version 0.42.2

JiebaNet.Segmenter.ConfigManager.ConfigFileBaseDir = @"C:\jiebanet\config";


var segmenter = new JiebaSegmenter();
var segments = segmenter.Cut("我来到北京清华大学", cutAll: true);
Console.WriteLine("【全模式】：{0}", string.Join("/ ", segments));

segments = segmenter.Cut("我来到北京清华大学");  // 默认为精确模式
Console.WriteLine("【精确模式】：{0}", string.Join("/ ", segments));

segments = segmenter.Cut("他来到了网易杭研大厦");  // 默认为精确模式，同时也使用HMM模型
Console.WriteLine("【新词识别】：{0}", string.Join("/ ", segments));

segments = segmenter.CutForSearch("小明硕士毕业于中国科学院计算所，后在日本京都大学深造"); // 搜索引擎模式
Console.WriteLine("【搜索引擎模式】：{0}", string.Join("/ ", segments));

segments = segmenter.Cut("结过婚的和尚未结过婚的");
Console.WriteLine("【歧义消除】：{0}", string.Join("/ ", segments));

JiebaNet.Analyser.TfidfExtractor.ExtractTags(string text, int count = 20, IEnumerable<string> allowPos = null)

var extractor = new JiebaNet.Analyser.TfidfExtractor();
var keywords = extractor.ExtractTags(html, 8, JiebaNet.Segmenter.Constants.NounAndVerbPos);


var keywords0 = extractor.ExtractTagsWithWeight(text, 100, JiebaNet.Segmenter.Constants.NounAndVerbPos).ToList();
keywords0.OrderByDescending(it => it.Weight);
var rst0 = string.Join("|", keywords0.Select(s => s.Word).ToArray());

```

### 1. 其它代码

```c#
text = "恭喜！郭艾伦迎来里程碑，超越八一传奇，得分升至历史第25位";
var extractor = new JiebaNet.Analyser.TfidfExtractor();
var keywords = extractor.ExtractTags(webPageContent.ResItem.Title, 10, JiebaNet.Segmenter.Constants.NounAndVerbPos);
var kws1 = string.Join("|", keywords);
```

## 2. 相关项目

- [SilentCC/JIEba-netcore](https://github.com/SilentCC/JIEba-netcore)

## 3. 其它在线分词工具测试

- [在线关键词分词工具 - 辅助关键词研究\_九秒分词](https://cws.9sep.org/)
- [语料库在线--自动分词](http://corpus.zhonghuayuwen.org/CpsWParser.aspx)
- [Analyzer 在线工具，IK Analyzer—在线分词器工具](https://www.sojson.com/analyzer)
