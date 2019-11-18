# C# Task

- [Task Class (System.Threading.Tasks)](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.task?view=netframework-4.8)
- [C#多线程编程系列（五）- 使用任务并行库 - InCerry - 博客园](https://www.cnblogs.com/InCerry/p/9450493.html)

## 0. Task 异步获取返回值如 String 类型例子

- 尽量用 await 不要用 task.wait()

```c#
return await Task.Run(() =>
{
    return true;
});


Task<string> HtmlContent;
HtmlContent = Task.Run(() => { return "模板获取异常"; });


var a = Task<bool>.Run(() =>
{

    return true;
});
a.Wait();
return a.Result;

Task<string> ReadAsStringAsync()

var contxt = rst.Content;
var aaa = contxt.ReadAsStringAsync();
var ccc = aaa.Result;


var Down = new BrowserFetcher().DownloadAsync(BrowserFetcher.DefaultRevision);
var Result = Down.Result;

```

## 1. Task 集合 使用组合器

```c#
public async static Task<bool> RandomCreateCompile()
{
    var root = await Task.Run(() =>
    {
        return true;
    });
    return root;
}

var tasks = new List<Task>();
tasks.Add(templateEngine.TitleCompile());
Task.WaitAll(tasks.ToArray());

Task<int> task1 = GetResult(10);
Task<int> task2 = GetResult(20);
await Task.WhenAll(task1, task2);
Console.WriteLine($"结果分别为：{task1.Result}和{task2.Result}");


var tasks = new List<Task>
{
    Task.Run(() => { return "模板获取异常"; }),
    Task.Run(() => { return "模板获取异常"; }),
    Task.Run(() => { return "模板获取异常"; }),
    Task.Run(() => { return true; })
};

```

## 2. 可等待 超时

```c#
using (var client = new Websocket.Client.WebsocketClient(url))
{
    client.ReconnectTimeoutMs = (int)TimeSpan.FromSeconds(30).TotalMilliseconds;
    var c = client.Start();
    c.Wait(5000);
    Task.Run(() => client.Send("{ message }"));
}
```

## 3. Task For 并发

```c#
for (int i = 0; i < list.Count; i++)
{

    Task<bool>.Run(() =>
    {
        go_exe_WaitForExit();
        return true;
    });

}
```

## 4. 安全线程并发测试

```c#
            var tasks = new List<Task>
            {

                Task.Run(() => {

                                Parallel.For(0, 10000000, new ParallelOptions() { MaxDegreeOfParallelism = 10000 }, (i, loopState) =>
                                {
                                    //DemoEngine.Engine.Analysis.Common.Static.WebTraffic.AnalysisItem.RequestTotalTimes += 1;

                                    lock (ht.SyncRoot)
                                    {
                                        //var aaa = (Aleseocore.Module.Log.Entity.AnalysisItem)ht["aa"];
                                        var aaa = WebTrafficGlobal;
                                        aaa.RequestTotalTimes += 1;
                                        aaa.ResponseTotalAmount += 2;
                                        //aaa.ResponseTotalAmountStr = aaa.ResponseTotalAmount.ToUnitStr();
                                    }
                                });


                    return true; }),

                                Task.Run(() => {

                                Parallel.For(0, 10000000, new ParallelOptions() { MaxDegreeOfParallelism = 10000 }, (i, loopState) =>
                                {

                                    lock (ht.SyncRoot)
                                    {
                                        var aaa = WebTrafficBaidu;
                                        aaa.RequestTotalTimes += 1;
                                        aaa.ResponseTotalAmount += 2;
                                        //aaa.ResponseTotalAmountStr = aaa.ResponseTotalAmount.ToUnitStr();
                                    }
                                });


                    return true; })




            };

            Task.WaitAll(tasks.ToArray());
```

## 5. void 返回值

```c#


Task.Run(() =>
{

});



Task<bool>.Run(() =>
{
    Thread oThread = new Thread(delegate ()
    {



    });
    oThread.IsBackground = true;
    oThread.Start();


    return true;
}).Wait();

```

## 6. bool 返回值

```c#
        public async static Task<bool> JIeya(string zipPath, string extractFolderPath)
        {

            return await Task<bool>.Run(() =>
           {
               try
               {
                   ZipArchive zipArchive = ZipFile.OpenRead(zipPath);
                   foreach (ZipArchiveEntry entry in zipArchive.Entries)
                   {
                       try
                       {
                           var extractFilePath = extractFolderPath + @"\" + entry.FullName;
                       }
                       catch (Exception ex)
                       {


                       }
                   }
                   zipArchive.Dispose();
               }
               catch (Exception ex)
               {
                   Console.WriteLine(string.Format("异常包: [{0}] [{1}] 异常消息:{2}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message));



               }
               finally
               {
               }

               return true;

           });

        }

```

## 7. 单个方法中使用 Task,其它线程中不会被阻塞的 Demo

```c#
//Demo 无阻塞
public static bool Passport()
{
    var a = Task<bool>.Run(() =>
    {
        return false;
    });
    a.Wait();
    return a.Result;

}
```
