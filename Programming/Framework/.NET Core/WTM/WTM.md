# WTM

- [dotnetcore/WTM](https://github.com/dotnetcore/WTM)
- [WTM -- Rapid development framework based on dotnet core](http://wtmdoc.walkingtec.cn/)
- [首页 - WTM 社区](https://community.walkingtec.cn/)

```c#

```

## 0. Installation

- [该向导将帮助您快速配置和使用 WTM 框架](https://wtmdoc.walkingtec.cn/setup)

```c#
TestDemoWTM001
TestDemoWTM002
TestDemoWTM003

// SqlServer
Server=(localdb)\\mssqllocaldb;Database=TestDemoWTM001_db;Trusted_Connection=True;

Server=(localdb)\\mssqllocaldb;Database=DB_TestDemoWTM003;Trusted_Connection=True;
Server=(localdb)\\mssqllocaldb;Database=DB_TestDemoWTM003_New;Trusted_Connection=True;



Entity Framework Core
Package Manager Console

Server=(localdb)\\mssqllocaldb;Database=DB_TestDemoWTM001_New;Trusted_Connection=True;
return new DataContext("Server=(localdb)\\mssqllocaldb;Database=DB_TestDemoWTM001_New;Trusted_Connection=True;", DBTypeEnum.SqlServer);

// MySql

Server=127.0.0.1;Port=3306;Database=DB_KeepApp;User ID=root;Password=root;

Server=localhost;Port=3306;Database=DB_WTMdemo;User ID=root;Password=root;

Server=localhost;Port=3306;Database=DB_WTMdemo001;User ID=root;Password=root;
return new DataContext("Server=localhost;Port=3306;Database=DB_TestDemoWTM001_New;User ID=root;Password=root;", DBTypeEnum.MySql);

Server=localhost;Port=3306;Database=DB_WTMdemo002;User ID=root;Password=root;
return new DataContext("Server=localhost;Port=3306;Database=DB_WTMdemo002_New;User ID=root;Password=root;", DBTypeEnum.MySql);


// err
Server=127.0.0.1;Persist Security Info=False; Trusted_Connection=Yes;UID=root;PWD=root; DATABASE=DB_WTMdemo;Charset=utf8; SslMode=none;Min Pool Size=1
Server=.;Port=5432;Database=Enterprise_CmsDb;User Id=postgres;Password=123456;


// 常见报错删除 清空里面内容
D:\Work\Github\TestDemo\TestDemoSln001\TestDemoWTM001\TestDemoWTM001\obj\Debug\net5.0\Razor\Views\_ViewStart.cshtml.g.cs



// Sqlite
DataSource=DB_Hr.sqlite
DataSource=DB_WTMPageTest.sqlite
```

## 1. 数据库层

```c#
// 当前我使用的版本:
Install-Package Microsoft.EntityFrameworkCore.Design -Version 5.0.3

检查:
Get-Help about_EntityFrameworkCore


1. 创建旧数据库模型
Add-Migration init

2. 创建新数据库模型
Add-Migration init2

3. 对比新旧数据库模型,生成新旧数据库的差异SQL,用生成的数据库SQL在数据库中运行
Script-Migration init init2


Update-Database

```

## 2. layuiadmin 配置

```c#

\Controllers\HomeController.cs

// 推荐
favicon32.png

<link href="/favicon.ico?v=1.0" rel="icon" type="image/x-icon" />


<link rel="shortcut icon" href="/favicon.ico" />
<link href="/favicon32.png" rel="shortcut icon" type="image/x-icon" />


// \wwwroot\layuiadmin\config.js
// 后台名称
, name: '健康监测平台'

 //主题配置


// Logo配置
// 32PX
wwwroot\layuiadmin\style\res\logo.png
```

## 3. 模型

- [WTM -- Rapid development framework based on dotnet core](http://wtmdoc.walkingtec.cn/#/Model/Poco)

```c#


```

### 0. DataContext.cs

```c#
// 将现有数据库删掉，然后按F5运行，现在我们有一个School的Model，并且让数据库也生成了相应的表

public DbSet<KeepApp.Model.Student> Students { get; set; }

```

### 1. 一对一

```c#
/// <summary>所属学校</summary>
[Display(Name = "所属学校")]
[Required()]
public Guid? SchoolId { get; set; }
public School School { get; set; }

```

### 2. 照片

```c#

/// <summary>菜品图片</summary>
[Display(Name = "菜品图片")]
public Guid? CaiPinImg1Id { get; set; }
public FileAttachment CaiPinImg1 { get; set; }


```

### 3. Text 类型 [Column(StringLength =-1)]

```c#
// 注意：Oracle nclob 需要 v1.3.2+ 版本才支持，否则将映射 nvarchar2(4000)

// 注意：MySql [MaxLength(-2)] 或者 [Column(StringLength = -2)] 映射类型 longtext，其他数据库的映射规则与 -1 相同

/// <summary>Json数据</summary>
[Display(Name = "Json数据")]
[Required(ErrorMessage = "{0}是必填项")]
[MaxLength(-1)]
public string DataText { get; set; }


```

## 4. WTM 配置

```c#
  "IsQuickDebug": true, //is debug mode   true  false


"PageMode": "Tab", //display mode，Single or Tab
"TabMode": "Single", //Tab mode，Default or Simple


"PageMode": "Single", //display mode，Single or Tab
"TabMode": "Simple", //Tab mode，Default or Simple



// 调试地址
/_codegen/index

\Controllers\LoginController.cs


\Views\Shared\_Layout.cshtml

Views/Home/FrontPage.cshtml
Views\Home\Layout.cshtml


// 去掉验证码
\Controllers\LoginController.cs




```

## 0. QuickStart

### 1. CORS 跨域配置

- [(CORS) 启用跨域请求 ASP.NET Core](https://docs.microsoft.com/zh-cn/aspnet/core/security/cors?view=aspnetcore-5.0)
- [WTM(ASP.NET Core)跨域设置\_sxy_student 的博客-CSDN 博客](https://blog.csdn.net/sxy_student/article/details/107885434)
- [原因:cors 请求未能成功\_三种对 CORS 错误配置的利用方法（转）\_weixin_39752087 的博客-CSDN 博客](https://blog.csdn.net/weixin_39752087/article/details/110806536)
- [(CORS) 启用跨域请求 ASP.NET Core](https://docs.microsoft.com/zh-cn/aspnet/core/security/cors?view=aspnetcore-5.0#cors-in-iis)

```c#
  "CorsOptions": {
    "EnableAll": true,
    "Policy": [
      {
        "Name": "Default",
        "Domain": "http://localhost:8080,https://localhost"
      }
    ]
  }

// 启用 CORS
// 有三种方法可启用 CORS：
// 使用 命名策略 或 默认策略的中间件。
// 使用 终结点路由。
// 带有 [EnableCors] 属性的。
// 通过命名策略使用 [EnableCors] 属性，可在限制支持 CORS 的终结点时提供最佳控制。

// GET api/values
[EnableCors("AnotherPolicy")]
[HttpGet]
public ActionResult<IEnumerable<string>> Get()
{
    return new string[] { "green widget", "red widget" };
}



// 一般自己总结的方案是
1. ConfigureServices 添加跨域

services.AddCors();

// 或者

services.AddCors(options =>
{
    options.AddPolicy("all", builder =>
    {
        builder.SetIsOriginAllowed(_ => true) //允许任何来源的主机访问
        //.WithOrigins("http://localhost:8080", "https://127.0.0.1:11313", "https://3.com:11316")
        .AllowAnyMethod()
        .AllowAnyHeader()
        .AllowCredentials();//指定处理cookie
    });
});

2. Configure 层
app.UseCors(x => x.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod());

// 或者

app.UseCors("all");



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

## 99. 经典教程

- [.net core 快速开发框架 WTM 系列视频教程](https://www.bilibili.com/video/BV1Z7411H7bD?p=4&spm_id_from=pageDriver)

```c#

```
