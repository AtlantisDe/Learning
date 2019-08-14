# Newtonsoft

- [Json.NET - Newtonsoft](https://www.newtonsoft.com/json)
- [JamesNK/Newtonsoft.Json](https://github.com/JamesNK/Newtonsoft.Json/releases)

```C#
Newtonsoft.Json.JsonConvert.DeserializeObject<T>(config);
Newtonsoft.Json.JsonConvert.SerializeObject(obj);

System.IO.File.WriteAllText(ccc, Newtonsoft.Json.JsonConvert.SerializeObject(articleItem), Encoding.UTF8);

var jobj = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JArray>(rdata);

异常[无法将类型为“Newtonsoft.Json.Linq.JObject”的对象强制转换为类型“Newtonsoft.Json.Linq.JArray”。]

var json = {
    filenamestylesText: filenamestylesText,
    extensionnamesText: extensionnamesText,
  };

var jobj = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(config);

var jobj = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(json);

host = jobj["host"].ToString();
guid = jobj["guid"].ToString();

```

## Version (AssemblyVersion) (Runtime)

```c#
9.0.0.0
10.0.0.0
12.0.0.0 - (12.0.2.23222) (Runtime: v4.0.30319)
```

### TargetFramework

- [assembly: TargetFramework(".NETFramework,Version=v4.5", FrameworkDisplayName = ".NET Framework 4.5")]

## Newtonsoft.Json 通过 JObject 读取 json 对像 超简单

- [Newtonsoft.Json 通过 JObject 读取 json 对像 超简单 - WebEnh - 博客园](https://www.cnblogs.com/webenh/p/5745355.html)

### 版本重定向

- [Newtonsoft.Json 版本冲突解决 - BigLiang - 博客园](https://www.cnblogs.com/NewBigLiang/p/5371745.html)

```c#
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
        <bindingRedirect oldVersion="0.0.0.0-9.0.0.0" newVersion="6.0.0.0" />
      </dependentAssembly>
    </assemblyBinding>

    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
        <bindingRedirect oldVersion="0.0.0.0-6.0.0.0" newVersion="6.0.0.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="System.Net.Http.Formatting" publicKeyToken="31bf3856ad364e35" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-5.2.3.0" newVersion="5.2.3.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="System.Web.Http" publicKeyToken="31bf3856ad364e35" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-5.2.3.0" newVersion="5.2.3.0" />
      </dependentAssembly>
    </assemblyBinding>
```
