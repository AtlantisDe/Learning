# TaskFactory

- [TaskFactory Class (System.Threading.Tasks)](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.taskfactory?view=netframework-4.8)
- [C# Task TaskFactory 设置最大并行线程数的方法](https://blog.csdn.net/yuanpan/article/details/84284614)
- [C#下如何控制并发运行的 Task 数量](https://blog.csdn.net/starfd/article/details/79711915)
- [C# Task 多任务 限制 Task 并发数量 - 秋荷雨翔 - 博客园](https://www.cnblogs.com/s0611163/p/11549685.html)
- [ParallelExtensionsExtras Tour - #7 - Additional TaskSchedulers | .NET Parallel Programming](https://devblogs.microsoft.com/pfxteam/parallelextensionsextras-tour-7-additional-taskschedulers/)

## 常用

```c#
// 结论：使用Run，点击button2时，卡了好几秒才出来结果，而使用Run2，点击button2时，立即显示结果，button2的操作本身应该耗时极少。

// 现实意义：当一批耗时任务无脑使用Task.Factory.StartNew时，另一个使用Task.Factory.StartNew的任务就无法及时响应了。
```

## TaskScheduler

- 这个 TaskScheduler 用过的应该都知道，微软开源的一个任务调度器，它的代码很简单
