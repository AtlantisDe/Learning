# dynamic 常见问题

- [https://blog.csdn.net/qq_35872172/article/details/93598060](https://blog.csdn.net/qq_35872172/article/details/93598060)
- [关于异常 Microsoft.CSharp.RuntimeBinder.RuntimeBinderException - 左正 - 博客园](https://www.cnblogs.com/soundcode/p/6895434.html)
- [C# ‘dynamic’ cannot access properties from anonymous types declared in another assembly](https://stackoverflow.com/questions/2630370/c-sharp-dynamic-cannot-access-properties-from-anonymous-types-declared-in-anot)
- [Microsoft.CSharp.RuntimeBinder.RuntimeBinderException-վ����Ѷ����](http://www.west999.com/info/html/wangluobiancheng/DotNetBianCheng/20180622/4217902.html)
- [C# 4.0 不要跨程序集用 dynamic 指向匿名类型 （转载） - PowerCoder - 博客园](https://www.cnblogs.com/OpenCoder/p/6628363.html)
- [C#4.0 新增功能 01 动态绑定 （dynamic 类型）](https://article.itxueyuan.com/l9O48m)
- [当 InternalsVisibleToAttribute 特性遭遇&quot;强签名&quot; - Artech - 博客园](https://www.cnblogs.com/artech/archive/2010/10/06/1844721.html)
- [记 dynamic 的一个小坑 -- RuntimeBinderException：“object”未包含“xxx”的定义 - feiyun0112 - 博客园](https://www.cnblogs.com/feiyun0112/p/4002291.html)
- [C#动态对象(dynamic)示例(实现方法和属性的动态) - 杨浪 - 博客园](https://www.cnblogs.com/yanglang/p/6890733.html)
- [C# Dynamic 关键字之:调用属性、方法、字段的实现方法](https://www.jb51.net/article/36780.htm)
- [C#笔记---动态类(Dynamic)应用 - FrankZC - 博客园](https://www.cnblogs.com/FourLeafCloverZc/p/4348722.html)
- [C# 4.0 特性： dynamic 和 ExpandoObject](https://blog.csdn.net/ghj1976/article/details/5099907)

```c#
引起这种异常的错误是因为匿名类型是不能跨程序集（assembly）的，第一种解决办法是使用 Expando ，第二个办法是在源程序集的AssemblyInfo.cs中加入：

[assembly: InternalsVisibleTo("NameSpace1.SubNameSpace1")]

原因:

　　匿名类型是internal级别的。

“当用dynamic在某个程序集中定义动态类型后，然后使用匿名类型对象对其赋值，再然后在另一个程序集访问这个动态类型的匿名对象的属性就会发生这个异常；在同一个程序集中访问中没有发现问题。”

问题到这里就非常清楚了，当通过dynamic访问可见性在当前上下文不可见的成员的时候，就会引发这个异常。

那么为什么匿名类型一定会出问题呢？这是因为C#的编译器总是会将匿名类型编译成internal的。这就使得匿名类型在跨程序集透过dynamic访问的时候，就一定会出这个问题了。
```

## 研究

### 1. Demo 代码研究一 引发异常 适合单函数内使用 解决方案 另找代替方案比如 安全集合类

```c#
    public class DemoDynamicClass
    {
        public string guid { get; set; }
        public dynamic myObj = new ExpandoObject();

        public bool Set()
        {
            myObj.aa = 888;
            return true;
        }

        public object GetObj()
        {
            return myObj.aa;
        }
    }

    static class DemoDynamic
    {
        public static dynamic myObj = new ExpandoObject();
        public static bool Set()
        {

            myObj.aa = 888;
            return true;
        }
        public static object GetObj()
        {
            return myObj.aa;
        }

    }
    static class TestDynamic
    {
        public static bool Read(dynamic myObj)
        {

            Console.WriteLine(myObj.aa);
            return true;
        }
    }


    // 运行

       var demoDynamicClass = new DemoDynamicClass();

            demoDynamicClass.Set();

            demoDynamicClass.GetObj();

            DemoDynamic.Set();
            var obj1 = DemoDynamic.GetObj();

            TestDynamic.Read(DemoDynamic.myObj);

// 引发异常后得出结论

// 比较合适在单个方法函数流程内便捷使用

```
