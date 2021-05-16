# List

- List 的实例可不是线程安全的，这个 MSDN 写的清清楚楚明明白白。自己处理同步去。

## 0. 常用

```c#
// 常用小数据去重
var FilterItems = FilterText.Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries).ToList().ToHashSet().ToList();
var Lines = TextContent.Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries);
var Lines = TextContent.Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries).ToList().ToHashSet().ToList();
var Lines = TextContent.Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries).ToList().ToHashSet().ToArray();

var list = new List<string>{ "one","two","three","four"};
int index = random.Next(list.Count);
Console.WriteLine(list[index]);



143

I usually use this little collection of extension methods:

public static class EnumerableExtension
{
    public static T PickRandom<T>(this IEnumerable<T> source)
    {
        return source.PickRandom(1).Single();
    }

    public static IEnumerable<T> PickRandom<T>(this IEnumerable<T> source, int count)
    {
        return source.Shuffle().Take(count);
    }

    public static IEnumerable<T> Shuffle<T>(this IEnumerable<T> source)
    {
        return source.OrderBy(x => Guid.NewGuid());
    }
}
For a strongly typed list, this would allow you to write:

var strings = new List<string>();
var randomString = strings.PickRandom();
If all you have is an ArrayList, you can cast it:

var strings = myArrayList.Cast<string>();
```

## 1. wiki

