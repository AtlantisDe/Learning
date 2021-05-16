# Swagger

- [The Best APIs are Built with Swagger Tools | Swagger](https://swagger.io/)
- [Swagger](https://github.com/swagger-api)
- [domaindrivendev/Swashbuckle.AspNetCore](https://github.com/domaindrivendev/Swashbuckle.AspNetCore)
- [How to Setup Swagger in Web API ASP.NET with Swashbuckle](https://www.andrewhoefling.com/Blog/Post/web-api-swagger-swashbuckle)
- [C# Swagger 生成接口文档 - ice.ko - 博客园](https://www.cnblogs.com/miskis/p/7561249.html)
- [abelsilva/swaggerwcf](https://github.com/abelsilva/swaggerwcf)

## 1. 配置

```c#
services.AddMvc();

services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo { Title = "My API", Version = "v1" });
});

app.UseSwagger();

app.UseSwaggerUI(
    m =>
    {
        m.SwaggerEndpoint("/swagger/v1/swagger.json", "swaggerTest");
    }

    );

```

## 2. QuickStart

- [.NetCore swagger 发布到 iis 时访问 api 出现 404 的解决方案\_jecket_zhou 的博客-CSDN 博客](https://blog.csdn.net/jecket_zhou/article/details/89393209)
- [在 ASP.NET Core 中使用多个环境](https://docs.microsoft.com/zh-cn/aspnet/core/fundamentals/environments?view=aspnetcore-5.0)

```c#

```

## 3. 常用

```c#

```

### 1. Swagger 注释 API 详细说明

- [swagger 常用注解说明](https://segmentfault.com/a/1190000010465989)
- [swagger 注释 API 详细说明 - 学不死的程序员 - 博客园](https://www.cnblogs.com/zhuhui-site/p/10092322.html)

```c#
Api
ApiModel
ApiModelProperty
ApiOperation
ApiParam
ApiResponse
ApiResponses
ResponseHeader

常用注解：
- @Api()用于类；
表示标识这个类是swagger的资源
- @ApiOperation()用于方法；
表示一个http请求的操作
- @ApiParam()用于方法，参数，字段说明；
表示对参数的添加元数据（说明或是否必填等）
- @ApiModel()用于类
表示对类进行说明，用于参数用实体类接收
- @ApiModelProperty()用于方法，字段
表示对model属性的说明或者数据操作更改
- @ApiIgnore()用于类，方法，方法参数
表示这个方法或者类被忽略
- @ApiImplicitParam() 用于方法
表示单独的请求参数
- @ApiImplicitParams() 用于方法，包含多个 @ApiImplicitParam


@Api(value="用户controller",tags={"用户操作接口"})
@RestController
public class UserController {

}
```
