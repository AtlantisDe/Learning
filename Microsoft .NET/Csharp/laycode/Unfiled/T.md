# T 类型

- [C#泛型返回类型的方法如何返回 - iningwei的博客 - CSDN博客](https://blog.csdn.net/iningwei/article/details/88978598)

## Demo

```c#
public class Util
{
    public static string SerializeObject(object value)
    {
        return Newtonsoft.Json.JsonConvert.SerializeObject(value);
    }

    public static T DeserializeObject<T>(string jsonstext)
    {
        return Newtonsoft.Json.JsonConvert.DeserializeObject<T>(jsonstext); ;
    }

}
```
