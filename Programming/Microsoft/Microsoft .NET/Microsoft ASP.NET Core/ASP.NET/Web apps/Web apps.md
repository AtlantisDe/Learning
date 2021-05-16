# Web apps

- [Overview of ASP.NET Core MVC](https://docs.microsoft.com/en-us/aspnet/core/mvc/overview?view=aspnetcore-5.0)

## ConfigureServices

```c#
// 常用注册服务
//services.AddControllers();
services.AddControllersWithViews();
services.AddMvc();
```

## Configure

```c#
// 开发调试模式与生产环境处理
if (env.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
}

// 常用路由匹配配置
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Home}/{action=Index}/{id?}");
});
```
