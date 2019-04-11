# C# Timer

- [[转][C#].NET中的三种Timer的区别和用法 - 米斯特唐 - 博客园](https://www.cnblogs.com/xiaoheihei/p/10021264.html)

## 复制

```c#
static void Main()
{
　Timer t = new Timer(Test,null,0,1000);
　Console.ReadLine();
}
public static void Test(object o)
{
　Console.WriteLine("nihao");
　GC.Collect();
//  强制对所有代进行即时垃圾回收。
}

```