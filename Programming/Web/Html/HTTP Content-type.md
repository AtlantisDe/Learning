# HTTP Content-type

- [HTTP Content-type 对照表](https://tool.oschina.net/commons)
- [HTTP 报文头 Accept 和 Content-Type 总结 - 那啥快看 - 博客园](https://www.cnblogs.com/shamo89/p/10151968.html)

## 常用

```c#
1.Accept属于请求头， Content-Type属于实体头。
// Http报头分为通用报头，请求报头，响应报头和实体报头。
// 请求方的http报头结构：通用报头|请求报头|实体报头
// 响应方的http报头结构：通用报头|响应报头|实体报头

2.Accept代表发送端（客户端）希望接受的数据类型。
比如：Accept：text/xml（application/json）;
// 代表客户端希望接受的数据类型是xml（json ）类型
// Content-Type代表发送端（客户端|服务器）发送的实体数据的数据类型。

比如：Content-Type：text/html（application/json） ;
// 代表发送端发送的数据格式是html（json）。
// 二者合起来，

Accept:text/xml；
Content-Type:text/html

// 即代表希望接受的数据类型是xml格式，本次请求发送的数据的数据格式是html。


// 如果accept指定的类型和response返回的类型不一致，会出现406，not acceptable错误，对应到java spring工程，就是

HttpHeaders headers = new HttpHeaders();

headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE.toString());
// 如果head头里加了accept，那么@RequestMapping里的produces = "*/*"或produces = "application/json"
```
