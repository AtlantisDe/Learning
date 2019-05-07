# Timestamp

- [c# datetime 与 timeStamp 时间戳 互相转换](https://www.cnblogs.com/wangfuyou/p/5713713.html)

## c# datetime 与 timeStamp 时间戳 互相转换

- 将时间格式转化为一个 int 类型

```C#
// 2014/1/14 13:01:26时间转完后为：1389675686数字
```

## 为什么使用时间戳

- 关于 Unix 时间戳,大概是这个意思,从 1970 年 0 时 0 分 0 秒开始到现在的秒数.使用它来获得的是一个 INT 值,储存在数据库里只要使用 INT 格式就可以了，方便数据库进行排序,搜索,而且比 datetime 格式更节省数据库空间

## 正式使用的代码

```C#
/// <summary>
/// DateTime时间格式转换为Unix时间戳格式
/// </summary>
/// <param name="time"> DateTime时间格式</param>
/// <returns>Unix时间戳格式</returns>
public static int ConvertDateTimeInt(System.DateTime time)
{
    System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1));
    return (int)(time - startTime).TotalSeconds;
}
```

## 正式使用的代码，获得毫秒数

```C#
/// <summary>
/// 生成时间戳
/// </summary>
/// <returns>当前时间减去 1970-01-01 00.00.00 得到的毫秒数</returns>
public string GetTimeStamp()
{
    DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1, 0, 0, 0, 0));
    DateTime nowTime = DateTime.Now;
    long unixTime = (long)System.Math.Round((nowTime - startTime).TotalMilliseconds, MidpointRounding.AwayFromZero);
    return unixTime.ToString();
}
```