- [C# List 集合 where 的用法 - Fly_bokeyuan - 博客园](https://www.cnblogs.com/-Fly/p/7765517.html)
- [将 list 集合，元素随机打乱 - 小豪豪 - 博客园](https://www.cnblogs.com/remember-forget/p/9815527.html)
- [C# list 多线程访问，有写入，读取，加锁后，返回的 list 后，不也是非线程安全的](https://zhidao.baidu.com/question/1926201084657737907.html)
- [C#如何遍历删除 List 集合中的数据 - 王佳宇 - CSDN 博客](https://blog.csdn.net/weixin_40165163/article/details/84144075)
- [c# String ,String[] 和 List&lt;String&gt;之间的转换 - vijing - 博客园](https://www.cnblogs.com/vijing/p/10518851.html)
- [How to select a random element from a C# list?](https://www.tutorialspoint.com/how-to-select-a-random-element-from-a-chash-list)

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
// 默认:升序排序
// 降序:OrderByDescending


// 排序 OrderBy 需要接收排序后的变量
hs1 = hs1.OrderBy(it => it.CategoryId).ToList();
hs1 = hs1.OrderByDescending(it => it.CategoryId).ToList();

// 排序演示
List<int> tmp = new List<int>(){5,1,22,11,4};
tmp.Sort((x, y) => -x.CompareTo(y));
Console.WriteLine(tmp);
//22,11,5,4,1

// 排序演示 结构体类型 升序排序
peoples.Sort( (a, b) => a.age.CompareTo(b.age) );
tagTotalInfos.Sort((a, b) => a.ArticleCount.CompareTo(b.ArticleCount));

// 排序演示 结构体类型 降序排序
tagTotalInfos.Reverse((a, b) => a.ArticleCount.CompareTo(b.ArticleCount));

listAll.Sort();

// 方法一：
List<int> list = new List<int>();
list.Sort();// 升序排序
list.Reverse();// 反转顺序

// 使用lambda表达式，在前面加个负号就是降序了
List<int> list= new List<int>(){5,1,22,11,4};
list.Sort((x, y) => x.CompareTo(y));//升序
list.Sort((x, y) => -x.CompareTo(y));//降序



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

### 5. list 排序

- [Sorting a List&lt;int&gt;](https://stackoverflow.com/questions/3738639/sorting-a-listint/3738674)
- [How can I sort generic list DESC and ASC?](https://stackoverflow.com/questions/3062513/how-can-i-sort-generic-list-desc-and-asc)

```c#
// 默认:升序排序
// 降序:OrderByDescending


// 排序 OrderBy 需要接收排序后的变量
hs1 = hs1.OrderBy(it => it.CategoryId).ToList();
hs1 = hs1.OrderByDescending(it => it.CategoryId).ToList();

// 升序排序
hs1 = hs1.OrderBy(it => it.CategoryId).ToList();
hs2 = hs2.OrderBy(it => it.CategoryId).ToList();
hs3 = hs3.OrderBy(it => it.CategoryId).ToList();
hs4 = hs4.OrderBy(it => it.CategoryId).ToList();



var mAs = new List<double> { stockDailyKDataItem.MA5, stockDailyKDataItem.MA10, stockDailyKDataItem.MA20, stockDailyKDataItem.MA60 };
mAs.Sort();
mAs.Reverse();

// 排序
muluclassitems.OrderBy(it => it.BindingFolder.Length);

// Example code:
List<int> list = new List<int> { 5, 7, 3 };
list.Sort();
foreach (int x in list)
{
    Console.WriteLine(x);
}
// Result:
3
5
7

// With Linq
var ascendingOrder = li.OrderBy(i => i);
var descendingOrder = li.OrderByDescending(i => i);

// Without Linq

li.Sort((a, b) => a.CompareTo(b)); // ascending sort
li.Sort((a, b) => b.CompareTo(a)); // descending sort
// Note that without Linq, the list itself is being sorted. With Linq, you're getting an ordered enumerable of the list but the list itself hasn't changed. If you want to mutate the list, you would change the Linq methods to something like
li = li.OrderBy(i => i).ToList();


// Ascending: 升序
li.Sort();

// Descending: 降序
li.Sort();
li.Reverse();
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

#### 1. count 统计

```c#
HashSet<string> hs = new HashSet<string>(li1); //此时已经去掉重复的数据保存在hashset中
```

#### 2. List of objects, how do I get the sum of a property

- [C# List of objects, how do I get the sum of a property](https://stackoverflow.com/questions/4351876/c-sharp-list-of-objects-how-do-i-get-the-sum-of-a-property)

```c#
double total = myList.Sum(item => item.Amount);
double total = myList.Where(item => item.Name == "Eggs").Sum(item => item.Amount);
myPlanetsList.Select(i => i.Moons).Sum();

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
int count = stockDailyKDataItems1.Count(s => s.Index >= i - days + 1 && s.Index <= i);


```

#### 2. list 中查找元素是否存在，如果存在返回索引

```c#
//不存在：返回-1，存在：返回位置。

List<db> ls = new List<db> { };
ls.Add(new db() { id = 1, Name = "张三" });
ls.Add(new db() { id = 1, Name = "李四" });
ls.Add(new db() { id = 2, Name = "王五" });
string str = "李四";
Console.WriteLine(ls.FindIndex(x => x.Name == str));    //不存在：返回-1，存在：返回位置。
Console.ReadKey();

```

### 8. List 中 Find 的用法

```c#
var bb = duanLuoZhongpaiItems.FindAll(s => s.TextLength>20);


public class UserItem
{
    public string Name { get; set; }
    public int Age { get; set; }
}
List<UserItem> UserItems = new List<UserItem>();
UserItems.Add(new UserItem { Name = "1" });
UserItems.Add(new UserItem { Name = "2" });
UserItems.Add(new UserItem { Name = "3" });

//存在：返回 对象，不存在：返回Null。
var aa = UserItems.Find(a => a.Name.Contains("2"));
var aa = UserItems.Find(s => s.Name.Contains("2"));
var bb = UserItems.Find(s => s.Name.Contains("99"));

 //不存在：返回-1，存在：返回位置。
var cc = UserItems.FindIndex(s => s.Name.Contains("3"));
var dd = UserItems.FindIndex(s => s.Name.Contains("99"));


var index = sites.FindIndex(s => s.Path.Equals(item.FullName, StringComparison.OrdinalIgnoreCase));
if (index <= -1)
{
sb.AppendLine(item.FullName);
}

if (index == -1) { items.Add(jglhbV2Item); }


/*关键词查找 查询比如包含多次情况 查看结果*/

var userItemItems1 = new List<UserItem>();
userItemItems1.Add(new UserItem { Name = "baidu.com" });
userItemItems1.Add(new UserItem { Name = "https://baidu.com" });
userItemItems1.Add(new UserItem { Name = "https://www.baidu.com" });

/*实际会返回第一个值*/
var userItem1 = userItemItems1.Find(s => s.Name.Contains("https://") );


var userItem2 = userItemItems1.Find(s => s.Name.Contains("https://") && s.Name.Contains("www."));

```

### 9. List 中 Any 的用法

- [Coding Games and Programming Challenges to Code Better](https://www.codingame.com/playgrounds/213/using-c-linq---a-practical-overview/any-and-all)
- [C# | How to get all elements of a List that match the conditions specified by the predicate - GeeksforGeeks](https://www.geeksforgeeks.org/c-sharp-how-to-get-all-elements-of-a-list-that-match-the-conditions-specified-by-the-predicate/)

```c#



```

### 10. List 中 GroupBy 的用法

- [C# List 泛型集合中的 GroupBy 用法 FreshMan-CSDN 博客](https://blog.csdn.net/qin_zhangyongheng/article/details/45267781)

```c#

var groupInfo = orderinfo.Info.GroupBy(m => m.xx).ToList();
            foreach (var item in groupInfo)
            {
                string infotemp = item.Key;
            }

```

### 11. linq like ,linq 模糊查询

- [linq like ,linq 模糊查询 li_ser 的专栏-CSDN 博客](https://blog.csdn.net/li_ser/article/details/7724813)

```c#
 Pet[] pets = { new Pet { Name="Barley", Age=10 },
                               new Pet { Name="Boots", Age=4 },
                               new Pet { Name="Whiskers", Age=6 } };

//模糊匹配

var yy = pets.Where(pet => pet.Name.Contains("g")).ToList();

//从开头模糊匹配
var ss = pets.Where(pet => pet.Name.StartsWith("B")).ToList();

//结尾模糊匹配
var xx = pets.Where(pet => pet.Name.EndsWith("s")).ToList();

/*很有可能里面对象为null 这样查询会报错 可以改为 foreach 查询 然后添加*/
var items = sites.Where(it => it.Nodes.SiteConfig.TplName.Equals(this.T_WebsiteTplName.Text, StringComparison.OrdinalIgnoreCase)).ToList();




```

### 12. 如何遍历删除 List 集合中的数据

```c#
//通过移动下标来确保不会漏掉要删除的数据
private static void DeleteList(List<int> testList)
{
    for (int i = 0; i < testList.Count; i++)
    {
        if (testList[i].Equals(0) || testList[i].Equals(1) || testList[i].Equals(2) || testList[i].Equals(3))
        {
            Console.WriteLine("删除元素：" + testList[i]);
            testList.Remove(testList[i]);
            i--;
        }
    }
}
```

### 13. 洗牌 打乱

- [How to access random item in list?](https://stackoverflow.com/questions/2019417/how-to-access-random-item-in-list)

### 14. 非静态方法需要一个目标

```c#
// 非静态方法需要一个目标 并发线程处理上,执行List.add时候没加锁引发的问题
```
