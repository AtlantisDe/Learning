# using

- [C#-using 用法详解](https://www.cnblogs.com/hejoy91/p/5518987.html)
- [using 关键字在 C#中的 3 种用法 - xiaobiexi - 博客园](https://www.cnblogs.com/xiaobiexi/p/6179127.html)

## using 关键字有两个主要用途

- (一).作为指令，用于为命名空间创建别名或导入其他命名空间中定义的类型。
- (二).作为语句，用于定义一个范围，在此范围的末尾将释放对象。

## using using 指令

- ① 允许在命名空间中使用类型，这样，您就不必在该命名空间中限定某个类型的使用：

```C#
using System.Text;
using PC.Company;
```

- ② 为命名空间或类型创建别名。

```C#
using MyCompany = PC.Company; //命名空间的别名。
using Project = PC.Company.Project; //类型的别名
```

## using 语句

- using 语句允许程序员指定使用资源的对象应当何时释放资源。using 语句中使用的对象必须实现 IDisposable 接口。此接口提供了 Dispose 方法，该方法将释放此对象的资源。

- ① 可以在 using 语句之中声明对象

```C#
Font font2 = new Font("Arial", 10.0f);
using (font2)
{
// use font2
}
```

- ② 可以在 using 语句之前声明对象

```C#
using (Font font2 = new Font("Arial", 10.0f))
{
    // use font2
}
```

- ③ 可以有多个对象与 using 语句一起使用但是必须在 using 语句内部声明这些对象

```C#
using (Font font3=new Font("Arial",10.0f), font4=new Font("Arial",10.0f))
{
    // Use font3 and font4.
}

```

## 使用规则

- ①using 只能用于实现了 IDisposable 接口的类型，禁止为不支持 IDisposable 接口的类型使用 using 语句，否则会出现编译错误；
- ②using 语句适用于清理单个非托管资源的情况，而多个非托管对象的清理最好以 try-finnaly 来实现，因为嵌套的 using 语句可能存在隐藏的 Bug。内层 using 块引发异常时，将不能释放外层 using 块的对象资源；
- ③using 语句支持初始化多个变量，但前提是这些变量的类型必须相同，例如：

```C#
using(Pen p1 = new Pen(Brushes.Black), p2 = new Pen(Brushes.Blue))
{
//
}
```

- ④ 针对初始化对个不同类型的变量时，可以都声明为 IDisposable 类型，例如

```C#
using (IDisposable font = new Font("Verdana", 12), pen = new Pen(Brushes.Black))
{
    float size = (font as Font).Size;
    Brush brush = (pen as Pen).Brush;
}
```

## using 实质

- 在程序编译阶段，编译器会自动将 using 语句生成为 try-finally 语句，并在 finally 块中调用对象的 Dispose 方法，来清理资源。所以，using 语句等效于 try-finally 语句，例如：

```C#
Font f2 = new Font("Arial", 10, FontStyle.Bold);
try
{
//执行文本绘制操作
}
finally
{
if (f2 != null) ((IDisposable)f2).Dispose();
}
```
