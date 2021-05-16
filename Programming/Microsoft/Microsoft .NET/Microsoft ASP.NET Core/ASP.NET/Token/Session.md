# Session

- [ASP.NET 中的 Session 怎么正确使用 - 上古时期的码农 - 博客园](https://www.cnblogs.com/ideacore/p/6423281.html)
- [ASP.NET Core 中简单 Session 登录校验 - 纸上得来终觉浅，绝知此事要躬行 - CSDN 博客](https://blog.csdn.net/boonya/article/details/84565976#%E5%90%AF%E7%94%A8Session%E9%85%8D%E7%BD%AE)
- [asp.net 身份验证（最简单篇）](https://m.jb51.net/article/18294.htm)
- [Asp.net 中判断一个 session 是否合法的方法](https://www.jb51.net/article/40123.htm)
- [asp.net 判断 session 是否过期 - KyrieYang - 博客园](https://www.cnblogs.com/yzenet/p/3377438.html)
- [Asp.NET 设置 Session 过期时间的四种方式 - 彪悍的代码不需要注释 - 博客园](https://www.cnblogs.com/ingstyle/p/5711366.html)
- [Forms Authentication Timeout Logging](https://stackoverflow.com/questions/7797274/forms-authentication-timeout-logging)
- [How can I handle forms authentication timeout exceptions in ASP.NET?](https://stackoverflow.com/questions/7586469/how-can-i-handle-forms-authentication-timeout-exceptions-in-asp-net)
- [Form 认证 timeout 无效问题 - 左直拳的马桶 日用桶 - CSDN 博客](https://blog.csdn.net/leftfist/article/details/77016844)
- [推荐阅读 FormsAuthenticationTicket asp.net 登陆验证 Form 表单验证的 3 种方式 FormsAuthentication.SetAuthCookie；FormsAuthentication.RedirectFromLoginPage;FormsAuthenticationTicket](https://www.cnblogs.com/joeylee/p/3521131.html)
- [FormsAuthentication.RedirectFromLoginPage&nbsp;登录](http://blog.sina.com.cn/s/blog_5ecc1bdf0101899z.html)

## Session 配置过期时间

- [.net session 超时设置 sessionState 的相关属性 - ruirui - CSDN 博客](https://blog.csdn.net/kaifa123/article/details/6890106)
- [SessionState 详解 session 有效期时间：默认 20 分 - 【唐】三三 - 博客园](https://www.cnblogs.com/tangge/archive/2013/09/10/3312380.html)
- [Form 认证 timeout 无效问题 - 左直拳的马桶 日用桶 - CSDN 博客](https://blog.csdn.net/leftfist/article/details/77016844)
- [FormsAuthenticationConfiguration.Timeout Property (System.Web.Configuration)](https://docs.microsoft.com/en-us/dotnet/api/system.web.configuration.formsauthenticationconfiguration.timeout?view=netframework-4.8)
- [采用 Asp.Net 的 Forms 身份验证时，非持久 Cookie 的过期时间会自动扩展 - 郑文亮 - 博客园](https://www.cnblogs.com/zhwl/p/3835769.html)

```C#
// 限控制分为认证（authentication）和授权（authorization）
<system.web>
<authentication mode="Forms" >
<forms name="AuthLogin" loginUrl="/Login.aspx" protection="All" timeout="360" slidingExpiration="true"/>
</authentication><sessionState mode= "InProc" cookieless="false" timeout="20" /> </system.web>
```

```C#
<sessionState mode= "InProc" cookieless="false" timeout="1" />
<sessionState mode= "InProc" timeout="1" />
```

```C#
<sessionState mode="Off|InProc|StateServer|SQLServer"
cookieless="true|false"
timeout="number of minutes"
stateConnectionString="tcpip=server:port"
sqlConnectionString="sql connection string"
stateNetworkTimeout="number of seconds"
/>
```

## Session 设置

```C#
FormsAuthentication.SetAuthCookie("token", false);
// 要保存登录状态，在使用FormsAuthentication.SetAuthCookie 方法 (String, Boolean) ，将第2个参数设置为true
```

## Session 清空

```C#
FormsAuthentication.SignOut();
Session.Abandon();//取消当前会话
Session.Clear();//清除所有session
Session.Remove("sessionUserName");
Session.Remove("sessionGLBM");
```

## Session 是否过期

```C#
// HttpContext.Current.User.Identity.IsAuthenticated
// Request.IsAuthenticated

if (Request.IsAuthenticated==false)
 {
     Response.Redirect("../Login.aspx?m=登录已超时，请重新登陆！");
 }

if (Session["UserID"] == "" || Session["UserID"] == null)
 {
     Response.Redirect("../Login.aspx?m=登录已超时，请重新登陆！");
 }
// 当我们用Forms认证方式的时候，可以使用HttpContext.Current.User.Identity.IsAuthenticated  （或者也可以用 Request.IsAuthenticated ，这个实际上也是调用的是User.Identity.IsAuthenticated来验证）来判断是否登陆;而这个判断就是依赖于这个Cookie里的信息判断用户是否登陆。
// FormsAuthentication.SignOut用来清除这个Cookie标记
// Form身份认证依赖Cookie，Asp.net就是每次检查我们在配置文件中指定的Cookie名称，并解密这个Cookie来判断当前请求用户的登录状态

```
