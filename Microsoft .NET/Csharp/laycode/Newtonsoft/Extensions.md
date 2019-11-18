# Extensions

## Dynamic 对象系列化

```c#
public static Newtonsoft.Json.Linq.JObject ObjToJObject(this object obj)
{

    try
    {
        var JsonText = Newtonsoft.Json.JsonConvert.SerializeObject(obj);
        var jObject = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(JsonText);
        return jObject;
    }
    catch (Exception)
    {
        Newtonsoft.Json.Linq.JObject jObject = new Newtonsoft.Json.Linq.JObject();
        return jObject;
    }
}

```
