# web.config

- [Web.Config](https://docs.microsoft.com/en-us/iis-administration/security/integrated/web.config)
- [c# web.config 读取 web.config 中自定义的参数信息,configuration section configSections](https://heisetoufa.iteye.com/blog/468141)

## 常用配置

```xml
<configuration>
  <system.web>
    <compilation debug="true" targetFramework="4.0"/>
    <pages controlRenderingCompatibilityVersion="3.5" clientIDMode="AutoID"/>


    <authentication mode="Forms"/>
    <authorization>
      <deny users="?"/>
    </authorization>


  </system.web>

  <location path="demo.aspx">

    <system.web>

      <authorization>

        <allow users="*" />

      </authorization>

    </system.web>

  </location>

</configuration>

```

## 默认配置

```xml
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

## 求对所有用户进行 Forms 身份验证，并拒绝匿名用户访问站点

```xml
<configuration>

   <system.web>

      <authentication mode="Forms">

         <forms name="401kApp" loginUrl="/login.aspx"/>

      </authentication>

      <authorization>

         <deny users="?"/>

      </authorization>

   </system.web>

</configuration>
```
