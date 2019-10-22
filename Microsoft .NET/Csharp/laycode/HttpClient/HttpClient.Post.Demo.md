# HttpClient-Post.Demo

## 1. POST DEMO

```c#
- FormUrlEncodedContent content = new FormUrlEncodedContent(authentication.ToDictionary<string>().AsEnumerable());
- FormUrlEncodedContent content = new FormUrlEncodedContent(authentication.ToKeyValue());

var content = new FormUrlEncodedContent(new Dictionary<string, string>()
{
    {"guid",  "888888888888"},
    {"ak", "65fc7ca4fc441d26f71bf3d691b278c2"},
    {"deviceId", "537eb34be4b022b7fbe19471"}
});


var dicValue = parameterItem.ToDictionary();
dicValue.Add("offset", apipublishRequestpackagePageitems.offset);
dicValue.Add("length", apipublishRequestpackagePageitems.limit);
var content = new FormUrlEncodedContent(dicValue.ToKeyValue());

```

```c#
FormUrlEncodedContent content = new FormUrlEncodedContent(new Dictionary<string, string>()
{
    ["client_id"] = authentication.ClientId,
    ["client_secret"] = authentication.ClientSecret,
    ["scope"] = authentication.Scope,
    ["code"] = authentication.Code,
    ["grant_type"] = authentication.GrantType,
    ["redirect_uri"] = authentication.RedirectUri
});
```

```c#
try
{
    var uri = "demo.com/aaa?";
    var handler = new HttpClientHandler() { AutomaticDecompression = DecompressionMethods.None };
    using (var httpclient = new HttpClient(handler))
    {
        httpclient.BaseAddress = new Uri(uri);
        var content = new FormUrlEncodedContent(new Dictionary<string, string>()
            {
                {"guid",  "888888888888"},
                {"ak", "65fc7ca4fc441d26f71bf3d691b278c2"},
                {"deviceId", "537eb34be4b022b7fbe19471"}

            });

        var response = httpclient.PostAsync(uri, content);
        //string responseString =  response.Content.ReadAsStringAsync();
        //MessageBox.Show(responseString);

        response.Wait();
        if (response.Result != null)
        {
            var rst = response.Result;
            if (rst.IsSuccessStatusCode)
            {
                var contxt = rst.Content;
                var stream = contxt.ReadAsStreamAsync();
                if (stream.Wait(5000))
                {
                    StreamReader myStreamReader = new StreamReader(stream.Result, Encoding.GetEncoding("utf-8"));
                    string retString = myStreamReader.ReadToEnd();
                    myStreamReader.Close();
                    stream.Result.Close();
                }

            }
        }

    }

}
catch (Exception ex)
{
    Console.WriteLine(string.Format("异常包: [{0}] [{1}] 异常消息:{2}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message));
    root.code = 100;
    root.message = string.Format("异常[{0}]", ex.Message);
}
finally
{
}

```

## 2. FormUrlEncodedContent

- [Creating FormUrlEncodedContent Variables from Objects &#8211; bitScry](https://blog.bitscry.com/2018/12/14/creating-formurlencodedcontent-variables-from-objects/)

```c#
FormUrlEncodedContent content = new FormUrlEncodedContent(new Dictionary<string, string>()
{
    ["client_id"] = authentication.ClientId,
    ["client_secret"] = authentication.ClientSecret,
    ["scope"] = authentication.Scope,
    ["code"] = authentication.Code,
    ["grant_type"] = authentication.GrantType,
    ["redirect_uri"] = authentication.RedirectUri
});
```

## 3. ToDictionary

```c#
public static class ObjectExtensions
{
    public static IDictionary<string, object> ToDictionary(this object source)
    {
        return source.ToDictionary<object>();
    }

    public static IDictionary<string, T> ToDictionary<T>(this object source)
    {
        if (source == null) ThrowExceptionWhenSourceArgumentIsNull();

        var dictionary = new Dictionary<string, T>();
        foreach (PropertyDescriptor property in TypeDescriptor.GetProperties(source))
        {
            object value = property.GetValue(source);
            if (IsOfType<T>(value))
            {
                dictionary.Add(property.Name, (T)value);
            }
        }
        return dictionary;
    }

    private static bool IsOfType<T>(object value)
    {
        return value is T;
    }

    private static void ThrowExceptionWhenSourceArgumentIsNull()
    {
        throw new NullReferenceException("Unable to convert anonymous object to a dictionary. The source anonymous object is null.");
    }
}
```

## 4. ToKeyValue

```c#
public static class ObjectExtensions
{
    public static IDictionary<string, string> ToKeyValue(this object metaToken)
    {
        if (metaToken == null)
        {
            return null;
        }

        JToken token = metaToken as JToken;
        if (token == null)
        {
            return ToKeyValue(JObject.FromObject(metaToken));
        }

        if (token.HasValues)
        {
            var contentData = new Dictionary<string, string>();
            foreach (var child in token.Children().ToList())
            {
                var childContent = child.ToKeyValue();
                if (childContent != null)
                {
                    contentData = contentData.Concat(childContent)
                                             .ToDictionary(k => k.Key, v => v.Value);
                }
            }

            return contentData;
        }

        var jValue = token as JValue;
        if (jValue?.Value == null)
        {
            return null;
        }

        var value = jValue?.Type == JTokenType.Date ?
                        jValue?.ToString("o", CultureInfo.InvariantCulture) :
                        jValue?.ToString(CultureInfo.InvariantCulture);

        return new Dictionary<string, string> { { token.Path, value } };
    }
}
```

## 5. using any JsonProperty decorations

- This extension method has the advantage of using any JsonProperty decorations you might have on the object model so that you can control the key names.

```c#
FormUrlEncodedContent content = new FormUrlEncodedContent(authentication.ToKeyValue());
```
