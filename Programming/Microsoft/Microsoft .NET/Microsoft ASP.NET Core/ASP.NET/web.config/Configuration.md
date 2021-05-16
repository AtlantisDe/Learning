# Configuration

- [ASP.NET Web Configuration Guidelines](<https://docs.microsoft.com/en-us/previous-versions/ff400235(v=vs.100)>)

## compilation 汇编

```c#
<compilation debug="true"
    optimizeCompilations="true"
    targetFramework="4.0" />
```

## Custom Errors 自定义错误页面

- HTTP 403 (Forbidden) or HTTP 404 (Not Found) errors
- 403 无权限 404 页面找不到

```c#
<customErrors mode="RemoteOnly"
    defaultRedirect="GenericErrorPage.htm">
  <error statusCode="403" redirect="NoAccess.htm" />
  <error statusCode="404" redirect="FileNotFound.htm" />
</customErrors>
```

## Authentication and Roles 身份和角色

```c#
<authentication mode="Windows"/>
```

### authentication Element (ASP.NET Settings Schema)

- [authentication Element (ASP.NET Settings Schema)](https://docs.microsoft.com/en-us/previous-versions/dotnet/netframework-4.0/532aee0e(v=vs.100))

```c#
<authentication
   mode="[Windows|Forms|Passport|None]"
>
   <forms>...</forms>
   <passport/>
</authentication>
```

### Default Configuration

```c#
<authentication mode="Windows">
   <forms
      name=".ASPXAUTH"
      loginUrl="login.aspx"
      defaultUrl="default.aspx"
      protection="All"
      timeout="30"
      path="/"
      requireSSL="false"
      slidingExpiration="true"
      cookieless="UseDeviceProfile" domain=""
      enableCrossAppRedirects="false">
      <credentials passwordFormat="SHA1" />
   </forms>
   <passport redirectUrl="internal" />
</authentication>
```

### authorization Element (ASP.NET Settings Schema)

- [authorization Element (ASP.NET Settings Schema)](<https://docs.microsoft.com/en-us/previous-versions/dotnet/netframework-4.0/8d82143t(v=vs.100)>)

```c#
<configuration>
   <system.web>
      <authorization>
         <allow roles="Admins"/>
         <deny users="*"/>
      </authorization>
   </system.web>
</configuration>
```

### ASP.NET Web Application Security

- [ASP.NET Web Application Security](<https://docs.microsoft.com/en-us/previous-versions/aspnet/330a99hc(v=vs.100)>)

```c#

```

## IIS 7 and ASP.NET Ajax

- [How to: Configure the <system.webServer> Section for IIS 7.0](https://docs.microsoft.com/en-us/previous-versions/aspnet/bb763179(v=vs.100))

```c#
<connectionStrings>
  <add name="Sales"
       connectionString=
         "server=myserver;database=Products;
         uid=<user name>;pwd=<secure password>" />
</connectionStrings>
```
