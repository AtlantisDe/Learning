# async

- async 异步
- 像上面这种简单的方式一样，我们可以在 C#代码中使用 async 和 await 关键字来愉快的进行异步编程了。
- [C# 中的 Async 和 Await 的用法详解 - 依乐祝 - 博客园](https://www.cnblogs.com/yilezhu/p/10555849.html)
- [探索 c#之 Async、Await 剖析 - 蘑菇先生 - 博客园](https://www.cnblogs.com/mushroom/p/4575417.html)
- [Asynchronous programming in C#](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/async/)
- [async/await 异步编程 - teroy - 博客园](https://www.cnblogs.com/teroy/p/4015461.html)
- [53. Async void VS Task](https://blog.csdn.net/huiwuhuiwu/article/details/53590311)
- [异步编程（async&amp;await） (推荐阅读)- Jonins - 博客园](https://www.cnblogs.com/jonins/p/9558275.html)

## 常用

- 如果不用 await 编译器将以同步方法运行 编译器只会给出警告 但是不会报错

### 0. 获取代码

```c#
public async static void SaveDocumentAsync()
{
    await Task.Run(() =>
    {
        return;
    });

}


public async static Task<Site> SiteGetInstance(this Uri uri)
{
    var site =   await Task.Run(() =>
    {
        var root = new Site(uri);
        return root;
    });
    return site;
}

```

### 1. Demo 代码

```c#
// 　再来看一下 await 关键字。await必须用来修饰Task或Task<TResult>，而且只能出现在已经用async关键字修饰的异步方法中。
// 使用异步编程避免TASK.WAIT或TAST.RESULT
// 尽量异步执行I/O操作
// Task<TResult>的实例对象有一个Result属性，当在Main方法中调用task.Result的时候，将等待task执行完毕并得到返回值，这里的效果跟调用task.Wait()是一样的，只是多了一个返回值。
async void go_demo()
{
    await Task<bool>.Run(() =>
        {
        });
}
 // 正确的例子
Task task = DoWork();
await task;

// 不建议使用的例子
Task task = DoWork();
task.Wait();
// Async方式，使用Async标记Async1为异步方法，用Await标记GetRequestStreamAsync表示方法内需要耗时的操作。主线程碰到await时会立即返回，继续以非阻塞形式执行主线程下面的逻辑。当await耗时操作完成时，继续执行Async1下面的逻辑
static async void Async1()
    {
        HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://cnblogs.com/");
        await myReq.GetRequestStreamAsync();
        //to do
    }
```

### 2. Demo 代码

```c#



public async static Task<apiCreateNeiye> CreateNeiye()
{
    var root = new apiCreateNeiye();
    root.code = -1;
    root.message = "结果未知!";
    await Task.Run(() =>
    {
        try
        {
                root.code = 200;
                root.message = "新建内容页完成.";
            }
            else
            {
                root.HtmlContent = pathItem.ReadDocument();

                root.code = 1;
                root.message = "内容页已存在.";
            }

        }
        catch (Exception ex)
        {
            Console.WriteLine(string.Format("异常包: [{0}] [{1}] 异常消息:{2}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message));
            root.code = 100;
            root.message = string.Format("异常[{0}]", ex.Message);
        }
        finally
        {
        }

    });

    return root;
}
```

### 3. 操作超时

- [ASP.NET MVC 什么时候使用异步 Action - Darren Ji - 博客园](https://www.cnblogs.com/darrenji/p/4436764.html)

```c#
// 当然，异步还设计到一个操作超时，默认的是45秒，但可以通过AsyncTimeout特性来设置。
[AsyncTimeout(3000)]
public async Task<ActionResult> Index()
{

}

// 如果不想对操作超时设限。
[NoAsyncTimeout]
public async Task<ActionResult> Index()
{

}
```
