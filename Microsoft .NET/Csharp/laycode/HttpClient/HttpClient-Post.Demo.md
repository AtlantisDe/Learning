# HttpClient-Post.Demo

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
