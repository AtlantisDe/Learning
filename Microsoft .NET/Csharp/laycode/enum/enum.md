# C# Enum

- [c# enum 枚举一般用法](https://blog.csdn.net/jiegemena/article/details/78862788)
- [C# Enum 类型遍历 - 沙耶 - 博客园](https://www.cnblogs.com/ShaYeBlog/p/9335531.html)

## 相关代码

### 1. 常用

```c#

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
