# FormsAuthentication

- [为 Web 应用程序管理 Forms 身份验证服务。 此类不能被继承。](public sealed class FormsAuthentication)
- [FormsAuthentication Class (System.Web.Security)](https://docs.microsoft.com/zh-cn/dotnet/api/system.web.security.formsauthentication?redirectedfrom=MSDN&view=netframework-4.7.2)
- [FormsAuthentication Class (System.Web.Security)](https://docs.microsoft.com/en-us/dotnet/api/system.web.security.formsauthentication?view=netframework-4.8)
- [FormsAuthentication.GetAuthCookie Method (System.Web.Security)](https://docs.microsoft.com/en-us/dotnet/api/system.web.security.formsauthentication.getauthcookie?view=netframework-4.8)
- [FormsAuthentication.SignOut Method (System.Web.Security)](https://docs.microsoft.com/en-us/dotnet/api/system.web.security.formsauthentication.signout?view=netframework-4.8)
- [[ASP.NET]更简单的方法：FormsAuthentication 登录 ReturnUrl 使用绝对路径 - dudu - 博客园](https://www.cnblogs.com/dudu/p/formsauthentication-returnurl-absoluteuri.html) -[;FormsAuthenticationTicket - 梨花驿路 - 博客园](https://www.cnblogs.com/joeylee/p/3521131.html)
- [Asp.net MVC 使用 FormsAuthentication，MVC 和 WEB API 可以共享身份认证 （转载） - PowerCoder - 博客园](https://www.cnblogs.com/OpenCoder/p/6869168.html)
- [ASP.NET(c#) 中通过配置配置 authentication 来验证控制 Login 登录 - jintougao 的专栏 - CSDN 博客](https://blog.csdn.net/jintougao/article/details/42267807)

## .Net

### 0. Forms 身份认证

- [ASP.NET MVC5 登录之（一）Forms 身份认证](https://www.jianshu.com/p/f0bffd09e1df)
- [;FormsAuthenticationTicket - 梨花驿路 - 博客园](https://www.cnblogs.com/joeylee/p/3521131.html)

```c#
// ASP.NET身份认证过程
// 在ASP.NET中，身份认证过程分为两个部分：

// 认证：识别当前请求的用户是否为可识别（已登录）用户；
// 授权：根据认证中识别的用户决定是否允许当前用户的请求访问指定的资源。
// 其中Forms认证由FormsAuthenticationModule实现，URL授权检查由UrlAuthorizationModule实现
```

### 1. 用过的配置器

```c#
<authentication mode="Forms">
    <forms name=".ASPXAUTH" loginUrl="/App/Console/Login" defaultUrl="/App/Console" protection="All" timeout="1400" path="/" requireSSL="false" slidingExpiration="false" enableCrossAppRedirects="false" cookieless="UseDeviceProfile" domain="" />
</authentication>
<authorization>
    <deny users="?" />
</authorization>
```

### 2. 代码

```c#
<system.web>
  <!--拒绝匿名用户访问-->
  <authentication mode="Forms">
          <forms loginUrl="Default.aspx" defaultUrl="Admin.aspx" name=".ASPXFORMSAUTH">
          </forms>
  </authentication>
  <authorization>
      <deny users="?"/>
      <!--<allow users = "*" />-->
  </authorization>
</system.web>
<location path="progressbar.aspx">
  <system.web>
    <authorization>
      <allow users="?" />
    </authorization>
  </system.web>
</location>
```

### 3. 验证用户的状态（匿名|已登录)

- [ASP.net MVC 中 Security.FormsAuthentication 验证用户的状态（匿名|已登录](https://www.cnblogs.com/ylbtech/archive/2012/08/23/2652394.html)
- [[Solved] Login Status not clearing session when click logout - CodeProject](https://www.codeproject.com/Questions/287701/Login-Status-not-clearing-session-when-click-logou)
- [C#中 FormsAuthentication 用法实例 - 电脑客 - 博客园](https://www.cnblogs.com/zhaoyongjiang/p/7065843.html)

```c#
using System.Web.Mvc;

using System.Web.Security;
namespace MvcSecurity.Controllers
{
    public class AccountController : Controller
    {
        //
        // GET: /Account/
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

        //
        //  GET: /Account/Login

        [HttpGet]
        public ActionResult Login()
        {
            // 如果是登录状态，则条转到个人主页
            if (Session["Username"] != null)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }

        //
        // Post: /Account/Login

        [HttpPost]
        public ActionResult Login(string username,string userpass)
        {

            if (username == "sunshine" && userpass == "m123")
            {

                //创建身份验证票证，即转换为“已登录状态”
                FormsAuthentication.SetAuthCookie(username, false);
                //存入Session
                Session["Username"] = username;

                //如果是跳转过来的，则返回上一页面
                if (!string.IsNullOrEmpty(Request["ReturnUrl"]))
                {
                    string returnUrl = Request["ReturnUrl"];
                    return Redirect(returnUrl);
                }
                else
                {
                    //用户个人主页
                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewData["Tip"] = "用户名或密码有误！";
                return View();
            }
        }

        //
        // GET: /Account/Logout

        [HttpGet]
        public ActionResult Logout()
        {
            //取消Session会话
            Session.Abandon();

            //删除Forms验证票证
            FormsAuthentication.SignOut();


            return RedirectToAction("Index", "Home");
        }
    }
}
```

### 4. SignOut

```c#
Session.Clear();
Session.Abandon();
Session.RemoveAll();
FormsAuthentication.SignOut();
FormsAuthentication.RedirectToLoginPage();
Roles.DeleteCookie();

System.Web.Security.FormsAuthentication.RedirectToLoginPage();


[HttpPost]
public ActionResult SignOut()
{
    FormsAuthentication.SignOut();
    HttpContext.User = new System.Security.Principal.GenericPrincipal(new System.Security.Principal.GenericIdentity(string.Empty), null);
    return View();
}

```
