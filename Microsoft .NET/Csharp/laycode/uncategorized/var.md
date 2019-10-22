# C# var

- [C#中的隐式类型 var——详细示例解析 - Vibin - 博客园](https://www.cnblogs.com/0weibin/p/3952407.html)

## 可以用匿名类初始化

```c#
 var person = new { Age = 18, Name = "Kobe" };//正确
 //匿名类中的属性一定要赋初始值，否则报错
 var person = new { Age, Name };//报错：当前上下文中不存在"Age" 当前上下文中不存在"Name"
```
