# Tuple

- [Error Happened](https://www.cnblogs.com/makesense/p/4368899.html)
- [Tuple<T1,T2> Class (System)](https://docs.microsoft.com/en-us/dotnet/api/system.tuple-2?view=netframework-4.8)
- [Tuple 创建一个新二元集合](https://www.cnblogs.com/enych/p/9999770.html)

```c#
组元(Tuple)是C# 4.0引入的一个新特性，可以在.NET Framework 4.0或更高版本中使用。组元使用泛型来简化类的定义，多用于方法的返回值。在函数需要返回多个类型的时候，就不必使用out , ref等关键字了，直接定义一个Tuple类型，使用起来非常方便。
```

## 常用声明

```c#
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
```

## 语法糖

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
```
