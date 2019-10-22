# T 类型

- [C#泛型返回类型的方法如何返回 - iningwei 的博客 - CSDN 博客](https://blog.csdn.net/iningwei/article/details/88978598)
- [C#.NET 为 List 加入扩展方法：获取唯一值 - weixin_34342992 的博客 - CSDN 博客](https://blog.csdn.net/weixin_34342992/article/details/85922339)

## Demo

### 1. Demo1

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

### 2. NET 为 List 加入扩展方法：获取唯一值

```c#
    public static class ListTools
    {
        /// <summary>
        /// 获取唯一值列表
        /// </summary>
        /// <param name="strList">原始值</param>
        /// <returns>唯一值</returns>
        public static List<T> GetUniqueValue<T>(this List<T> list)
        {
            List<T> tmp = new List<T>();
            for (int i = 0; i < list.Count; i++)
            {
                if (!tmp.Contains(list[i]))
                    tmp.Add(list[i]);
            }
            return tmp;
        }
    }
```
