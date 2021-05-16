# snownlp

- [isnowfy/snownlp](https://github.com/isnowfy/snownlp)

```c#
SnowNLP是一个python写的类库，可以方便的处理中文文本内容，是受到了TextBlob的启发而写的，由于现在大部分的自然语言处理库基本都是针对英文的，于是写了一个方便处理中文的类库，并且和TextBlob不同的是，这里没有用NLTK，所有的算法都是自己实现的，并且自带了一些训练好的字典。注意本程序都是处理的unicode编码，所以使用时请自行decode成unicode。
```

## 常用

```c#
SnowNLP: Simplified Chinese Text Processing

// 中文分词（Character-Based Generative Model）
// 词性标注（TnT 3-gram 隐马）
// 情感分析（现在训练数据主要是买卖东西时的评价，所以对其他的一些可能效果不是很好，待解决）
// 文本分类（Naive Bayes）
// 转换成拼音（Trie树实现的最大匹配）
// 繁体转简体（Trie树实现的最大匹配）
// 提取文本关键词（TextRank算法）
// 提取文本摘要（TextRank算法）
// tf，idf
// Tokenization（分割成句子）
// 文本相似（BM25）
// 支持python3（感谢erning）
```
