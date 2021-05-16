# random

- [个人觉得 C#中 random.Next()有 BUG。。望大神指点我！-CSDN 论坛](https://bbs.csdn.net/topics/392054644?list=64262378)
- Random 类不是线程安全的。
- 如果多个线程同时调用同一个 random 实例，是可能出现返回 0 的现象。
- [RNGCryptoServiceProvider Class (System.Security.Cryptography)](https://docs.microsoft.com/en-us/dotnet/api/system.security.cryptography.rngcryptoserviceprovider?redirectedfrom=MSDN&view=netframework-4.8)
- [Is C# Random Number Generator thread safe?](https://stackoverflow.com/questions/3049467/is-c-sharp-random-number-generator-thread-safe)
- [c#.net 利用 RNGCryptoServiceProvider 产生任意范围强随机数的办法 - #天行健# - 博客园](https://www.cnblogs.com/lcyuhe/p/7126405.html?utm_source=itdadao&utm_medium=referral)

```C#

var aa = ExtenionsRandom.Next(10000000, 999999999).ToString();

///<summary>
    ///生成随机字符串
    ///</summary>
    ///<param name="length">目标字符串的长度</param>
    ///<param name="useNum">是否包含数字，1=包含，默认为包含</param>
    ///<param name="useLow">是否包含小写字母，1=包含，默认为包含</param>
    ///<param name="useUpp">是否包含大写字母，1=包含，默认为包含</param>
    ///<param name="useSpe">是否包含特殊字符，1=包含，默认为不包含</param>
    ///<param name="custom">要包含的自定义字符，直接输入要包含的字符列表</param>
    ///<returns>指定长度的随机字符串</returns>
    public static string GetRandomString(int length, bool useNum, bool useLow, bool useUpp, bool useSpe, string custom)
    {
        byte[] b = new byte[4];
        new System.Security.Cryptography.RNGCryptoServiceProvider().GetBytes(b);
        Random r = new Random(BitConverter.ToInt32(b, 0));
        string s = null, str = custom;
        if (useNum == true) { str += "0123456789"; }
        if (useLow == true) { str += "abcdefghijklmnopqrstuvwxyz"; }
        if (useUpp == true) { str += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; }
        if (useSpe == true) { str += "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"; }
        for (int i = 0; i < length; i++)
        {
            s += str.Substring(r.Next(0, str.Length - 1), 1);
        }
        return s;
    }
```

```c#
public static class RandomGen3
{
    private static RNGCryptoServiceProvider _global =
        new RNGCryptoServiceProvider();
    [ThreadStatic]
    private static Random _local;

    public static int Next()
    {
        Random inst = _local;
        if (inst == null)
        {
            byte[] buffer = new byte[4];
            _global.GetBytes(buffer);
            _local = inst = new Random(
                BitConverter.ToInt32(buffer, 0));
        }
        return inst.Next();
    }
}
```
