# List

- List 的实例可不是线程安全的，这个 MSDN 写的清清楚楚明明白白。自己处理同步去。

## wiki

- [C# List 集合 where 的用法 - Fly_bokeyuan - 博客园](https://www.cnblogs.com/-Fly/p/7765517.html)
- [将 list 集合，元素随机打乱 - \_小豪豪 - 博客园](https://www.cnblogs.com/remember-forget/p/9815527.html)
- [C# list 多线程访问，有写入，读取，加锁后，返回的 list 后，不也是非线程安全的](https://zhidao.baidu.com/question/1926201084657737907.html)
- [C#如何遍历删除 List 集合中的数据 - 王佳宇 - CSDN 博客](https://blog.csdn.net/weixin_40165163/article/details/84144075)

## 用法

### List 集合 where 的用法

- 1、单个条件

```c#
//Name是传入的参数值
   List<Test> list = new List<Test>();
   list = list.Where(a => a.testName.Contains(Name)).ToList();
```

- 2、多个条件合并查询

```c#
//Number_Name是传入的参数值
  List<Test> list = new List<Test>();
  list = list.Where(a => a.testNumber.Contains(Number_Name) || a.testName.Contains(Number_Name)).ToList();
  //
  List<Test> list = new List<Test>();
  list = list.Where(a => a.testNumber.Contains(Number_Name) && a.testName.Contains(Number_Name)).ToList();
```

### 集合已修改；可能无法执行枚举操作

- [[C#]集合已修改；可能无法执行枚举操作 - wolfy - 博客园](https://www.cnblogs.com/wolf-sun/p/5721457.html)

### 多线程之 List 的线程安全问题

- [C# 多线程之 List 的线程安全问题 - 郑小超 - 博客园](https://www.cnblogs.com/GreenLeaves/p/10092128.html)

```c#
 static object lockObj = new object();

 lock (lockObj)
  {
      list.Add(i);
  }
```

### Thread Parallel 加锁线程安全 (一定要 加锁 加锁 加锁 加锁 不然 add 数据肯定会丢失 )

```c#
//任务队列DEMO
object lockObj = new object();
List<string> lst = new List<string>();
Thread Th1 = new Thread(delegate ()
{
    Parallel.For(0, 10,new ParallelOptions() { MaxDegreeOfParallelism = 100 },(i, loopState) =>
    {
        lock (lockObj)                      {
            lst.Add(System.Guid.NewGuid().ToString("N"));
            Console.WriteLine(string.Format("添加后总数:{0}", lst.Count));
        }
    });



});
Th1.IsBackground = true;
Th1.Start();


Thread Th2 = new Thread(delegate ()
{
    while (true)
    {
        lock (lockObj)
        {
            if (lst.Count > 0)
            {
                lst.Remove(lst[lst.Count - 1]);
                Console.WriteLine(string.Format("读取删除后总数:{0}", lst.Count));
            }
        }
    }
});
Th2.IsBackground = true;
Th2.Start();

```

### C# List 排序各种用法与比较

- 第 2 种排序方法，使用 Lambda 表达式来排序 目测排序有这 3 种方法，个人觉得还是 Lambda 表达式使用得方便。
- -如果要降序排序，也很简单，只需要在前面加一个负号
- 分隔符
- [C# List 排序各种用法与比较 - alun-chen - 博客园](https://www.cnblogs.com/alunchen/p/5895048.html)
- [C# List.sort 排序详解(多权重,升序降序) - HONT - 博客园](https://www.cnblogs.com/hont/p/4375635.html)

```c#
peoples.Sort( (a, b) => a.age.CompareTo(b.age) );

List<int> tmp = new List<int>(){5,1,22,11,4};
tmp.Sort((x, y) => -x.CompareTo(y));
Console.WriteLine(tmp);
//22,11,5,4,1
```

- 多权重比较

```c#
List<Tuple<int, int>> tmp = new List<Tuple<int, int>>()
{
    new Tuple<int,int>(2,1),
    new Tuple<int,int>(53,1),
    new Tuple<int,int>(12,1),
    new Tuple<int,int>(22,3),
    new Tuple<int,int>(1,2),
};
tmp.Sort((x, y) => -(x.Item1.CompareTo(y.Item1) + x.Item2.CompareTo(y.Item2) * 2));
Console.WriteLine(tmp);
//22,3
//1,2
//53,1
//12,1
//2,1
//Tip: Item2 > Item1
```
