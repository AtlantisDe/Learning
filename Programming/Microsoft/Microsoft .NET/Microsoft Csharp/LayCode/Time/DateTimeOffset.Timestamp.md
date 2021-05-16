# Timestamp

- [c# datetime 与 timeStamp 时间戳 互相转换](https://www.cnblogs.com/wangfuyou/p/5713713.html)
- [.NET Framework 4.6 新增 Unix TimeStamp 方法](https://blog.kkbruce.net/2015/12/net-framework-46-unix-time-stamp.html#.XymaOSgzaUk)
- [Unix 时间戳与 C# DateTime 时间类型互换 - MicroCoder - 博客园](https://www.cnblogs.com/dushouke/archive/2011/01/26/unix-timestamp-datetime.html)
- [DateTime.Subtract Method (System)](https://docs.microsoft.com/en-us/dotnet/api/system.datetime.subtract?view=netcore-3.1)
- [TimeSpan Struct (System)](https://docs.microsoft.com/en-us/dotnet/api/system.timespan?view=netcore-3.1)
- [TimeZone.CurrentTimeZone Property (System)](https://docs.microsoft.com/zh-cn/dotnet/api/system.timezone.currenttimezone?view=netcore-3.1)

## 1. c# datetime 与 timeStamp 时间戳 互相转换

- 将时间格式转化为一个 int 类型

```C#
// 标准答案时间戳
long unixSeconds = DateTimeOffset.Now.ToUnixTimeSeconds();

var v2 = DateTime.Now.ConvertToUnixTime();

var aa = (DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000;

// 2014/1/14 13:01:26时间转完后为：1389675686数字

Tue 01-01-2009 6:00
2005-10-30 T 10:45 UTC
2007-11-09 T 11:20 UTC
Sat Jul 23 02:16:57 2005
12569537329
(1969-07-21 T 02:56 UTC) – first footstep on the Moon, "That's one small step for man, one giant leap for mankind"
07:38, 11 December 2012 (UTC)

// 我們特別注意到一個12569537329數值，這是什麼東西？這種格式稱Unix Time
```

## 2. 为什么使用时间戳

- 关于 Unix 时间戳,大概是这个意思,从 1970 年 0 时 0 分 0 秒开始到现在的秒数.使用它来获得的是一个 INT 值,储存在数据库里只要使用 INT 格式就可以了，方便数据库进行排序,搜索,而且比 datetime 格式更节省数据库空间

## 3. 正式使用的代码

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

## 4. 正式使用的代码，获得毫秒数

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
