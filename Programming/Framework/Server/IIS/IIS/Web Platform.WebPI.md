# WebPI | Web Platform Installer

- [Web Platform Installer : The Official Microsoft IIS Site](https://www.microsoft.com/web/downloads/platform.aspx)

## 0. 下载

```c#
// Web Platform Installer

Download WebPI 5.0
// English: x64 installer / x86 installer
```

## 10. IIS 中的 CORS | IIS CORS Module

- [(CORS) 启用跨域请求 ASP.NET Core](https://docs.microsoft.com/zh-cn/aspnet/core/security/cors?view=aspnetcore-5.0#cors-in-iis)
- [IIS CORS Module : The Official Microsoft IIS Site](https://www.iis.net/downloads/microsoft/iis-cors-module)

```c#
public class StartupTest2
{
    public void ConfigureServices(IServiceCollection services)
    {
        services.AddCors(options =>
        {
            options.AddPolicy(name: "MyPolicy",
                builder =>
                {
                    builder.WithOrigins("http://example.com",
                        "http://www.contoso.com",
                        "https://cors1.azurewebsites.net",
                        "https://cors3.azurewebsites.net",
                        "https://localhost:44398",
                        "https://localhost:5001")
                            .WithMethods("PUT", "DELETE", "GET");
                });
        });

        services.AddControllers();
        services.AddRazorPages();
    }

    public void Configure(IApplicationBuilder app)
    {
        app.UseHttpsRedirection();
        app.UseStaticFiles();
        app.UseRouting();

        app.UseCors();

        app.UseAuthorization();

        app.UseEndpoints(endpoints =>
        {
            endpoints.MapControllers();
            endpoints.MapRazorPages();
        });
    }
}
```
