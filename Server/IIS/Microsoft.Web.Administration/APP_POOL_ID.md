# APP_POOL_ID

- [asp.net 如何获取当前程序的应用程序池名称](https://zhidao.baidu.com/question/2273101091039572468.html)

## 代码

### asp.net 如何获取当前程序的应用程序池名称

```c#
string name = Request.ServerVariables["APP_POOL_ID"];
    if (String.IsNullOrEmpty(name))
       name = Environment.GetEnvironmentVariable("APP_POOL_ID", EnvironmentVariableTarget.Process);
```

### IIS 管理

```c#
// 　　建立一个站点（Site）


ServerManageriisManager=new ServerManager();
iisManager.Sites.Add("NewSite","http","*:8080:","d:MySite");
iisManager.Update();


// 　　将一个应用程序（Application）添加到一个站点


ServerManageriisManager=new ServerManager();
iisManager.Sites["NewSite"].Applications.Add("/Sales","d:MyApp");
iisManager.Update();


// 　　建立一个虚拟目录（Virtual Directory）


ServerManageriisManager=new ServerManager();
Applicationapp=iisManager.Sites["NewSite"].Applications["/Sales"];
app.VirtualDirectories.Add("/VDir","d:MyVDir");
iisManager.Update();


// 　　运行时控制：停止一个站点


ServerManageriisManager=new ServerManager();
iisManager.Sites["NewSite"].Stop();


// 　　运行时控制：回收应用程序池（Recyciling an Application Pool）


ServerManageriisManager=new ServerManager();
iisManager.ApplicationPools["DefaultAppPool"].Recycle();


// 　　运行时控制：得到当前正在处理的请求


ServerManageriisManager=new ServerManager();
foreach(WorkerProcessw3wpiniisManager.WorkerProcesses)
{
　　Console.WriteLine("W3WP({0})",w3wp.ProcessId);
　　foreach(Requestrequestinw3wp.GetRequests(0))
　　{
　　　　Console.WriteLine("{0}-{1},{2},{3}",
　　　　request.Url,
　　　　request.ClientIPAddr,
　　　　request.TimeElapsed,
　　　　request.TimeInState);
　　}
}


// Adding a Default Binding <binding>
 using (ServerManager serverManager = new ServerManager())
      {
         Configuration config = serverManager.GetApplicationHostConfiguration();
         ConfigurationSection sitesSection = config.GetSection("system.applicationHost/sites");
         ConfigurationElement siteDefaultsElement = sitesSection.GetChildElement("siteDefaults");

         ConfigurationElementCollection bindingsCollection = siteDefaultsElement.GetCollection("bindings");
         ConfigurationElement bindingElement = bindingsCollection.CreateElement("binding");
         bindingElement["protocol"] = @"http";
         bindingElement["bindingInformation"] = @"127.0.0.1:8080:";
         bindingsCollection.Add(bindingElement);

         serverManager.CommitChanges();
      }
```
