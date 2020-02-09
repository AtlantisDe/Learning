# Delay

- [C# 之 代码实现延时 - Crazy Xu - 博客园](https://www.cnblogs.com/qiudongxu/p/11358358.html)

## 常用

```c#
#region 第一种形式
var task_1 = Task.Run(async delegate
{
await Task.Delay(3000);
Console.WriteLine("3秒后执行，方式一 输出语句...");
return "异步执行result"; //可以得到一个返回值(int,bool,string都试了)
});
#endregion
```
