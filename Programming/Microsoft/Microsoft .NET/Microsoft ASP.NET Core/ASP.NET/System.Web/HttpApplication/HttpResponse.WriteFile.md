# HttpResponse.WriteFile

- [HttpResponse.WriteFile Method (System.Web)](https://docs.microsoft.com/en-us/dotnet/api/system.web.httpresponse.writefile?view=netframework-4.8)
- [利用 Global.asax 的 Application*BeginRequest 实现 url 重写 无后缀*快乐豆豆 er 的专栏-CSDN 博客](https://blog.csdn.net/pigkeli/article/details/9963097)

## 常用

### 0. 直接给出文件

```c#

// 注意使用 HttpContext.Current.ApplicationInstance.CompleteRequest() 后面不能使用 return; 再读取文件流时候.

void ResponseWriteFile(string FilePath)
{
    try
    {
        if (FilePath.FileExists() == true)
        {
            string mimeType = MimeMapping.GetMimeMapping(FilePath);
            Context.Response.StatusCode = 200; Context.Response.ContentType = mimeType; Context.Response.WriteFile(FilePath);
        }
    }
    catch (Exception)
    {
        HttpContext.Current.ApplicationInstance.CompleteRequest();
    }
    finally
    {
    }
    HttpContext.Current.ApplicationInstance.CompleteRequest(); return;
}
```

### 1. The following example writes a file to memory 将文件写入内存

```c#
Response.WriteFile("login.txt", true);
```

### 2. 数据流

```c#
Context.Response.StatusCode = 200; Context.Response.ContentType = websiteRequestCaching.ContentType;
Context.Response.Write(websiteRequestCaching.Stream);
HttpContext.Current.ApplicationInstance.CompleteRequest();
```

### 3. 字符串

```c#
 var mime = MimeMapping.GetMimeMapping(this.Request.Url.AbsolutePath);
Context.Response.StatusCode = 200;
Context.Response.ContentType = mime;
Context.Response.ContentEncoding = System.Text.Encoding.UTF8;
Context.Response.Write(rst.Content);
Context.Response.End();
HttpContext.Current.ApplicationInstance.CompleteRequest(); return;

Context.Response.StatusCode = 200; Context.Response.ContentType = websiteRequestCaching.ContentType;
Context.Response.Write("你好世界.");
HttpContext.Current.ApplicationInstance.CompleteRequest();



case "cache.test":
Context.Response.StatusCode = 200;
Context.Response.ContentType = "text/html;charset=utf-8";
//Context.Response.AddHeader("Cache-Control", "max-age=7776000");
//Context.Response.CacheControl = "Public";
Context.Response.AddHeader("Expires", (99 * 1000 * 3600).ToString());

Context.Response.Write($"当前时间:{DateTime.Now.Format1()}");
Context.Response.End();
HttpContext.Current.ApplicationInstance.CompleteRequest(); return;

```

### 4. 编码 HttpResponse.ContentEncoding

- [HttpResponse.ContentEncoding Property (System.Web)](https://docs.microsoft.com/en-us/dotnet/api/system.web.httpresponse.contentencoding?view=netframework-4.8)
- [How to add encoding information to the response stream in ASP.NET?](https://stackoverflow.com/questions/1005530/how-to-add-encoding-information-to-the-response-stream-in-asp-net)
