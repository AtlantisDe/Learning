# Blog.Core

- [K 快速上手 | Blog.Core](http://apk.neters.club/.doc/guide/getting-started.html)
- [Blog.Core.Webapi.Template 2.1.0](https://www.nuget.org/packages/Blog.Core.Webapi.Template/)

## 快速上手

```c#
// 注意
// 请确保你的 Visual Studio 2019 版本 >= 16.4。

```

## 编译与运行

1、拿到项目后，双击 Blog.Core.sln 解决方案；
2、首先 F6 编译，看是否有错误；
3、然后 F5 运行，调起 8081 端口，浏览器查看效果；
4、因为系统默认的是 sqlite 数据库，如果你想换其他数据库，请看下边；
5、注意：本系统是直接自动生成数据库和数据的，不用手动创建数据库；

## 常常遇到问题

```c#
:“Repository.dll和service.dll 丢失，因为项目解耦了，所以需要先F6编译，再F5运行，请检查 bin 文件夹，并拷贝。”

```
