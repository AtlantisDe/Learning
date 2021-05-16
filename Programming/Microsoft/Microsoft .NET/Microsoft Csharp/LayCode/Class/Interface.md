# Interface

- [interface - C# Reference](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/interface)
- [C#开发命名规范总结整理 - CG919 - 博客园](https://www.cnblogs.com/cg919/p/10512749.html)

## Example

```c#
interface ISampleInterface
{
    void SampleMethod();
}

class ImplementationClass : ISampleInterface
{
    // Explicit interface member implementation:
    void ISampleInterface.SampleMethod()
    {
        // Method implementation.
    }

    static void Main()
    {
        // Declare an interface instance.
        ISampleInterface obj = new ImplementationClass();

        // Call the member.
        obj.SampleMethod();
    }
}
```

## 接口访问 DEMO

- [c# static 接口类 和 singleton 类 区别 转 - scott_h - 博客园](https://www.cnblogs.com/scotth/p/10450891.html)
- [隐式实现接口成员与显示实现接口](https://blog.csdn.net/Ar_chen/article/details/76038087)

```c#
// 什么是单例模式
// 单例模式指的是在应用整个生命周期内只能存在一个实例。单例模式是一种被广泛使用的设计模式。他有很多好处，能够避免实例对象的重复创建，减少创建实例的系统开销，节省内存。

// 单例模式和静态类的区别
// 首先理解一下什么是静态类，静态类就是一个类里面都是静态方法和静态field，构造器被private修饰，因此不能被实例化。Math类就是一个静态类。

// 知道了什么是静态类后，来说一下他们两者之间的区别：

// 1）首先单例模式会提供给你一个全局唯一的对象，静态类只是提供给你很多静态方法，这些方法不用创建对象，通过类就可以直接调用；

// 2）单例模式的灵活性更高，方法可以被override，因为静态类都是静态方法，所以不能被override；

// 3）如果是一个非常重的对象，单例模式可以懒加载，静态类就无法做到；


//通过类对象实例访问
MyClass myObj1 = new MyClass();
myObj1.DoSomething();
myObj1.DoSomethingElse();

//通过接口来访问
MyClass      myObj2    = new MyClass();
IMyInterface myIntface = myObj2;
myIntface.DoSomething();
myIntface.DoSomethingElse();

```
