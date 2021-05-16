# EmEditor

- [EmEditor (Text Editor) &#8211; Text Editor for Windows supporting large files and Unicode!](https://www.emeditor.com/)
- [下载 &#8211; EmEditor (文本编辑器)](https://zh-cn.emeditor.com/download/)
- [Emeditor 批量修改文件编码格式（UTF-8）](https://www.cnblogs.com/EasonJim/p/6241840.html)
- [EmEditor 19 中文破解版(附注册机)|Emurasoft EmEditor(WINDOWS 文本编辑器) v19.0.0 注册版 下载 - 多多软件站](http://www.ddooo.com/softdown/150087.htm)
- [EmEditor Professional 19.2.2 + Crack [Latest Version] - StartCrack](https://startcrack.com/emeditor-professional-crack/)

## 0. 常用

-[下载 &#8211; EmEditor (文本编辑器)](https://zh-cn.emeditor.com/download/)

- 下载最新版即可(注册码全可用)

```c#
https://emeditor.blob.core.windows.net/emed64_20.4.5.msi

工具--重置所有设置
```

## 1. 正则常用

```c#
// 万能标记正则,然后复制出来即可
(\w+)

// 如:
lang="(\w+)"


// 如何复制被查找正则匹配的内容: 查找-->正则表达式-->输入表达式:[[].*?[]] 接着-->全部选择(A) 然后键盘Ctrl+C 复制 即可
[[].*?[]]

// 匹配括号内示例
(\([^\)]*\))

// 能匹配结果
(tagName.Contains("类型:你好世界")



// 基本要领:
1. 如中括号,等属于特殊的字符需要用反注释起来.
// 基本案例如下:
// 要匹配
[栏目9名称]

// 正则表达式应该是这样的
[[]栏目(\d+)名称[]]


```
