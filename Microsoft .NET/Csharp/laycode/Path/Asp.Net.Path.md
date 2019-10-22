# Asp.Net.Path

- [C#获取当前程序运行路径的方法集合](https://www.cnblogs.com/CSharpLover/p/5969017.html)
- [https://blog.csdn.net/weizhiai12/article/details/7202316](https://blog.csdn.net/weizhiai12/article/details/7202316)
- [https://blog.csdn.net/okkk/article/details/5583369](https://blog.csdn.net/okkk/article/details/5583369)

## 常用

### 常用代码

```c#

```

### Server.MapPath 和 Request.PhysicalApplicationPath 的异同

```C#
- [Server.MapPath 和 Request.PhysicalApplicationPath 的异同 - 帝都蜗牛 - 博客园](https://www.cnblogs.com/MrWby/p/4349962.html)

// 1、相对当前路径的文件操作：可以使用
Server.MapPath("test.txt")、Server.MapPath("a/test.txt")、Server.MapPath("../b/test.txt")
// 这个时候使用Request.PhysicalApplicationPath就很难定位到文件；

// 2、绝对路径的文件操作：
// 这个时候两者都可以，有点注意的是Server.MapPath中的绝对是“面向”站点而言的，不会因为“虚拟目录”本身的属性不同而变化，Request.PhysicalApplicationPath就并非如此。
// 打个比方：主站点指向
D:\wwwroot\，虚拟目录指向E:\wwwroot\a\，取名为a。

那么如果我要操作虚拟目录下的
E:\wwwroot\a\test.txt，可以使用Server.MapPath("/a/test.txt")，又或者直接使用Server.MapPath("~/test.txt")；

那么用Request.PhysicalApplicationPath该怎么写？
很多人数是：Request.PhysicalApplicationPath + "test.txt"，我说不一定，为什么？
// 因为要是该虚拟目录有单独的应用池，Request.PhysicalApplicationPath就是E:\wwwroot\a\，后面加上test.txt就是E:\wwwroot\a\test.txt；
// 但要是该虚拟目录没有单独的应用池，Request.PhysicalApplicationPath就是D:\wwwroot\，不管你后面怎么加，都定位不到我要找到文件了。呵呵……

篇幅太长..打开网页看...
```
