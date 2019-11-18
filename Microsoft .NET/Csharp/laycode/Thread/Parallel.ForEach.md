# Parallel.ForEach

- [Parallel.ForEach 使用示例 - PowerCoder - 博客园](https://www.cnblogs.com/OpenCoder/p/9802437.html)
- [C# 多线程 Parallel.ForEach 和 ForEach 效率问题研究及理解](https://blog.csdn.net/li315171406/article/details/78450534)

## 1. 常用

```c#
Parallel.ForEach(loopBlockItems, item =>
{

});

var numbersToShow = new List<int>() { 1, 2, 3, 4, 5, 6 };

Parallel.ForEach(numbersToShow, number =>
{
    Thread.Sleep(3000);

    Console.WriteLine($"Parallel ForEach is now displaying number: {number.ToString()}");
});
Console.WriteLine();
Console.WriteLine();

Console.WriteLine("Parallel ForEach finished.");
Console.WriteLine("Press key contiune...");
Console.ReadKey();
```

## 2. 限制

```c#
 Parallel.ForEach(MachineworkerExtenions.Warehouse.DicMainaledbwords, new ParallelOptions { MaxDegreeOfParallelism = 4 }, webpage =>
{


});

Parallel.ForEach(
    listOfWebpages,
    new ParallelOptions { MaxDegreeOfParallelism = 4 },
    webpage => { Download(webpage); }
);

Parallel.ForEach(
    listOfwebpages,
    new ParallelOptions{MaxDegreeOfParallelism=2},
    webpage => {Download(webpage);});
```
