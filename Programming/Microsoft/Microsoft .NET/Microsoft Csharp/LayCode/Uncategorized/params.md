# params

- [C# params 传递多个参数 - 每天进步多一点 - 博客园](https://www.cnblogs.com/lgx5/p/6890695.html)

## params 传递多个参数

```c#
 static void Main(string[] args)
　　   {
　　      Sum(1,2,"a");
　　      Console.ReadKey();
　　   }
```

```c#
static void Sum(params object[] numStack)
　　  {
　　      for (int i = 0; i < numStack.Length; i++)
　　      {
　　          Console.WriteLine(numStack[i]);
　　      }
　 　  }
```
