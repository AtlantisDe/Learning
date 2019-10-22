# C# Uri

- [C# System.Uri 类*获取 Url 的各种属性*文件名*参数*域名\_端口等等](https://www.cnblogs.com/mingxuantongxue/p/3803725.html)

## D-十进制数

```c#
// AbsolutePath 　　获取 URI 的绝对路径。
// AbsoluteUri 　　获取绝对 URI。
// Authority 　　　  获取服务器的域名系统 (DNS) 主机名或 IP 地址和端口号。
// DnsSafeHost 　　获得可安全用于 DNS 解析的未转义主机名。
// Fragment 　　　　获取转义 URI 片段。
// Host 　　　　　　 获取此实例的主机部分。
// HostNameType 　获取 URI 中指定的主机名的类型。
// IsAbsoluteUri 　　获取一个值，该值指示 Uri 实例是否为绝对 URI。
// IsDefaultPort 　　获取一个值，该值指示 URI 的端口值是否为此方案的默认值。
// IsFile 　　　　　　获取一个值，该值指示指定的 Uri 是否为文件 URI。
// IsLoopback 　　  获取一个值，该值指示指定的 Uri 是否引用了本地主机。
// IsUnc 　　　　　　获取一个值，该值指示指定的 Uri 是否为统一命名约定 (UNC) 路径。
// LocalPath 　　　　获取文件名的本地操作系统表示形式。
// OriginalString 　　获取传递给 Uri 构造函数的原始 URI 字符串。
// PathAndQuery 　 获取用问号 (?) 分隔的 AbsolutePath 和 Query 属性。
// Port 　　　　　　  获取此 URI 的端口号。
// Query 　　　　　　获取指定 URI 中包括的任何查询信息。
// Scheme 　　　　　获取此 URI 的方案名称。
// Segments 　　　　获取包含构成指定 URI 的路径段的数组。
// UserEscaped 　　  指示 URI 字符串在创建 Uri 实例之前已被完全转义。
// UserInfo 　　　　  获取用户名、密码或其他与指定 URI 关联的特定于用户的信息。

class Program
{
    static void Main(string[] args)
    {
        Uri uri = new Uri("http://www.baidu.com:80/2013/123.html?id=1");
        Console.WriteLine(uri.AbsolutePath);    //输出 /2013/123.html
        Console.WriteLine(uri.AbsoluteUri);     //输出 http://www.baidu.com/2013/123.html?id=1
        Console.WriteLine(uri.Authority);       //输出 www.baidu.com
        Console.WriteLine(uri.DnsSafeHost);     //输出 www.baidu.com
        Console.WriteLine(uri.Fragment);        //输出
        Console.WriteLine(uri.Host);            //输出 www.baidu.com
        Console.WriteLine(uri.IsAbsoluteUri);   //输出 True
        Console.WriteLine(uri.IsDefaultPort);   //输出 True
        Console.WriteLine(uri.IsFile);          //输出 False

        Uri uri1 = new Uri(@"D:\test\test.txt");
        Console.WriteLine(uri1.IsFile);          //输出 True

        Console.WriteLine(uri.IsLoopback);      //输出 False
        Console.WriteLine(uri1.IsLoopback);     //输出 True

        Console.WriteLine(uri.IsUnc);           //输出 False
        Console.WriteLine(uri.LocalPath);       //输出 /2013/123.html
        Console.WriteLine(uri.OriginalString);  //输出 http://www.baidu.com:80/2013/123.html
        Console.WriteLine(uri.PathAndQuery);    //输出 /2013/123.html?id=1
        Console.WriteLine(uri.Port);            //输出 80
        Console.WriteLine(uri.Query);           //输出 ?id=1
        Console.WriteLine(uri.Scheme);          //输出 http
        string[] strArr = uri.Segments;
        foreach (string str in strArr)
        {
            Console.WriteLine(str);     //输出 /   2013/      123.html
        }

        Console.WriteLine(uri.UserEscaped);     //输出 False;
        Console.WriteLine(uri.UserInfo);        //输出

        Console.ReadKey();
    }
}
```

## 解析

### http url 中的 host 和 hostname 的区别

```c#
如题，host和hostname其实是不同的概念，容易混淆。
简单的说，host=hostname+‘:'+port(not 80)
如果http使用默认的80端口，host可以省略掉冒号+端口，看上去和hostname一样，比如一个网站的域名www.baidu.com
在发送http get请求的时候，请求头中的"Host: "字段就是这里host的概念。

Authority :hostname+port
```

### 从 URI 中取文件名

- [Get file name from URI string in C#](https://stackoverflow.com/questions/1105593/get-file-name-from-uri-string-in-c-sharp/1105614)

```c#
Uri uri = new Uri(hreflink);
if (uri.IsFile) {
    string filename = System.IO.Path.GetFileName(uri.LocalPath);
}


readonly static Uri SomeBaseUri = new Uri("http://canbeanything");

static string GetFileNameFromUrl(string url)
{
    Uri uri;
    if (!Uri.TryCreate(url, UriKind.Absolute, out uri))
        uri = new Uri(SomeBaseUri, url);

    return Path.GetFileName(uri.LocalPath);
}
```

### 1. 从 URI 地址获取文件名 目录 等信息

```c#

string filename1 = System.IO.Path.GetFileName(new Uri("http://www.baidu.com/").AbsolutePath);
string filename2 = System.IO.Path.GetFileName(new Uri("http://www.baidu.com/lucky").AbsolutePath);
string filename3 = System.IO.Path.GetFileName(new Uri("http://www.google.com/aa.html/lucky/1.html").AbsolutePath);


string dirname1 = System.IO.Path.GetDirectoryName(new Uri("http://www.baidu.com/").AbsolutePath);
string dirname2 = System.IO.Path.GetDirectoryName(new Uri("http://www.baidu.com/lucky").AbsolutePath);
string dirname3 = System.IO.Path.GetDirectoryName(new Uri("http://www.google.com/aa.html/lucky/1.html").AbsolutePath);


string dirfullPath0 = System.IO.Path.GetFullPath(new Uri("http://www.baidu.com").AbsolutePath);
string dirfullPath1 = System.IO.Path.GetFullPath(new Uri("http://www.baidu.com/").AbsolutePath);
string dirfullPath2 = System.IO.Path.GetFullPath(new Uri("http://www.baidu.com/lucky").AbsolutePath);
string dirfullPath3 = System.IO.Path.GetFullPath(new Uri("http://www.google.com/aa.html/lucky/1.html").AbsolutePath);

var mulutemp = dirfullPath1;
mulutemp = mulutemp.Substring(2, mulutemp.Length - 2);

mulutemp = dirfullPath2;
mulutemp = mulutemp.Substring(2, mulutemp.Length - 2);
```
