# Tuple

- [Tuple 类 (System)](https://docs.microsoft.com/zh-cn/dotnet/api/system.tuple?view=netstandard-2.1)
- [c#组元(Tuple)的使用 - 天琊蓝 - 博客园](https://www.cnblogs.com/makesense/p/4368899.html)
- [详解 C# Tuple VS ValueTuple（元组类 VS 值元组） - 永远薰薰 - 博客园](https://www.cnblogs.com/lavender000/p/6916157.html)
- [Error Happened](https://www.cnblogs.com/makesense/p/4368899.html)
- [Tuple<T1,T2> Class (System)](https://docs.microsoft.com/en-us/dotnet/api/system.tuple-2?view=netframework-4.8)
- [Tuple 创建一个新二元集合](https://www.cnblogs.com/enych/p/9999770.html)

```c#
组元(Tuple)是C# 4.0引入的一个新特性，可以在.NET Framework 4.0或更高版本中使用。组元使用泛型来简化类的定义，多用于方法的返回值。在函数需要返回多个类型的时候，就不必使用out , ref等关键字了，直接定义一个Tuple类型，使用起来非常方便。
```

## 1. 常用声明

```c#
// 常用演示代码
public (string, string) MipImg(string html, bool IsMip)
ResItem.Contents = htmlImg.Item1;
ResItem.Title = htmlImg.Item2;


var primes = Tuple.Create(2, 3, 5, 7, 11, 13, 17, 19);
Console.WriteLine("Prime numbers less than 20: " +
                  "{0}, {1}, {2}, {3}, {4}, {5}, {6}, and {7}",
                  primes.Item1, primes.Item2, primes.Item3,
                  primes.Item4, primes.Item5, primes.Item6,
                  primes.Item7, primes.Rest.Item1);
// The example displays the following output:
//    Prime numbers less than 20: 2, 3, 5, 7, 11, 13, 17, and 19

List<Tuple<string, string>> tuples = new List<Tuple<string, string>>();
tuples.Add(Tuple.Create("Lorem", String.Empty));


new[]
{
Tuple.Create("Lorem", String.Empty),
Tuple.Create("ipsum", String.Empty),
Tuple.Create("dolor", String.Empty),
Tuple.Create("Other", String.Empty),
Tuple.Create("New", String.Empty),
}

public static (String, Boolean) FunDemo()
{

    return ("1", true);
}

public static Tuple<int, int> FunDemo2()
{

    return new Tuple<int, int>(1,2);
}



```

## 2. 语法糖

```c#
public (string ss, int nn) 返回两个值的方法() => ("1", 2);

        public void 调用()
        {
            (string str, int number) = 返回两个值的方法();
            //解构简写
            var (str1, number1) = 返回两个值的方法();
            //原始元组接受
            var tu = 返回两个值的方法();
        }

    public class TupleDemo
    {
        /// <summary></summary>
        public static bool DebugDemo(bool IsDebugging = false)
        {
            if (IsDebugging == false) { return false; }

            //1 member
            Tuple<int> test = new Tuple<int>(1);




            //2 member ( 1< n <8)
            Tuple<int, int> test2 = Tuple.Create<int, int>(1, 2);



            //8 member, the last member must be tuple type.
            Tuple<int, int, int, int, int, int, int, Tuple<int>> test3
                    = new Tuple<int, int, int, int, int, int, int, Tuple<int>>(1, 2, 3, 4, 5, 6, 7, new Tuple<int>(8));

            //output
            Console.WriteLine(test.Item1);
            Console.WriteLine(test2.Item1 + ", " + test2.Item2);
            Console.WriteLine(test3.Item1 + ", " + test3.Item2 + ", " + test3.Item3 + ", " + test3.Item4
                    + ", " + test3.Item5 + ", " + test3.Item6 + ", " + test3.Item7 + ", " + test3.Rest.Item1);

            var Demo = FunDemo();
            var Item1 = Demo.Item1;
            var Item2 = Demo.Item2;



            return true;
        }


        public static (String, Boolean) FunDemo()
        {

            return ("1", true);
        }

        public static Tuple<int, int> FunDemo2()
        {

            return new Tuple<int, int>(1,2);
        }



    }
```
