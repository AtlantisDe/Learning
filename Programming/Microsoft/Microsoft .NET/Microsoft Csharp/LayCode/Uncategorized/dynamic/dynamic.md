# dynamic

- 对象读取区分大小写 最好都统一小写 判断对象 请用 null
- 动态
- 语句告诉编译器：“不要紧张，这个事情不用你管了”
- 们可能会对这样的简化不以为然，毕竟看起来代码并没有减少多少，此方法也不能使用 IntelliSense，但是，如果考虑到效率兼优美两个特性，那么 dynamic 的优势就显现出来了。编译器对 dynamic 进行了优化，比没有经过缓存的反射效率快了很多。
- [C#中 Dynamic 关键字 - 每天进步多一点 - 博客园](https://www.cnblogs.com/lgx5/p/9650203.html)
- [C#中 dynamic 的正确用法 - gygtech - 博客园](https://www.cnblogs.com/gygtech/p/9915367.html)
- [C#中的 var 和 dynamic - 阿子 - 博客园](https://www.cnblogs.com/yayazi/p/8998610.html)
- [C#中 dynamic 的正确用法 - 网管布吉岛 - 博客园](https://www.cnblogs.com/gnz49/p/11388316.html)
- [C# dynamic 常用整理](https://blog.csdn.net/u011127019/article/details/76092382)
- [C#笔记---动态类(Dynamic)应用 - FrankZC - 博客园](https://www.cnblogs.com/FourLeafCloverZc/p/4348722.html)
- [C#高级编程七十天----dynamic 类型](https://blog.csdn.net/shanyongxu/article/details/47296033)
- [C#的 dynamic 使用中有什么需要注意的地方，以免滥用？ - 知乎](https://www.zhihu.com/question/31958129)
- [NET 新特性——Dynamic 的优缺点测试及分析](http://www.doc88.com/p-7864239864975.html)
- [System.Dynamic Namespace](https://docs.microsoft.com/en-us/dotnet/api/system.dynamic?view=netframework-4.8)

```c#
原因:

　　匿名类型是internal级别的。

C#新增了dynamic关键字,正是因为这一个小小的关键字,C#像前迈进了一大步.

dynamic是一个类型关键,声明为dynamic的类型与”静态类型”(这里的静态是指编译时确定的类型,例如int,double类型)相比最大的特定它是”动态类型”,它会在运行时尝试调用方法,这些方法的存在与否不是编译时期检查的,而是在运行时查找,如果方法存在并且参数正确,会正确调用,否则会抛出异常.

// 在理解var和dynamic关键字之前，让我们先了解一下编程语言的类别。
// C#中有两类编程语言：
静态类型语言类别
动态语言类别

var与dynamic
var和dynamic看上去很像，但是实际上是有差别的：
var说:我的类型在编译时就是确定的。
dynamic说：我类型要等到运行时才能知晓。



```

## 1. 常用

### 0. 常用解决方案

- [C# dynamic 类型报错：“object”不包含“xxx”的定义 weixin_30502157](https://blog.csdn.net/weixin_30502157/article/details/99497379)

```c#
问题:
// 原来是匿名类型在编译后，访问修饰符是internal级别的，当跨程序集访问时就会出现如题错误（apiTL.ProductList()返回的是一个匿名类型）。这也就是为什么在抽离前程序运行是正常的（因为在同一程序集中），而抽离后报错的原因。知道了原因，就来解决它。

解决:
dynamic ToJson 然后转成 

```

### 1. dynamic 与反射

```c#
// 除了在编译时是否进行类型检查之外，另外一个重要的区别就是类型转化，这也是dynamic很有价值的地方，dynamic类型的实例和其他类型的实例间的转换是很简单的，开发人员能够很方便地在dyanmic和非dynamic行为间切换。任何实例都能隐式转换为dynamic类型实例，见下面的例子：

dynamic d1 = 7;
dynamic d2 = "a string";
dynamic d3 = System.DateTime.Today;
dynamic d4 = System.Diagnostics.Process.GetProcesses();

// 反之亦然，类型为dynamic的任何表达式也能够隐式转换为其他类型。
int i = d1;
string str = d2;
DateTime dt = d3;
System.Diagnostics.Process[] procs = d4;

// 以前我们这样使用反射：
public class DynamicSample
{
   public string Name { get; set; }

   public int Add(int a, int b)
   {
     return a + b;
   }
}
DynamicSample dynamicSample = new DynamicSample();

 //create instance为了简化演示，我没有使用反射
var addMethod = typeof(DynamicSample).GetMethod("Add");
int re = (int)addMethod.Invoke(dynamicSample, new object[] { 1, 2 });

// 现在，我们有了简化的写法：
dynamic dynamicSample2 = new DynamicSample();
int re2 = dynamicSample2.Add(1, 2);
```

### 2. 其它

```c#
Newtonsoft.Json.JsonConvert.DeserializeObject<T>(config);

dynamic demodynamic;
- 对象读取区分大小写
var aa = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>("{John:999}");
Console.WriteLine(aa.John);
Console.WriteLine(aa.john);

//不存在报错

aa.john = "888";
Console.WriteLine(aa.john);

try
{
    if (aa.john == null)
    {
        Console.WriteLine("不存在对象");
    }
    else
    {
        Console.WriteLine(aa.john);
    }
}
catch (Exception ex)
{
    Console.WriteLine(ex.Message);

}

```

### 3. 确定 dynamic 类型的数据对象是否存在某个属性

- [c# 确定 dynamic 类型的数据对象是否存在某个属性 - 94cool - 博客园](https://www.cnblogs.com/94cool/p/8135579.html)

```c#
public static bool IsPropertyExist(dynamic data, string propertyname)
{
if (data is ExpandoObject)
    return ((IDictionary<string, object>)data).ContainsKey(propertyname);
return data.GetType().GetProperty(propertyname) != null;
}
```

## 3. 示例

### 0. 通过字典来添加属性和赋值

```c#
// 2.1: 继承DynamicObject,里面提供了各种方法,重写后可以实现属性的添加.
public sealed class MyExtendsObject : DynamicObject
    {
        private readonly Dictionary<string, object> _properties;

        public MyExtendsObject(Dictionary<string, object> properties)
        {
            _properties = properties;
        }

        public override IEnumerable<string> GetDynamicMemberNames()
        {
            return _properties.Keys;
        }

        public override bool TryGetMember(GetMemberBinder binder, out object result)
        {
            if (_properties.ContainsKey(binder.Name))
            {
                result = _properties[binder.Name];
                return true;
            }
            else
            {
                result = null;
                return false;
            }
        }

        public override bool TrySetMember(SetMemberBinder binder, object value)
        {
            if (_properties.ContainsKey(binder.Name))
            {
                _properties[binder.Name] = value;
                return true;
            }
            else
            {
                return false;
            }
        }
    }
// 2.2 通过字典来添加属性和赋值
public static void Main(string[] args)
{
    dynamic myObj = new ExpandoObject();
    Dictionary<string, object> dic = new Dictionary<string, object>()
    {
        {"Name","Frank"},
        {"Age",23}
    };

    myObj = new MyExtendsObject(dic);
    Console.WriteLine(myObj.Age); //23
}
```

### 1. dynamic 变量使用示例

```c#
// dynamic变量使用示例
dynamic para1 = 10;
Console.WriteLine(para1);//输出：10
para1 = "张三丰";
Console.WriteLine(para1);//输出：张三丰

para1 = new { age = 20, name = "Jack" };
Console.WriteLine(para1);//输出：{ age = 10, name = Jack }
Console.WriteLine(para1.age);//输出：20

para1 = new Dictionary<int, string>();
para1.Add(1, "张三丰");
foreach (var item in para1)
{
    Console.WriteLine(item.Key + "-->" + item.Value);//输出：1-->张三丰
}

```

### 2. WebApi 系列~dynamic 让你的省了很多临时类

- [WebApi 系列~dynamic 让你的省了很多临时类 - 张占岭 - 博客园](https://www.cnblogs.com/lori/p/5159728.html)

## 2. dynamic 对象使用示例

```c#
//使用dynamic动态对象，可以自定义添加不存在属性和值
dynamic obj1 = new System.Dynamic.ExpandoObject();
obj1.id = 2;
obj1.name = "张无忌";
Console.WriteLine(obj1);//输出：System.Dynamic.ExpandoObject

obj1.list = new List<string>();
obj1.list.Add("令狐冲");
foreach (var item in obj1.list)
{
    Console.WriteLine(item);//输出：令狐冲
}


```

## 4. ToExpando

```c#
public static class ExtensionMethods
{
    public static ExpandoObject ToExpando(this object obj)
    {
        IDictionary<string, object> expando = new ExpandoObject();
        foreach (PropertyDescriptor propertyDescriptor in TypeDescriptor.GetProperties(obj))
        {
            var value = propertyDescriptor.GetValue(obj);
            expando.Add(propertyDescriptor.Name, value == null || new[]
            {
                typeof (Enum),
                typeof (String),
                typeof (Char),
                typeof (Guid),
                typeof (Boolean),
                typeof (Byte),
                typeof (Int16),
                typeof (Int32),
                typeof (Int64),
                typeof (Single),
                typeof (Double),
                typeof (Decimal),
                typeof (SByte),
                typeof (UInt16),
                typeof (UInt32),
                typeof (UInt64),
                typeof (DateTime),
                typeof (DateTimeOffset),
                typeof (TimeSpan),
            }.Any(oo => oo.IsInstanceOfType(value))
                ? value
                : value.ToExpando());
        }

        return (ExpandoObject)expando;
    }
}

public static class ObjectExtensions
{
    public static ExpandoObject ToExpando(this object obj)
        => Newtonsoft.Json.JsonConvert.DeserializeObject<ExpandoObject>(Newtonsoft.Json.JsonConvert.SerializeObject(obj));
}
```
