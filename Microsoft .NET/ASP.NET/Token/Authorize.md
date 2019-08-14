# Authorize

- [YouTube](https://www.youtube.com/watch?v=7m6pY8Bpxj4)

## .Net

### MVC 自带过滤器：[Authorize]

```c#
// 1.只要将过滤器置于相关的action之前，action运行的时候，Authorize过滤器会先运行。
[Authorize]
public ActionResult TestAuthority(){
//代码逻辑片段
}
// 2.也可以将特性置于整个控制器之上，这样控制器下所有action就都使用了此特性。
[Authorize]
public class TestControll:Controller
{
//All Action
}
// 3.如果想某个action跳过过滤器只需要在相应的action上添加[AllowAnonyMous]特性.
// 1.当我们需要在某个页面或者方法进行权限验证的时候，我们就需要自己定义过滤器，这个类里面有两个方法需要重写
public class LoginAuthorityAttribute : AuthorizeAttribute
{
    public int AuthorityLevel { get; set; } //权限等级参数
    protected override bool AuthorizeCore(HttpContextBase httpContext)
    {
        //return base.AuthorizeCore(httpContext);
        return AuthorityLevel == 2;//判断条件是否满足，如果是true则继续执行，如果false 则执行HandleUnauthorizedRequest方法
    }
    protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
    {

        filterContext.HttpContext.Response.Redirect("/Login/Index");
    }
}
// bool AuthorizeCore(HttpContextBase httpContext)：这里主要是授权验证的逻辑处理，返回true的则是通过授权，返回了false则不是。
// void HandleUnauthorizedRequest(AuthorizationContext filterContext)：这个方法是处理授权失败的事情。

// .然后将这个特性应用到对应的action或者controller上。
[LoginAuthority(AuthorityLevel = 1)]
public ActionResult test()
{
    View();
}
```
