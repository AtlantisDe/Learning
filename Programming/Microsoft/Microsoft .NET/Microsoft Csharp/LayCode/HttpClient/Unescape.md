# Unescape

- [How to decode “\u0026” in a URL?](https://stackoverflow.com/questions/6990347/how-to-decode-u0026-in-a-url)
- [JavaScript unescape() 要解码或反转义的字符串](https://www.w3school.com.cn/jsref/jsref_unescape.asp)
- [Regex.Unescape(String) Method (System.Text.RegularExpressions)](https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regex.unescape?view=netcore-3.1)

## 常用

```c#
// Unescape无法完美地撤消转义的字符串，因为它无法准确推断出哪些字符已转义，

// 它用实际的可打印字符替换逐字字符串文字中的十六进制值。例如，它将@“ \ x07”替换为“ \ a”，或将@“ \ x0A”替换为“ \ n”。它将转换为受支持的转义字符，例如\ a，\ b，\ e，\ n，\ r，\ f，\ t，\ v和字母数字字符。

System.Text.RegularExpressions.Regex.Unescape(str);

```
