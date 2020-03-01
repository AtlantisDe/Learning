# Ping

- [Ping Class (System.Net.NetworkInformation)](https://docs.microsoft.com/en-us/dotnet/api/system.net.networkinformation.ping?view=netframework-4.8)
- [Ping.Send Method (System.Net.NetworkInformation)](https://docs.microsoft.com/en-us/dotnet/api/system.net.networkinformation.ping.send?view=netframework-4.8)
- [Ping 的用法\_网络\_woailyoo0000 的博客-CSDN 博客](https://blog.csdn.net/woailyoo0000/article/details/79914355)
- [How to Use Ping in C#](https://www.c-sharpcorner.com/UploadFile/167ad2/how-to-use-ping-in-C-Sharp/)
- [C# 如何判断电脑上网所使用的本地 IP-CSDN 论坛](https://bbs.csdn.net/topics/392035051?list=lz)

## 常用

- [How To Ping using a specific Network Interface (or a specific source IP Address)?](https://stackoverflow.com/questions/22575485/how-to-ping-using-a-specific-network-interface-or-a-specific-source-ip-address)

```c#


Ping ping = new Ping();
PingReply reply = ping.Send("www.baidu.com");//百度IP
if (reply.Status == IPStatus.Success)
{
    Console.WriteLine("已联网");
}
else
{
    Console.WriteLine("未联网");
}

public static void ComplexPing ()
{
    Ping pingSender = new Ping ();

    // Create a buffer of 32 bytes of data to be transmitted.
    string data = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    byte[] buffer = Encoding.ASCII.GetBytes (data);

    // Wait 10 seconds for a reply.
    int timeout = 10000;

    // Set options for transmission:
    // The data can go through 64 gateways or routers
    // before it is destroyed, and the data packet
    // cannot be fragmented.
    PingOptions options = new PingOptions (64, true);

    // Send the request.
    PingReply reply = pingSender.Send ("www.contoso.com", timeout, buffer, options);

    if (reply.Status == IPStatus.Success)
    {
        Console.WriteLine ("Address: {0}", reply.Address.ToString ());
        Console.WriteLine ("RoundTrip time: {0}", reply.RoundtripTime);
        Console.WriteLine ("Time to live: {0}", reply.Options.Ttl);
        Console.WriteLine ("Don't fragment: {0}", reply.Options.DontFragment);
        Console.WriteLine ("Buffer size: {0}", reply.Buffer.Length);
    }
    else
    {
        Console.WriteLine (reply.Status);
    }
}


/// <summary>通过CMD中的ping命令去得电脑上网IP</summary>
public static bool CmdPing(string strIp)
{
    bool returnvalue = false;
    Process p = new Process(); p.StartInfo.FileName = "cmd.exe";//设定程序名
    p.StartInfo.UseShellExecute = false; //关闭Shell的使用
    p.StartInfo.RedirectStandardInput = true;//重定向标准输入
    p.StartInfo.RedirectStandardOutput = true;//重定向标准输出
    p.StartInfo.RedirectStandardError = true;//重定向错误输出
    p.StartInfo.CreateNoWindow = true;//设置不显示窗口
    string pingrst; p.Start(); p.StandardInput.WriteLine("ping -n 2 -w 1 -S " + strIp + " " + "www.baidu.com");
    p.StandardInput.WriteLine("exit");
    string strRst = p.StandardOutput.ReadToEnd();
    if (strRst.IndexOf("(100% 丢失)") != -1 || strRst.IndexOf("(100% loss)") != -1)
    {
        pingrst = "无连接";
        returnvalue = false;
    }
    else
    {
        pingrst = "连接";
        returnvalue = true;
    }
    p.Close();


    return returnvalue;
}
```
