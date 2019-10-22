# C# HTTP

- [TCP/IP 协议族(一) HTTP 简介、请求方法与响应状态码 - 青玉伏案 - 博客园](https://www.cnblogs.com/ludashi/p/6232060.html)
- [http 请求是如何先建立的三次握手?\_慕课手记](https://www.imooc.com/article/71293)
- [HTTP 请求过程-域名解析和 TCP 三次握手建立链接 - 小 Cai 先森 - 博客园](https://www.cnblogs.com/caijh/p/7698819.html)
- [关于三次握手与四次挥手你要知道这些 - 经验 - 皮皮看书](https://www.ppkanshu.com/index.php/post/4453.html)
- [Http协议再理解（一）经典模型、三次握手、四次挥手](https://www.jianshu.com/p/bd31d3b23725)

## 状态码

- [HTTP 状态码详解](http://tool.oschina.net/commons?type=5)
- [HTTP 状态码\_百度百科](https://baike.baidu.com/item/HTTP%E7%8A%B6%E6%80%81%E7%A0%81/5053660?fr=aladdin)

```c#
第一次握手：客户端向服务器发送SYN报文，并发送客户端初始序列号Seq=X；等待服务器确认，

　　第二次握手：服务器接收客户端的SYN报文，然后向客户端返回一个包SYN+ACK响应报文，并发送初始序列号Seq=Y

　　第三次握手：客户端接受SYN+ACK报文，并向服务器发送一个ACK确认报文，至此连接建立

　　【建立连接的最重要目是让连接的双方交换初始序号(ISN, Initial Sequence Number)，所以再响应的ACK报文中会包含序列号递增序列】
```

## 其它

```c#
CookieContainer cc = new CookieContainer();
HttpItems items = new HttpItems();
HttpHelpers helper = new HttpHelpers();
HttpResults hr = new HttpResults();

string cookie = "";
items = new HttpItems();
items.Container = cc;
items.Cookie = cookie;
items.URL = urlitem.url;
items.Referer = "";
items.Method = "GET";
items.Postdata = "";
items.ResultType = ResultType.So;
items.Allowautoredirect = true;
hr = helper.GetHtml(items);

urlitem.StatusCode = hr.StatusCode;
if (hr.StatusCode == HttpStatusCode.OK)
{

}
else
{
    urlitem.Message = "本地网络检测环节,有异常,状态码:" + hr.StatusCode;
    return ipitemStates;
}
```

### 1. 什么是 syn flood 攻击

```c#
syn flood 是一种经典的 ddos 攻击手段，这里面用到了 TCP 三次握手存在的漏洞。当服务端接收到 SYN 后进入 SYN-RECV 状态，此时的连接称为半连接，同时会被服务端写入一个半连接队列。如果攻击者在短时间内不断的向服务端发送大量的 SYN 包而不响应，那么服务器的半连接队列很快会被写满，从而导致无法工作。 实现 syn flood 的手段，可以通过伪造源 IP 的方式，这样服务器的响应就永远到达不了客户端(握手无法完成)；当然，通过设定客户端防火墙规则也可以达到同样的目的。对 syn flood 实现拦截是比较困难的，可以通过启用 syn_cookies 的方式实现缓解，但这通常不是最佳方案。最好的办法是通过专业的防火墙来解决，基本上所有的云计算大 都具备这个能力。

四次挥手
```
