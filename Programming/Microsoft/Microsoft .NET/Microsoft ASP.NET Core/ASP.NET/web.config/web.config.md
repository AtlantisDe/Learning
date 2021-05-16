# web.config

- [Web.Config](https://docs.microsoft.com/en-us/iis-administration/security/integrated/web.config)
- [c# web.config 读取 web.config 中自定义的参数信息,configuration section configSections](https://heisetoufa.iteye.com/blog/468141)
- [Web.config 配置文件详解(新手必看) - 永无止贱＠ - 博客园](http://www.cnblogs.com/enfp/articles/7718264.html)
- [asp.net 项目中通过 Web.config 配置文件及文件夹的访问权限！ - 三小 - 博客园](https://www.cnblogs.com/lsgsanxiao/p/4253441.html)

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

## 多级目录配置方式

```C#
// 上面的方式是“集中管理”的方式，也就是说在一个配置文件中配置所有页面的访问权限，这儿再介绍一下分散管理的方式，即通过多个web.config来配置文件的访问权限。

// 首先，web.config的作用我们应该知道两点：

// 1、web.config的设置将作用于所在目录及所在目录下的所有子文件下的资源——一般指.net资源，如aspx、ashx、ascx等文件，对.html、js、css等则不起作用，当然，不同的iis版本下有所不同，在此不做讨论。

// 2、子目录下的web.config文件将覆盖从父目录继承下来的设置。
```

```xml
<?xml version="1.0"?>

<configuration>
  <location path="token.aspx">
    <system.web>
      <authorization>
        <allow users="*"/>
      </authorization>
    </system.web>
  </location>

</configuration>
```
