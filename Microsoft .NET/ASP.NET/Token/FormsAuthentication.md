# FormsAuthentication

- [[ASP.NET]更简单的方法：FormsAuthentication 登录 ReturnUrl 使用绝对路径 - dudu - 博客园](https://www.cnblogs.com/dudu/p/formsauthentication-returnurl-absoluteuri.html) -[;FormsAuthenticationTicket - 梨花驿路 - 博客园](https://www.cnblogs.com/joeylee/p/3521131.html)
- [Asp.net MVC 使用 FormsAuthentication，MVC 和 WEB API 可以共享身份认证 （转载） - PowerCoder - 博客园](https://www.cnblogs.com/OpenCoder/p/6869168.html)
- [ASP.NET(c#) 中通过配置配置 authentication 来验证控制 Login 登录 - jintougao 的专栏 - CSDN 博客](https://blog.csdn.net/jintougao/article/details/42267807)

## .Net

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
