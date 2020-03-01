# C# Enum

- [c# enum 枚举一般用法](https://blog.csdn.net/jiegemena/article/details/78862788)
- [C# Enum 类型遍历 - 沙耶 - 博客园](https://www.cnblogs.com/ShaYeBlog/p/9335531.html)
- [C# enum、int、string 三种类型互相转换 - willingtolove - 博客园](https://www.cnblogs.com/willingtolove/p/9550889.html)
- [关于 C#的 Enum 转换 Int 类型，不使用强转\_LuckyJoey 的博客-CSDN 博客](https://blog.csdn.net/u014732824/article/details/99303566)
- [(转)C# Enum,Int,String 的互相转换 枚举转换 - Pato' - 博客园](https://www.cnblogs.com/pato/archive/2011/08/15/2139705.html)

## 相关代码

### 1. 常用

```c#
((int)HashType).ToString()
"1"


public enum Sex
{
    Man=1,
    Woman=2
}

public static void enumConvert()
{
    int sexNum = (int)Sex.Man;
    Console.WriteLine("将枚举转换成整数："+sexNum);//1

    string sexStr = Sex.Woman.ToString();
    Console.WriteLine("将枚举转换成字符串："+sexStr);//"Woman"

    Sex sexStrEnum = (Sex)Enum.Parse(typeof(Sex),"Man");
    Console.WriteLine("将字符串转换成枚举：" + sexStrEnum.ToString());//"Man"

    Sex sexNumEnum = (Sex)1;
    Console.WriteLine("将整数转换成枚举："+sexNumEnum.ToString());//"Man"

    string numToStr = Enum.GetName(typeof(Sex),2);
    Console.WriteLine("将整数转换成字符串："+numToStr);//"Woman"

    int strToNum = (int)Enum.Parse(typeof(Sex), "Woman");
    Console.WriteLine("将字符串转换成整数：" + strToNum);//2

    // 判断某个整型是否定义在枚举中的方法：Enum.IsDefined

    public static bool IsDefined(Type enumType,Object value)

// 例如：
    Enum.IsDefined(typeof(Colors), n))

    if (Enum.IsDefined(typeof(Colors), msg.Body))
    {
        ActionType = (Colors)Enum.Parse(typeof(Colors), msg.Body);
    }

public class Enum
{
    public enum logitemStates
    {
        normal = 0,
        error = 1,
        unknown = 404


    }
}
```

### 2. string to enum

```c#
// 整数型转回去DEMO
var FrameworkType1 = (Enum.PcoreFrameworkType)0;
var FrameworkType2 = (Enum.PcoreFrameworkType)10000;
var FrameworkType3 = (Enum.PcoreFrameworkType)0;


DomainsCreteTypes =  (Enum.DomainsCreteTypes)Enum.DomainsCreteTypes.Parse(typeof(Enum.DomainsCreteTypes), "Red", true);

```

### 9. 枚举

```c#
void Main()
{
    new EnumForeach().Foreach();
}

public class EnumForeach
{
    public void Foreach()
    {
        foreach (Status item in Enum.GetValues(typeof(Status)))
        {
            item.ToString().Dump();
            ((int)item).Dump();
        }
    }
}

public enum Status
{
    AA = 1,
    BB = 2,
    CC = 3
}
```
