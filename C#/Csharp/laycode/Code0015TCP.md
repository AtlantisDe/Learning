# C# TCP

- [tcp连接的几个状态码 - iechenyb专栏 - CSDN博客](https://blog.csdn.net/iechenyb/article/details/78336826)
- [TCP/IP协议族(一) HTTP简介、请求方法与响应状态码 - 青玉伏案 - 博客园](https://www.cnblogs.com/ludashi/p/6232060.html)

## 状态码

```c#
// 在TCP层，有个FLAGS字段，这个字段有以下几个标识：SYN, FIN, ACK, PSH, RST, URG.
// 其中，对于我们日常的分析有用的就是前面的五个字段。
// 它们的含义是：
// SYN表示建立连接，
// FIN表示关闭连接，
// ACK表示响应，
// PSH表示有 DATA数据传输，
// RST表示连接重置。
```

## 三次握手

```c#
// 第一次握手：主机A发送位码为syn＝1，随机产生seq number=1234567的数据包到服务器，主机B由SYN=1知道，A要求建立联机；
// 第二次握手：主机B收到请求后要确认联机信息，向A发送ack number=(主机A的seq+1)，syn=1，ack=1，随机产生seq=7654321的包；
// 第三次握手：主机A收到后检查ack number是否正确，即第一次发送的seq number+1，以及位码ack是否为1，若正确，主机A会再发送ack number=(主机B的seq+1)，ack=1，主机B收到后确认seq值与ack=1则连接建立成功。
// 完成三次握手，主机A与主机B开始传送数据。
```