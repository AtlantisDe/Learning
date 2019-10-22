# List

- List 的实例可不是线程安全的，这个 MSDN 写的清清楚楚明明白白。自己处理同步去。

## 1. wiki

- [C# List 集合 where 的用法 - Fly_bokeyuan - 博客园](https://www.cnblogs.com/-Fly/p/7765517.html)
- [将 list 集合，元素随机打乱 - \_小豪豪 - 博客园](https://www.cnblogs.com/remember-forget/p/9815527.html)
- [C# list 多线程访问，有写入，读取，加锁后，返回的 list 后，不也是非线程安全的](https://zhidao.baidu.com/question/1926201084657737907.html)
- [C#如何遍历删除 List 集合中的数据 - 王佳宇 - CSDN 博客](https://blog.csdn.net/weixin_40165163/article/details/84144075)

## 2. 用法

### 1. List 集合 where 的用法

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

### 2. 集合已修改；可能无法执行枚举操作

- [[C#]集合已修改；可能无法执行枚举操作 - wolfy - 博客园](https://www.cnblogs.com/wolf-sun/p/5721457.html)

### 3. 多线程之 List 的线程安全问题

- [C# 多线程之 List 的线程安全问题 - 郑小超 - 博客园](https://www.cnblogs.com/GreenLeaves/p/10092128.html)

```c#
 static object lockObj = new object();

 lock (lockObj)
  {
      list.Add(i);
  }
```

### 4. Thread Parallel 加锁线程安全 (一定要 加锁 加锁 加锁 加锁 不然 add 数据肯定会丢失 )

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

### 5. List 排序/各种用法与比较

- 第 2 种排序方法，使用 Lambda 表达式来排序 目测排序有这 3 种方法，个人觉得还是 Lambda 表达式使用得方便。
- -如果要降序排序，也很简单，只需要在前面加一个负号
- 分隔符
- [Getting Title at 36:02](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1.sort?view=netframework-4.8)
- [C# List 排序各种用法与比较 - alun-chen - 博客园](https://www.cnblogs.com/alunchen/p/5895048.html)
- [C# List.sort 排序详解(多权重,升序降序) - HONT - 博客园](https://www.cnblogs.com/hont/p/4375635.html)
- [C# List 排序总结 - 寂寞的博客 - CSDN 博客](https://blog.csdn.net/jimo_lonely/article/details/51711821)

```c#

listAll.Sort();
// 方法一：
List<int> list = new List<int>();
list.Sort();// 升序排序
list.Reverse();// 反转顺序

// 使用lambda表达式，在前面加个负号就是降序了
List<int> list= new List<int>(){5,1,22,11,4};
list.Sort((x, y) => x.CompareTo(y));//升序
list.Sort((x, y) => -x.CompareTo(y));//降序

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

### 6. 去掉 List 重复元素的方法

- [C# 去掉 List 重复元素的方法 - 天才卧龙 - 博客园](https://www.cnblogs.com/chenwolong/p/list.html)

```c#
// 测试数据
List<string> li1 = new List<string> { "8", "8", "9", "9" ,"0","9"};
List<string> li2 = new List<string> { "张三", "张三", "李四", "张三", "王五", "李四" };
List<string> li3 = new List<string> { "A", "A", "C", "A", "C", "D" };
List<string> li4 = new List<string> { "12", "18", "19", "19", "10", "19" };
```

#### 1. 方法一 与 其它 5 种解决方案请参考上面这个链接

```c#
HashSet<string> hs = new HashSet<string>(li1); //此时已经去掉重复的数据保存在hashset中
```

### 7. 中 list 的 count 方法计算满足条件的个数

- [c#中 list 的 count 方法计算满足条件的个数](https://zhidao.baidu.com/question/1238273045268654059.html)

```c#
bool Predicate(string item) {
    return item == "北京";
}

//基于委托的写法
List<string> tmp=new List<string>();
Func<string, bool> fun = new Func<string, bool>(Predicate);
int count = tmp.Count(fun);

//基于匿名函数的写法
int count = tmp.Count(delegate(string item) { return item == "北京"; });

//基于lambda表达式的写法
int count = tmp.Count(s=>s=="北京");

```
