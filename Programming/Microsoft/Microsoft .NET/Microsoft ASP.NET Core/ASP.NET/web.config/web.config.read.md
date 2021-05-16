# web.config.read

- [C#自定义 ConfigSections 节点操作 - u011555996 的博客](https://blog.csdn.net/u011555996/article/details/53173930)
- [ASP.NET 读取设置 Web.config 文件 - cpcpc - 博客园](http://www.cnblogs.com/cpcpc/archive/2012/09/10/2679083.html)

## C#读取 web.config 文件信息

## web.config

```Xml
<?xml version="1.0"?>
<!--
  有关如何配置 ASP.NET 应用程序的详细信息，请访问
  http://go.microsoft.com/fwlink/?LinkId=169433
  -->
<configuration>
  <appSettings>
    <add key="name" value="name1"/>
  </appSettings>
</configuration>
```

## C#读取

```C#
string name = System.Web.Configuration.WebConfigurationManager.AppSettings["name"];
```

## C#设置

```C#
string name = System.Web.Configuration.WebConfigurationManager.AppSettings["name"];
```

```Xml
<configuration>
    <configSections>
        <sectionGroup name="" type="">    </sectionGroup>
        </sectionGroup>

        <!--自定义配直web.config参数-->
        <section name="mySection" type="System.Configuration.SingleTagSectionHandler" />
        <!--自定义配直web.config参数-->

    </configSections>

    <!--自定义配直web.config参数-->
    <mySection section1 ="one" section2="two" section3="three" section4="four" />
    <!--自定义配直web.config参数-->

    <appSettings>
        <add key="" value="" />
    </appSettings>

    <connectionStrings/>
</configuration>
```

```C#
using System;
using System.Collections;
using System.Configuration;

public class ReaderConfiguration
{
    /// <summary>
    /// 读取web.config中自定义参数值
    /// </summary>
    /// <returns>String</returns>
    public String ReadMySettings()
    {
        IDictionary mySettings = (IDictionary)ConfigurationSettings.GetConfig("mySetting");
        string section1 = (string)sampleTable["section1"];
        string section2 = (string)sampleTable["section2"];
        string section3 = (string)sampleTable["section3"];
        string section4 = (string)sampleTable["section4"];
        return section1 + "," + section2 + "," + section3 + "," + section4 ;
    }
}
```
