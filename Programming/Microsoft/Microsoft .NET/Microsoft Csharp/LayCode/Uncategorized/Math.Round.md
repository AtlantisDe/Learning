# Math.Round

- [C#中 Math.Round()实现中国式四舍五入 - 小锋神 - 博客园](https://www.cnblogs.com/xiaofengfeng/p/4729973.html)

## 1. 四舍五入

```c#
void Main()
{
    Console.Write(Math.Round(3.4679, 2,MidpointRounding.ToEven));
    Console.Write(Math.Round(3.4679, 2,MidpointRounding.AwayFromZero));
    Console.Write(Math.Round(3.4679, 2));
}

void Main()
{
    Console.Write(Math.Round(3.46799999999 -.005 , 2));
}

Math.Round(0.4, MidpointRounding.AwayFromZero); // result:0

Math.Round(0.6, MidpointRounding.AwayFromZero); // result:1

Math.Round(0.5, MidpointRounding.AwayFromZero); // result:1

Math.Round(1.5, MidpointRounding.AwayFromZero); // result:2

Math.Round(2.5, MidpointRounding.AwayFromZero); // result:3

Math.Round(3.5, MidpointRounding.AwayFromZero); // result:4

Math.Round(4.5, MidpointRounding.AwayFromZero); // result:5

Math.Round(5.5, MidpointRounding.AwayFromZero); // result:6

Math.Round(6.5, MidpointRounding.AwayFromZero); // result:7

Math.Round(7.5, MidpointRounding.AwayFromZero); // result:8

Math.Round(8.5, MidpointRounding.AwayFromZero); // result:9

Math.Round(9.5, MidpointRounding.AwayFromZero); // result:10

// 但是悲剧的是，如果用这个计算小数的话，就不灵了！！！

// 必须用第七个重载方法，
decimal Round(decimal d, int decimals, MidpointRounding mode)

// 这样计算出来的小数才是真正的中国式四舍五入！！

Math.Round(526.925, 2)
526.92

Math.Round(526.925, 2,MidpointRounding.AwayFromZero)
526.92

Math.Round((decimal)526.925, 2)
526.92

Math.Round((decimal)526.925, 2,MidpointRounding.AwayFromZero)
526.93
```

## 2. c# 绝对值

```c#
Console.WriteLine("输入任意整数");
var n = int.Parse(Console.ReadLine());
var num = Math.Abs(n);
Console.WriteLine(num);
Console.ReadLine();
```
