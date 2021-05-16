# Enc

- ASCII 转 Unicode
- Unicode 转 ASCII
- Unicode 转 中文
- 中文 转 Unicode

## Wike

- [CODEC|Coder/Decoder|编码/解码器 &#8211; 英文缩写](https://www.aoetc.com/CODEC_Coder_Decoder/)

```shell
# CODEC”经常作为“Coder/Decoder”的缩写来使用，中文中表示：“编码/解码器”。

# CODEC（编码/解码器）释义：
# 英文缩写词：CODEC
# 英文单词：Coder/Decoder
# 缩写词中文简要解释：编码/解码器
# 中文拼音：biān mǎ jiě mǎ qì
# 用户评分：4.25
# 评分人数：4
# 缩写词流行度：1832
# 缩写词分类：Computing
# 缩写词领域：General
```

## Unicode

```c#
Unicode（统一码、万国码、单一码）是计算机科学领域里的一项业界标准，包括字符集、编码方案等。Unicode 是为了解决传统的字符编码方案的局限而产生的，它为每种语言中的每个字符设定了统一并且唯一的二进制编码，以满足跨语言、跨平台进行文本转换、处理的要求。1990年开始研发，1994年正式公布。
```

- [Unicode 百度百科](https://baike.baidu.com/item/Unicode/750500?fr=aladdin)

## ASCII

- [ASCII（ASCII）](https://baike.baidu.com/item/ASCII/309296?fr=aladdin)
- [ASCII 码对照表](http://tool.oschina.net/commons?type=4)
- [c# Unicode 转换 ASCII - 痱子﹑ - 博客园](https://www.cnblogs.com/yuanzijian-ruiec/p/9720747.html)
- [C# 将字符串转为&amp;#2345;这种的 html 实体编码 - 程序员徐坤 - 博客园](https://www.cnblogs.com/xuxiaoshuan/p/4921051.html)
- [&#**\***; 这是个什么编码，用 C#怎么解啊](https://zhidao.baidu.com/question/582678036.html)

```C#
string unicodestring = "1234";
 byte[] byteunicode = Encoding.Unicode.GetBytes(unicodestring);
 string ASCIIstring = Encoding.ASCII.GetString(byteunicode);
```

## 解码

```C#
&#*****; 这是个什么编码，用C#怎么解啊
&#******;这是个什么编码，用C#怎么解啊,****号是数字，
是unicode吗。有专门的方法解码
我发现直接((char)24247).ToString();就行了
```
