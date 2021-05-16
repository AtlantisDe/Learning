# WebClient.DownloadFile

- [WebClient.DownloadFile Method (System.Net)](https://docs.microsoft.com/en-us/dotnet/api/system.net.webclient.downloadfile?view=netframework-4.8)
- [Right way to use Spring WebClient in multi-thread environment](https://stackoverflow.com/questions/49095366/right-way-to-use-spring-webclient-in-multi-thread-environment)
- [警惕使用 WebClient.DownloadFile(string uri,string filePath)方法 - 玉开 - 博客园](https://www.cnblogs.com/yukaizhao/archive/2008/08/05/webclient_downloadfile.html)
- [How do I use the new HttpClient from Windows.Web.Http to download an image?](https://stackoverflow.com/questions/26958829/how-do-i-use-the-new-httpclient-from-windows-web-http-to-download-an-image)
- [How do I download an image for a url?](https://social.msdn.microsoft.com/Forums/silverlight/en-US/7330aab3-91ee-473c-9910-d38f3be3a05b/how-do-i-download-an-image-for-a-url?forum=winappswithcsharp)

## 常用

```c#
string remoteUri = "http://www.contoso.com/library/homepage/images/";
string fileName = "ms-banner.gif", myStringWebResource = null;
// Create a new WebClient instance.
WebClient myWebClient = new WebClient();
// Concatenate the domain with the Web resource filename.
myStringWebResource = remoteUri + fileName;
Console.WriteLine("Downloading File \"{0}\" from \"{1}\" .......\n\n", fileName, myStringWebResource);
// Download the Web resource and save it into the current filesystem folder.
myWebClient.DownloadFile(myStringWebResource,fileName);
Console.WriteLine("Successfully Downloaded File \"{0}\" from \"{1}\"", fileName, myStringWebResource);
Console.WriteLine("\nDownloaded file saved in the following file system folder:\n\t" + Application.StartupPath);
```

### 1. download is complete

- [How to check if file download is complete](https://stackoverflow.com/questions/23188783/how-to-check-if-file-download-is-complete)

```c#
static void Main(string[] args)
{
    using (WebClient myWebClient = new WebClient())
    {
        myWebClient.DownloadFileCompleted += DownloadCompleted;
        myWebClient.DownloadFileAsync(new Uri("http://someUrl"), @"e:\file.mp3");
    }

    Console.ReadLine();
}

public static void DownloadCompleted(object sender, AsyncCompletedEventArgs e)
{
    Console.WriteLine("Success");
}
```

### 1. ReadAsByteArrayAsync

- [Getting Title at 17:36](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpcontent.readasbytearrayasync?view=netcore-3.1)

```c#
var response = httpClient.SendAsync(request).Result;

if (response.IsSuccessStatusCode)
{
    var contxt = response.Content;
    var bytes = contxt.ReadAsByteArrayAsync().Result;

    // 把 byte[] 写入文件
    FileStream fs = new FileStream($@"D:\Tmp\Images\baidu.png", FileMode.Create);
    BinaryWriter bw = new BinaryWriter(fs);
    bw.Write(bytes);
    bw.Close();
    fs.Close();

}

```
