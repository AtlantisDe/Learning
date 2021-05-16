# C# Enum

- [c# enum 枚举一般用法](https://blog.csdn.net/jiegemena/article/details/78862788)
- [C# Enum 类型遍历 - 沙耶 - 博客园](https://www.cnblogs.com/ShaYeBlog/p/9335531.html)
- [C# enum、int、string 三种类型互相转换 - willingtolove - 博客园](https://www.cnblogs.com/willingtolove/p/9550889.html)
- [关于 C#的 Enum 转换 Int 类型，不使用强转 LuckyJoey](https://blog.csdn.net/u014732824/article/details/99303566)
- [(转)C# Enum,Int,String 的互相转换 枚举转换 - Pato' - 博客园](https://www.cnblogs.com/pato/archive/2011/08/15/2139705.html)
- [C# 枚举的注释获取方式 - XIAOJINJIN - 博客园](https://www.cnblogs.com/SoftZoro20181229/p/12796493.html)

## 相关代码

### 1. 常用

```c#

var Description = ((Net.Collection.Engine.Stock.Models.MAUIStyle)mAUIStyle).ToName();


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

### 3. 随机获得枚举

- [How do I select a random value from an enumeration?](https://stackoverflow.com/questions/3132126/how-do-i-select-a-random-value-from-an-enumeration)

```c#

PageContentType = (PageContentType)(typeof(PageContentType).GetRandomEnumValue()),

typeof(SomeEnum).GetRandomEnumValue()
Console.WriteLine(typeof(SomeEnum).GetRandomEnumValue());

```

### 4. Getting attributes of Enum's value 数字转类型获取描述值

- [Getting attributes of Enum&#x27;s value](https://stackoverflow.com/questions/1799370/getting-attributes-of-enums-value)

```c#

for (int i = 0; i < newItems.Count; i++)
{
    newItems[i].Name = ((Net.Core.Engine.Website.Models.WebsitePushType)newItems[i].EnumId).ToName();
}

using System.ComponentModel;

public enum Days {
    [Description("Sunday")]
    Sun,
    [Description("Monday")]
    Mon,
    [Description("Tuesday")]
    Tue,
    [Description("Wednesday")]
    Wed,
    [Description("Thursday")]
    Thu,
    [Description("Friday")]
    Fri,
    [Description("Saturday")]
    Sat
}

Console.WriteLine(Days.Mon.ToName());

var day = Days.Mon;
Console.WriteLine(day.ToName());
```

### 8. 遍历

- [C#遍历枚举类型的所有元素 - kwork777 - 博客园](https://www.cnblogs.com/kwork/archive/2010/11/17/1879713.html)

```c#
// 自定义描述名称
var Items = new List<Newtonsoft.Json.Linq.JObject>();
foreach (int mAUIStyle in Enum.GetValues(typeof(Net.Collection.Engine.Stock.Models.MAUIStyle)))
{
    var strName = ((Net.Collection.Engine.Stock.Models.MAUIStyle)mAUIStyle).ToName();
    var intValue = mAUIStyle;
    if (intValue != 0)
    {
        var Item = new Newtonsoft.Json.Linq.JObject { { "Name", strName }, { "Value", intValue } };
        Items.Add(Item);
    }
}

// 原始名称
var Items = new List<Newtonsoft.Json.Linq.JObject>();
foreach (int mAUIStyle in Enum.GetValues(typeof(Net.Collection.Engine.Stock.Models.MAUIStyle)))
{
    string strName = Enum.GetName(typeof(Net.Collection.Engine.Stock.Models.MAUIStyle), mAUIStyle);
    string strValue = mAUIStyle.ToString();
    var Item = new Newtonsoft.Json.Linq.JObject { { "Name", strName }, { "Value", strValue } };
    Items.Add(Item);
}


public enum eErrorDetailCode : int
{
    登陆成功 = 0,
    登出 = 1,
    应用错误 = 2,
    成功 = 16,
    失败 = 17
}

foreach (int  myCode in Enum.GetValues(typeof(eErrorDetailCode)))
{
 string strName =Enum.GetName(typeof(eErrorDetailCode), myCode);//获取名称
 string strValue = myCode.ToString();//获取值
 ListItem myLi = new ListItem(strName,strValue);
 ddlType.Items.Add(myLi);//添加到DropDownList控件
}


using System;
using UnityEngine;

public enum TestEnumArr {
    Test_01, Test_02, Test_03, Test_04, Test_05, Test_06,
    Test_07, Test_08, Test_09, Test_10, Test_11, Test_12
};
public class TestForEnum : MonoBehaviour {
    void Start () {
        foreach (TestEnumArr item in Enum.GetValues(typeof(TestEnumArr)))
        {
            DoSomeThings(item);//这个方法证明我传过去了枚举
        }
    }

    void DoSomeThings (TestEnumArr tEnum) {
        Debug.Log(tEnum.ToString());//简单演示枚举项被转过来了
        switch (tEnum)               //实际使用的一种情况，仅供参考
        {
            case TestEnumArr.Test_01:
                Debug.Log("我是枚举第一项"); //演示一下，下面的不写了哈~
                break;
        }
    }
}
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
