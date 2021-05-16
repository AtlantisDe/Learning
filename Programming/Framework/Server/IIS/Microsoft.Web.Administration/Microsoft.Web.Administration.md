# Microsoft.Web.Administration

- [IIS.Administration](https://github.com/microsoft/IIS.Administration)
- [Microsoft IIS Administration API - Microsoft IIS Administration](https://blogs.iis.net/adminapi)
- [How to Use Microsoft.Web.Administration](https://docs.microsoft.com/en-us/iis/manage/scripting/how-to-use-microsoftwebadministration)
- [C# IIS 站点管理--Microsoft.Web.Administration.dll - Ｗ ǒ 々啊申々 - 博客园](https://www.cnblogs.com/zhaochengshen/p/7976894.html)
- [Application.Path Property (Microsoft.Web.Administration)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.administration.application.path?view=iis-dotnet)

## 0. sites

- [Microsoft.Web.Administration 11.1.0](https://www.nuget.org/packages/Microsoft.Web.Administration)

```C#
using (var serverManager = new Microsoft.Web.Administration.ServerManager())
{

}


Install-Package Microsoft.Web.Administration -Version 11.1.0

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

## 1. site add

- [SiteCollection.Add Method (Microsoft.Web.Administration)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.administration.sitecollection.add?view=iis-dotnet)

## 2. Binding.BindingInformation

- [Binding.BindingInformation Property (Microsoft.Web.Administration)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.administration.binding.bindinginformation?view=iis-dotnet)

### 1. Remarks

```code
The value of this property is a colon-delimited string that includes the IP address, port, and host name of the binding. You can leave the host name blank. You can set the IP address to "*" to indicate that the binding works for all variables.

For example, a binding that is set for all IP addresses on port 80 and has no specified host name returns "*:80:" from this property. A binding that is set for IP address 192.168.1.150 on port 8080 returns "192.168.1.150:8080:". A binding that is set for all IP addresses on port 80 for a host named "microsoft.com" returns "*:80:microsoft.com".

The BindingInformation property values are maintained in the ApplicationHost.config file.
```

## 2. 应用程序池标识 Application Pool Identities

- [Application Pool Identities](https://docs.microsoft.com/en-us/iis/manage/configuring-security/application-pool-identities)
- [IIS Application Pool 删除 - 任泽华 Ryan - 博客园](https://www.cnblogs.com/renzh/p/6056605.html)

## 3. ConfigurationElement

- [ConfigurationElement Class (Microsoft.Web.Administration)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.administration.configurationelement?redirectedfrom=MSDN&view=iis-dotnet)

## 4. site

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

- [BindingCollection.RemoveAt(Int32) Method (Microsoft.Web.Administration)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.administration.bindingcollection.removeat?view=iis-dotnet)

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




// Adding a duplicate binding throws an error.
if (siteToModify != null)
{
    newbindinginformation = "*:448:TestingSite";
    try
    {
        // Add this binding. It does not already exist.
        siteToModify.Bindings.Add(newbindinginformation, newcertificateHash, newcertificateStoreName);
    }
    catch
    {
        // Remove this binding. It already exists.
        foreach (Microsoft.Web.Administration.Binding binding in siteToModify.Bindings)
        {
            if (binding.BindingInformation == newbindinginformation)
            {
                bindingIndex = siteToModify.Bindings.IndexOf(binding);
            }
        }
        if (bindingIndex != -1)
        {
            siteToModify.Bindings.RemoveAt(bindingIndex);
        }
    }
    // Update information and save in Administration.config file.
    ManagementUnit.Update();
}
```

### 5. PhysicalPath

```c#
var SitesLook = serverManager.Sites.Where(a => a.Name == "Default Web Site").ToList();
var site1 = SitesLook[0];
var Path1 = site1.Applications[0].VirtualDirectories[0].PhysicalPath;


```

### 5. siteName

```c#
var siteName = System.Web.Hosting.HostingEnvironment.ApplicationHost.GetSiteName();
```

### 6. Bindings check

```c#
var bindings = site.Bindings.ToList();
var bindingIndex = bindings.FindIndex(it => it.Protocol == "http" && it.Host== "cdn.tupian.com");
```

## 5. Server Certificate

- [Internet Information Services (IIS) Server Certificate Installation Instructions - WCF](https://docs.microsoft.com/en-us/dotnet/framework/wcf/samples/iis-server-certificate-installation-instructions)
- [Get list of certificates from the certificate store in C#](https://stackoverflow.com/questions/1205295/get-list-of-certificates-from-the-certificate-store-in-c-sharp)
- [X509Certificate2UI Class (System.Security.Cryptography.X509Certificates)](https://docs.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.x509certificate2ui?redirectedfrom=MSDN&view=dotnet-plat-ext-3.1)
- [Install a certificate in IIS via C# : The Official Microsoft IIS Forums](https://forums.iis.net/t/1163325.aspx)
- [HTTPS and X509 certificates in .NET Part 4: working with certificates in code](https://dotnetcodr.com/2015/06/08/https-and-x509-certificates-in-net-part-4-working-with-certificates-in-code/)

```c#
X509Certificate2 certificate = new X509Certificate2(@"C:\TestProjects\Certificates\Certificates\RootCert.cer");

string expirationDate = certificate.GetExpirationDateString();
string issuer = certificate.Issuer;
string effectiveDateString = certificate.GetEffectiveDateString();
string nameInfo = certificate.GetNameInfo(X509NameType.SimpleName, true);
bool hasPrivateKey = certificate.HasPrivateKey;

Debug.WriteLine(expirationDate);
Debug.WriteLine(issuer);
Debug.WriteLine(effectiveDateString);
Debug.WriteLine(nameInfo);
Debug.WriteLine(hasPrivateKey);



string certPath = @"C:\TEST\something.cz.pfx";
string certPass = "heslo";

// Create a collection object and populate it using the PFX file
X509Certificate2 certifikat = new X509Certificate2(certPath,certPass,X509KeyStorageFlags.Exportable);

X509Store store = new X509Store("Webhosting", StoreLocation.LocalMachine);

store.Open(OpenFlags.MaxAllowed);
store.Add(certifikat);

using (ServerManager serverManager = new ServerManager())
{
Site site = serverManager.Sites["buyticket.cz"];

if (site != null)
{
site.Bindings.Add("*:443:", certifikat.GetCertHash(), store.Name);
}

}
store.Close();
```
