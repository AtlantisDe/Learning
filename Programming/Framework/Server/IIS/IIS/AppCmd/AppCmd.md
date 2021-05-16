# AppCmd

- [Getting Started with AppCmd.exe](https://docs.microsoft.com/en-us/iis/get-started/getting-started-with-iis/getting-started-with-appcmdexe)
- [Getting Started with AppCmd.exe](https://docs.microsoft.com/en-us/iis/get-started/getting-started-with-iis/getting-started-with-appcmdexe)
- [IIS AppCmd Quick Reference](https://blogs.msdn.microsoft.com/mikezh/2012/04/23/iis-appcmd-quick-reference/)
- [https://blog.csdn.net/dd_zhouqian/article/details/16116999](https://blog.csdn.net/dd_zhouqian/article/details/16116999)
- [HTTP Error 403](http://toastergremlin.com/?p=308)
- [Manage IIS Using Appcmd](https://www.c-sharpcorner.com/blogs/manage-iis-using-appcmd)
- [How to use appcmd.exe to add a new binding for HTTPS](https://stackoverflow.com/questions/41369099/how-to-use-appcmd-exe-to-add-a-new-binding-for-https)

## 常用

- [Binding &lt;binding&gt;](https://docs.microsoft.com/en-us/iis/configuration/system.applicationhost/sites/site/bindings/binding)

```c#
cd C:\Windows\System32\Inetsrv\

appcmd list wp
%SYSTEMROOT%\System32\inetsrv\appcmd list wp

%systemroot%\system32\inetsrv\APPCMD list sites

%systemroot%\system32\inetsrv\APPCMD list site "Default Web Site"

appcmd.exe set config -section:system.applicationHost/sites /siteDefaults.bindings.[protocol='http',bindingInformation='*:8080:contoso.com'].bindingInformation:"127.0.0.1:8080:" /commit:apphost

%SYSTEMROOT%\System32\inetsrv\appcmd.exe set config -section:system.applicationHost/sites /siteDefaults.bindings.[protocol='http',bindingInformation='*:8080:contoso.com'].bindingInformation:"127.0.0.1:8080:" /commit:apphost


Protocol = "http", BindingInformation = "*:8081:www.example.com"
Protocol = "http", BindingInformation = "*:80:www.baidu.com"

appcmd set site /site.name:"SiteNameInIIS" /+bindings.[protocol='https',bindingInformation='IP.Add.re.ss:443:www.example.com']
appcmd set site /site.name:"Default Web Site" /+bindings.[protocol='https',bindingInformation='IP.Add.re.ss:443:www.example.com']
appcmd set site /site.name:"Default Web Site" /+bindings.[protocol='http',bindingInformation='*:8081:www.example.com']

appcmd set site /site.name:test /+bindings.[protocol='http',bindingInformation='*:80:mitest']
%SYSTEMROOT%\System32\inetsrv\appcmd.exe set site /site.name:test /+bindings.[protocol='http',bindingInformation='*:80:mitest']
%SYSTEMROOT%\System32\inetsrv\appcmd.exe set site /site.name:'Default Web Site' /+bindings.[protocol='http',bindingInformation='*:80:mitest']


appcmd set site /site.name:NAME_SITE_IIS /+bindings.
[protocol='https',bindingInformation=':443:yourdomain.com.br']

appcmd.exe set site /site.name:Contoso /+bindings.[protocol='http',bindingInformation='192.168.0.1:80:www.contoso.com']
appcmd.exe set site /site.name:Contoso /+bindings.[protocol='https',bindingInformation='*:443:']

appcmd.exe set config -section:system.applicationHost/sites /+"[name='Contoso'].bindings.[protocol='http',bindingInformation='192.168.0.1:80:www.contoso.com']" /commit:apphost
appcmd.exe set config -section:system.applicationHost/sites /+"[name='Contoso'].bindings.[protocol='https',bindingInformation='*:443:']" /commit:apphost
```
