# Microsoft.Web.Administration

- [How to Use Microsoft.Web.Administration](https://docs.microsoft.com/en-us/iis/manage/scripting/how-to-use-microsoftwebadministration)
- [C# IIS 站点管理--Microsoft.Web.Administration.dll - Ｗ ǒ 々啊申々 - 博客园](https://www.cnblogs.com/zhaochengshen/p/7976894.html)
- [Application.Path Property (Microsoft.Web.Administration)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.administration.application.path?view=iis-dotnet)

## sites

```C#
 public static bool demodebug(string host)
        {

            // Get the site collection on this server.
            ServerManager serverManager = new ServerManager();
            var Sites = serverManager.Sites;

            string collectiondisplay = null;
            collectiondisplay = "There are " + Sites.Count.ToString() + " sites:\n\n";
            string sitedisplay = null;
            foreach (Site site in Sites)
            {
                sitedisplay = sitedisplay + site.Name + ": ID= " + site.Id + "\n";
                // Display each property of each bindings.
                string bindingdisplay = null;
                foreach (Microsoft.Web.Administration.Binding binding in site.Bindings)
                {
                    bindingdisplay = bindingdisplay + "  Binding:\n   BindingInformation: " +
                        binding.BindingInformation;
                    if (binding.Protocol == "https")
                    {
                        // There is a CertificateHash and
                        // CertificateStoreName for the https protocol only.
                        bindingdisplay = bindingdisplay + "\n   CertificateHash: " +
                            binding.CertificateHash + ": ";
                        // Display the hash.
                        foreach (System.Byte certhashbyte in binding.CertificateHash)
                        {
                            bindingdisplay = bindingdisplay + certhashbyte.ToString() + " ";
                        }
                        bindingdisplay = bindingdisplay + "\n   CertificateStoreName: " +
                            binding.CertificateStoreName;
                    }
                    bindingdisplay = bindingdisplay + "\n   EndPoint: " + binding.EndPoint;
                    bindingdisplay = bindingdisplay + "\n   Host: " + binding.Host;
                    bindingdisplay = bindingdisplay + "\n   IsIPPortHostBinding: " + binding.IsIPPortHostBinding;
                    bindingdisplay = bindingdisplay + "\n   Protocol: " + binding.Protocol;
                    bindingdisplay = bindingdisplay + "\n   ToString: " + binding.ToString();
                    bindingdisplay = bindingdisplay + "\n   UseDsMapper: " + binding.UseDsMapper + "\n\n";
                }
                sitedisplay = sitedisplay + bindingdisplay;
            }
            collectiondisplay = collectiondisplay + sitedisplay + "\n";


            return false;
        }

```

## site add

- [SiteCollection.Add Method (Microsoft.Web.Administration)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.administration.sitecollection.add?view=iis-dotnet)

## Binding.BindingInformation

- [Binding.BindingInformation Property (Microsoft.Web.Administration)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.administration.binding.bindinginformation?view=iis-dotnet)

### Remarks

```code
The value of this property is a colon-delimited string that includes the IP address, port, and host name of the binding. You can leave the host name blank. You can set the IP address to "*" to indicate that the binding works for all variables.

For example, a binding that is set for all IP addresses on port 80 and has no specified host name returns "*:80:" from this property. A binding that is set for IP address 192.168.1.150 on port 8080 returns "192.168.1.150:8080:". A binding that is set for all IP addresses on port 80 for a host named "microsoft.com" returns "*:80:microsoft.com".

The BindingInformation property values are maintained in the ApplicationHost.config file.
```

## 应用程序池标识 Application Pool Identities

- [Application Pool Identities](https://docs.microsoft.com/en-us/iis/manage/configuring-security/application-pool-identities)
- [IIS Application Pool 删除 - 任泽华 Ryan - 博客园](https://www.cnblogs.com/renzh/p/6056605.html)

## ConfigurationElement

- [ConfigurationElement Class (Microsoft.Web.Administration)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.administration.configurationelement?redirectedfrom=MSDN&view=iis-dotnet)

## site

### 1. site add demo 1

```c#
ServerManager manager = new ServerManager();
Site site = manager.Sites.Add(siteitem.host, "http", string.Format("*:80:{0}", siteitem.host), siteitem.path);
site.ServerAutoStart = true;

Configuration config = manager.GetApplicationHostConfiguration();
ConfigurationSection section = config.GetSection("system.webServer/defaultDocument", siteitem.host);
ConfigurationAttribute enabled = section.GetAttribute("enabled");
enabled.Value = false;

manager.CommitChanges();
```

### 2. site add demo 2

```c#
try
{
    ServerManager iismanager = new ServerManager();
    //判断应用程序池是否存在
    if (iismanager.ApplicationPools[webName] != null)
    {
        iismanager.ApplicationPools.Remove(iismanager.ApplicationPools[webName]);
    }
    //判断web应用程序是否存在
    if (iismanager.Sites[webName] != null)
    {
        iismanager.Sites.Remove(iismanager.Sites[webName]);
    }
    //建立web应用程序（第二个参数为安装文件的地址）
    iismanager.Sites.Add(webName, @"D:\wwwroot\1111.seoea.com", port);
    //添加web应用程序池
    ApplicationPool pool = iismanager.ApplicationPools.Add(webName);

    //设置web应用程序池的Framework版本（注意版本号大小写问题）
    pool.ManagedRuntimeVersion = "v4.0";
    //设置是否启用32为应用程序
    pool.SetAttributeValue("enable32BitAppOnWin64", true);
    //设置web网站的应用程序池
    iismanager.Sites[webName].Applications[0].ApplicationPoolName = webName;
    //提交更改
    iismanager.CommitChanges();

}
catch (Exception Ex)
{
    Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, Ex.Message));
    root.code = 100;
    root.message = string.Format("异常[{0}]", Ex.Message);
}
finally
{
}

```

### 3. IdentityType

```c#
ServerManager iismanager = new ServerManager();
ApplicationPool pool = iismanager.ApplicationPools["Seocontrol"];
pool.ProcessModel.IdentityType = ProcessModelIdentityType.LocalSystem;
```

### 4. Bindings

```c#
  using (ServerManager serverManager = new ServerManager())
            {
                foreach (var site in serverManager.Sites)
                {
                    var a = site.Bindings.Count;
                    if (site.Name == "Default Web Site")
                    {
                        site.Bindings[0].Protocol = "http";
                        site.Bindings[0].BindingInformation = "*:80:www.baidu1.com";
                    }
                }
                serverManager.CommitChanges();
            }

```

### 5. PhysicalPath

```c#
var SitesLook = serverManager.Sites.Where(a => a.Name == "Default Web Site").ToList();
var site1 = SitesLook[0];
var Path1 = site1.Applications[0].VirtualDirectories[0].PhysicalPath;


```
