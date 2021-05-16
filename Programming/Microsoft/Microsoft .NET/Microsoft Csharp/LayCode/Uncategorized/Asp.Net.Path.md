# Asp.Net.Path

- [C#获取当前程序运行路径的方法集合](https://www.cnblogs.com/CSharpLover/p/5969017.html)
- [https://blog.csdn.net/weizhiai12/article/details/7202316](https://blog.csdn.net/weizhiai12/article/details/7202316)
- [https://blog.csdn.net/okkk/article/details/5583369](https://blog.csdn.net/okkk/article/details/5583369)
- [ASP.NET 虚拟路径小结 - njl_041x - 博客园](https://www.cnblogs.com/njl041x/p/3625248.html)

## 常用

- [ASP.NET 获取 web 应用程序的路径](https://www.cnblogs.com/ToFlying/p/3182396.html)

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

### 示例

```c#

                            //本地路径转换成URL相对路径
                              string urlconvertor(string imagesurl1)
                            {
                                string tmpRootDir = Server.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath.ToString());//获取程序根目录
                                string imagesurl2 = imagesurl1.Replace(tmpRootDir, ""); //转换成相对路径
                                imagesurl2 = imagesurl2.Replace(@"\", @"/");
                                return imagesurl2;
                            }
                            //相对路径转换成服务器本地物理路径
                              string urlconvertorlocal(string imagesurl1)
                            {
                                string tmpRootDir = Server.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath.ToString());//获取程序根目录
                                string imagesurl2 = tmpRootDir + imagesurl1.Replace(@"/", @"\"); //转换成绝对路径
                                return imagesurl2;
                            }

```

### ASP.NET 虚拟路径小结

```c#
一、虚拟路径的概念

“虚拟路径”是指请求 URL 中跟在服务器标识符后面的部分举例。

如绝对路径：http://www.mysite.com/MyApp/Default.aspx，其对应的虚拟路径为：/MyApp/Default.aspx。

二、虚拟路径符号

“/”网站根目录。网站根目录即路径中的域名部分，如http://www.mysite.com/。
“./”当前目录。
“../”上级目录。
“~”应用程序根目录。~ 运算符只能为服务器控件识别，由ASP.NET解析。 不能将 ~ 运算符用于客户端元素。
三、绝对 URL 路径

如：http://www.mysite.com/MyApp/Default.aspx

四、网站根目录相对路径

此路径将根据网站根目录进行解析。如/images/logo.png

五、应用程序绝对路径

由ASP.NET动态解析，当为网站时与网站根目录表示相同，当为虚拟目录时为网站根目录+虚拟目录名

六、获取应用程序绝对路径

方法一：VirtualPathUtility.ToAbsolute(String)

方法二：Page.ResolveUrl(String)

举例：

VirtualPathUtility.ToAbsolute("~/Default.aspx ");

Page.ResolveUrl("~/Default.aspx ");

应用程序部署为站点，输出为：/Default.aspx

应用程序部署为虚拟目录（MyApp），输出为：/MyApp/Default.aspx

七、比较网站根目录(/) 与 应用程序根目录(~)



概念

使用范围

优点

缺点

“/”

网站根目录

客户端及服务器端

资源文件只相对于网站根目录进行解析，在站点内任何位置被引用均有效，即消除了文件目录层级改变对资源文件引用的影响

当应用程序部署为虚拟目录时，无法自动解析出虚拟目录，致使资源应用无效

“~”

应用程序根目录

服务器端

同上，并且当应用程序部署为虚拟目录时，会自动解析出虚拟目录，返回正确的引用地址



八、网站根目录相对路径 与 应用程序绝对路径 解析结果示例说明



网站

虚拟目录(MyApp)

/images/logo.png

/images/logo.png

/images/logo.png

~/images/logo.png

/images/logo.png

/MyApp/images/logo.png




网站

虚拟目录

<asp:Image ID="Image1" runat="server" ImageUrl="/images/logo.png" />

正常显示

无法显示（除非网站目录下恰巧也存在同样的资源文件）

<asp:Image ID="Image2" runat="server" ImageUrl="~/images/logo.png" />

正常显示

正常显示



总结说明：“~”为ASP.NET应用程序根目录动态运算符，能够正确地解析出客户端所需的地址路径，消除了虚拟目录及文件目录层级变化所带来的影响。其他路径表示一旦给出即为静态，当目录结构发生变化时，会有一定的影响。
```
