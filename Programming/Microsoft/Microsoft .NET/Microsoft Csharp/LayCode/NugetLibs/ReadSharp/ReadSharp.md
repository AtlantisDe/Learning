# ReadSharp

- [ReadSharp](https://github.com/ceee/ReadSharp)

## 常用

```c#
// ReadSharp以前是PocketSharp.Reader，现在托管时没有PocketSharp依赖项。

// ReadSharp was previously PocketSharp.Reader and is now hosted without the PocketSharp dependency.

var reader = new ReadSharp.Reader();
ReadSharp.Article article;

try
{
    article = reader.Read(new Uri("https://www.foxnews.com/sports/tom-bradys-buccaneers-cant-let-antonio-brown-become-a-curse"), new ReadOptions {  UseDeepLinks=true}).Result;
}
catch (ReadException exc)
{
    // handle exception
}


```
