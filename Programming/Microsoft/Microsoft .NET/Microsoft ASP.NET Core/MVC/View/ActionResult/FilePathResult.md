# FilePathResult

- [FilePathResult Class (System.Web.Mvc)](https://docs.microsoft.com/en-us/dotnet/api/system.web.mvc.filepathresult?view=aspnet-mvc-5.2)
- [ActionResult vs Task question](https://forums.asp.net/t/2007350.aspx?ActionResult+vs+Task+ActionResult+question)

## 常用

```c#
public async Task<ActionResult> DownloadFile(int fileID)
{
     // Do something here

     using (var context = new MyDBContext())
     {
            fileInfo = await context.Files.FindAsync(fileID);
     }

     // Do something here

     return new FilePathResult(filePath,"application/octet-stream");

}

return new FilePathResult(@"D:\Tmp\ICO\1\Paint_Tool_Sai_128px_572486_easyicon.net.ico", "application/octet-stream");
return new FilePathResult(@"D:\Tmp\ICO\1\Paint_Tool_Sai_128px_572486_easyicon.net.ico", "image/png");

/// <summary>图片测试</summary>
[Route("api/image/{img}")]
[HttpGet]
public HttpResponseMessage Image(string img)
{
    HttpResponseMessage response = new HttpResponseMessage();
    response.Content = new StreamContent(@"D:\Tmp\ICO\1\Paint_Tool_Sai_128px_572486_easyicon.net.ico".FileToStream());
    response.Content.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("image/png");
    return response;
}
```
