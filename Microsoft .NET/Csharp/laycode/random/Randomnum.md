# Randomnum

## Wiki

- [C# 生成随机数重复问题 - 夏空 - 博客园](https://www.cnblogs.com/programsky/p/5408697.html)
- [有效解决C# Random生成随机数重复的问题 - shuai_wy的专栏 - CSDN博客](https://blog.csdn.net/shuai_wy/article/details/78606175)

```C#
Random num = new Random();
int a = num.Next(1,100);//产生1到100的随即数！

Random num = new Random(); int a = num.Next(10000, 80000);
```

```C#
MSDN详细：
命名空间:System
Random.Next 方法 (Int32, Int32)
minValue(下限)：返回的随机数字[包含]下限
maxValue(上限)：返回随机数的[不含]上限
```
