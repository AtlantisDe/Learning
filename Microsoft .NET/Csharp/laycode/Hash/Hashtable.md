# Hashtable

- 线程安全推荐使用
- [C#中 HashTable 的用法 - 璇狼之风 - 博客园](https://www.cnblogs.com/houlin/p/3512480.html)

## DEMO

### 多线程操作错误示例

```c#
//任务队列DEMO

Hashtable ht = new Hashtable();

Thread Th1 = new Thread(delegate ()
{

    Parallel.For(0, 999999999,
                        new ParallelOptions() { MaxDegreeOfParallelism = 100 },
    (i, loopState) =>
    {
        ht.Add(System.Guid.NewGuid().ToString("N"), CsharpLazycode.Module.Laycode.words.Util.GenerateSurname());

    });



});
Th1.IsBackground = true;
Th1.Start();


Thread Th2 = new Thread(delegate ()
{
    while (true)
    {
        foreach (var item in ht)
        {
            ht.Remove(item);
        }


    }


});
Th2.IsBackground = true;
Th2.Start();
```

### 添加

```c#
root.hashtable.Add("aa", 123);
```

### 读取

```c#
 string aaa = (string)hashtable["aa"];
```
