# lambda

- [=> 运算符 - C# 参考](https://docs.microsoft.com/zh-cn/dotnet/csharp/language-reference/operators/lambda-operator)
- [C#中() =>是什么意思](https://zhidao.baidu.com/question/159054806.html)
- [C# 运算符 | 菜鸟教程](https://www.runoob.com/csharp/csharp-operators.html)
- [C#中 ()=&gt;的含义 - Sun‘刺眼的博客 - 博客园](https://www.cnblogs.com/android-blogs/p/6054178.html)
- [[2014-12-30]如何动态构造 Lambda 表达式（动态构造 Lambda 查询条件表达式）\_weixin_30409849 的博客-CSDN 博客](https://blog.csdn.net/weixin_30409849/article/details/96741221)

```c#
// 一个没有参数的方法
// 这是 .NET3.0以后的新特性 Lambda表达式 RelayCommand(() => this.AddPerson(), () => this.CanAddPerson());
//  的意思可以翻译为 RelayCommand(参数一, 参数二); 参数一 ：() => this.AddPerson() 参数二 ：() => this.CanAddPerson() () => this.AddPerson() 的意思是 一个没有参数的方法，返回 this.AddPerson() 而这个返回值的类型不用指定 系统会自动判断 同理 () => this.CanAddPerson() 就是 一个没有参数的方法返回this.CanAddPerson()
```

## 常用

```c#
()=>{}

 return await Task.Run(() =>{});




```

## 1. 动态条件 Dynamically Composing Expression Predicates

- [C# in a Nutshell - PredicateBuilder](http://www.albahari.com/nutshell/predicatebuilder.aspx)k

```c#
List<string> where = new List<string>() { "1", "2" };
            List<string> list = new List<string>() { "11", "21", "34" };

            var predicate = PredicateBuilder.New<string>();
            where.ForEach(a => predicate.Or(p => p.Contains(a)));
            list = list.Where(predicate).ToList();

```
