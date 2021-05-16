# UseStaticFiles

- [asp.netcore 关于静态文件的访问权限控制（UseStaticFiles） gnsyhxg  usestaticfiles](https://blog.csdn.net/gnsyhxg/article/details/90321749)

## app.UseStaticFiles();

```c#
app.UseStaticFiles();

//var a= Path.Combine(Directory.GetCurrentDirectory(), "MyStaticFiles");
var StaticWebRoot = @"D:\Site\www.StaticRoot.com";

app.UseStaticFiles();
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(
    Path.Combine(StaticWebRoot, "1.baidu.com")),
    RequestPath = "/1"
});

```
