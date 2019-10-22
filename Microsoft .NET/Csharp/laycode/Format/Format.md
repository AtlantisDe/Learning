# C# Format

- [C#数字格式化 - microsoft-zh.cn - 博客园](https://www.cnblogs.com/sntetwt/p/8145886.html)
- [string.Format 对 C#字符串格式化 - itjeff - 博客园](https://www.cnblogs.com/itjeff/p/5775665.html)

## 格式化集合

### D-十进制数

```c#
Console.WriteLine(1.ToString("D5"));
25.ToString("D5");//结果：00025
```

### 实现保留两位小数的方法

```c#
1、Math.Round(0.333333,2);//按照四舍五入的国际标准
2、double dbdata=0.335333; string str1=String.Format("{0:F}",dbdata);//默认为保留两位
3、float i=0.333333; int j=(int)(i * 100); i = j/100;
4、decimal.Round(decimal.Parse("0.3333333"),2)
5、private System.Globalization.NumberFormatInfo nfi = new System.Globalization.NumberFormatInfo(); float test=0.333333f; nfi.NumberDecimalDigits=2; string result=test.ToString("N", nfi);
6、string result= String.Format("{0:N2}",Convert.ToDecimal("0.333333").ToString());
7、Convert.ToDecimal("0.33333333").ToString("0.00");
```

### 使用率

```c#
 SystemInfo.cpuUsage = Convert.ToDecimal(CsharpLazycode.Module.MySystem.Util.getCPUCounter()).ToString("0.00");
```
