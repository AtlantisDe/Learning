# ajax Cross-domain(Cors)

- [ASP.NET MVC &amp; WebApi 中实现Cors来让Ajax可以跨域访问 （转载） - PowerCoder - 博客园](https://www.cnblogs.com/OpenCoder/p/6890703.html)
- [ajax 跨域，这应该是最全的解决方案了 - 程序生涯 - SegmentFault 思否](https://segmentfault.com/a/1190000012469713)
- [jquery ajax 跨域访问 webservice 配置 - Ace001 - 博客园](https://www.cnblogs.com/xuejianxiyang/p/5369346.html)

## 配置跨域

### .NET 允许 AJAX 跨域访问

- [.NET 允许 AJAX 跨域访问 - chengmodelong 的专栏 - CSDN 博客](https://blog.csdn.net/chengmodelong/article/details/88955737)
- [jquery ajax 跨域访问 webservice 配置 - Ace001 - 博客园](https://www.cnblogs.com/xuejianxiyang/p/5369346.html)
- [jquery ajax 跨域请求 webservice webconfig 配置 - 狼来了 - 博客园](https://www.cnblogs.com/wolfocme110/p/4434020.html)

```c#
- 其实只要配置webServer
<system.webServer>
    <httpProtocol>
      <customHeaders>
        <add name="Access-Control-Allow-Methods" value="OPTIONS,POST,GET" />
        <add name="Access-Control-Allow-Headers" value="x-requested-with,content-type" />
        <add name="Access-Control-Allow-Origin" value="*" />
      </customHeaders>
    </httpProtocol>

</system.webServer>
```

- 详细配置

```c#
<configuration>
    <system.web>
      <compilation debug="true" targetFramework="4.0" />
      <webServices>
        <protocols>
          <add name="HttpGet"/>
          <add name="HttpPost"/>
        </protocols>
      </webServices>

    </system.web>
  <system.webServer>
    <httpProtocol>
    <customHeaders>
      <add name="Access-Control-Allow-Methods" value="OPTIONS,POST,GET"/>
      <add name="Access-Control-Allow-Headers" value="x-requested-with,content-type"/>
      <add name="Access-Control-Allow-Origin" value="*" />
    </customHeaders>
  </httpProtocol>
  <modules>
    <add name="MyHttpModule" type="WebServiceDemo.MyHttpModule"/>
  </modules>
  </system.webServer>
</configuration>
```

### 如果想选定的网站可能跨域访问，修改配置如下

```c#
<add name="Access-Control-Allow-Origin" value="http://domain1.com, http://domain2.com" />
```
