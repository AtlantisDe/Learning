# strip_tags

```c#
// 剥去字符串中的 HTML 标签：
```

## 1. 常用

```c#
<?php
echo strip_tags("Hello <b>world!</b>");
?>

// 剥去字符串中的 HTML 标签，但允许使用 <b> 标签：
<?php
echo strip_tags("Hello <b><i>world!</i></b>","<b>");
?>
```

## 2. c# Strip Html

- [Getting Title at 55:08](https://www.extensionmethod.net/csharp/string/)

```c#
// Used when we want to completely remove HTML code and not encode it with XML entities.
public static string StripHtml(this string input)
{
    // Will this simple expression replace all tags???
    var tagsExpression = new Regex(@"</?.+?>");
    return tagsExpression.Replace(input, " ");
}

var htmlText = "<p>Here is some text. <span class="bold">This is bold.</span> Talk to you later.</p>;
var cleanString = htmlText.StripHtml();
```
