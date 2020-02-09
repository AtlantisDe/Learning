# HttpClient-Get

## GET Code 1

```C#
using (HttpClient client = new HttpClient())
{
    try
    {
        Task<HttpResponseMessage> response = client.GetAsync("http://www.demo.com");
        response.Wait();
        if (response.Result != null)
        {
            var rst = response.Result;
            if (rst.IsSuccessStatusCode)
            {
                var contxt = rst.Content;
                var aaa = contxt.ReadAsStringAsync();
                if (aaa.Wait(5000))
                {
                    var ccc = aaa.Result;
                }

            }
        }
    }
    catch (HttpRequestException e)
    {
        Console.WriteLine("\nException Caught!");
        Console.WriteLine("Message :{0} ", e.Message);
    }
}
```

## GET Code 2

```C#
using (HttpClient client = new HttpClient())
{
    try
    {
        Task<HttpResponseMessage> response = client.GetAsync("http://demo");
        response.Wait();
        if (response.Result != null)
        {
            var rst = response.Result;
            if (rst.IsSuccessStatusCode)
            {
                var contxt = rst.Content;
                var aaa = contxt.ReadAsStreamAsync();
                if (aaa.Wait(5000))
                {
                    StreamReader myStreamReader = new StreamReader(aaa.Result, Encoding.GetEncoding("utf-8"));
                    string retString = myStreamReader.ReadToEnd();
                    myStreamReader.Close();
                    aaa.Result.Close();
                }

            }
        }
    }
    catch (HttpRequestException e)
    {
        Console.WriteLine("\nException Caught!");
        Console.WriteLine("Message :{0} ", e.Message);
    }
}

```
