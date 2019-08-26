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

### 1. TargetFramework

- [assembly: TargetFramework(".NETFramework,Version=v4.5", FrameworkDisplayName = ".NET Framework 4.5")]

## Newtonsoft.Json 通过 JObject 读取 json 对像 超简单

- [Newtonsoft.Json 通过 JObject 读取 json 对像 超简单 - WebEnh - 博客园](https://www.cnblogs.com/webenh/p/5745355.html)

### 1. 版本重定向

- [Newtonsoft.Json 版本冲突解决 - BigLiang - 博客园](https://www.cnblogs.com/NewBigLiang/p/5371745.html)
- [Newtonsoft.Json 版本冲突解决](https://www.bbsmax.com/A/l1dyEwbdem/)
- [Newtonsoft.Json 版本不一致问题解决 - 沐恩 - CSDN 博客](https://blog.csdn.net/qq_31176861/article/details/84772964)
- [Found conflicts between different versions of the same dependent assembly that could not be resolved](https://stackoverflow.com/questions/24772053/found-conflicts-between-different-versions-of-the-same-dependent-assembly-that-c)

```c#
<assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
<bindingRedirect oldVersion="0.0.0.0-11.0.0.0" newVersion="11.0.0.0" />

<assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
<bindingRedirect oldVersion="0.0.0.0-6.0.0.0" newVersion="6.0.0.0" />

<assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
<bindingRedirect oldVersion="0.0.0.0-11.0.0.0" newVersion="6.0.0.0" />
```

```c#
// 通过bindingRedirect节点重定向，即当找到10.0的版本时，给定向到6.0版本
<runtime>
     <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
         <dependentAssembly>
             <assemblyIdentity name="Newtonsoft.Json"
                               publicKeyToken="30ad4fe6b2a6aeed"
                               culture="neutral" />
             <bindingRedirect oldVersion="10.0.0.0"
                              newVersion="6.0.0.0" />
         </dependentAssembly>
     </assemblyBinding>
</runtime>
// 对每个版本指定codeBase路径，然后分别放上不同版本的程序集，这样就可以加载两个相同的程序集
<runtime>
     <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
          <dependentAssembly>
              <assemblyIdentity name="Newtonsoft.Json"
                                publicKeyToken="30ad4fe6b2a6aeed"
                                culture="neutral" />
              <codeBase version="6.0.0.0"
                        href="E:\6.0\Newtonsoft.Json.dll" />
          </dependentAssembly>
          <dependentAssembly>
              <assemblyIdentity name="Newtonsoft.Json"
                                publicKeyToken="30ad4fe6b2a6aeed"
                                culture="neutral" />
              <codeBase version="10.0.0.0"
                        href="E:\10.0\Newtonsoft.Json.dll" />
          </dependentAssembly>
    </assemblyBinding>
</runtime>

```

```c#
// 通过bindingRedirect节点重定向，即当找到10.0的版本时，给定向到6.0版本

```

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

### 2. 的不同版本间存在无法解决的冲突。当日志详细信息设置为“详细”时，这些引用冲突将会在生成日志中列出

- [发现同一依赖程序集的不同版本间存在无法解决的冲突 - 世事一场大梦,人生几度秋凉 - CSDN 博客](https://blog.csdn.net/ao123056/article/details/86238871)
