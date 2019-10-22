# Using Asynchronous Methods in ASP.NET MVC 4

- [Using Asynchronous Methods in ASP.NET MVC 4](https://docs.microsoft.com/en-us/aspnet/mvc/overview/performance/using-asynchronous-methods-in-aspnet-mvc-4)
- [ASP.NET sync over async（异步中同步，什么鬼？）](https://www.cnblogs.com/xishuai/p/asp-net-sync-over-async.html)

```c#
1. 异步调用使用 .Result，同步调用使用 .Result
2. 异步调用使用 await，同步调用使用 Task.Run
3. 异步调用使用 await，同步调用使用 .Result
4. 异步调用使用 Task.Run，同步调用使用 .Result
5. 异步调用使用 await .ConfigureAwait(true)，同步调用使用 .Result
6. 异步调用使用 await .ConfigureAwait(false)，同步调用使用 .Result
7. 异步调用使用 await，异步调用使用 await
8. 测试总结


先梳理一下测试结果：

异步调用使用 .Result，同步调用使用 .Result：通过，始终一个线程。
异步调用使用 await，同步调用使用 Task.Run：通过，三个线程，请求开始和结束为相同线程。
异步调用使用 await，同步调用使用 .Result：卡死，线程阻塞。
异步调用使用 Task.Run，同步调用使用 .Result：卡死，线程阻塞。
异步调用使用 await .ConfigureAwait(true)，同步调用使用 .Result：卡死，线程阻塞。
异步调用使用 await .ConfigureAwait(false)，同步调用使用 .Result：通过，两个线程，await 执行为单独一个线程。
异步调用使用 await，异步调用使用 await：通过，两个线程，请求开始和结束为不同线程。
```

## 常见卡死现象请参考第一个链接文字很详细

```c#
简单总结：和上面两种情况一样，页面也是卡死状态，它的效果和第三种完全一样，ManagedThreadId3 都没有输出的。
简单总结：和第五种情况形成对比，仅仅只是把 ConfigureAwait 参数设置为 false，结果却完全不同。
```
