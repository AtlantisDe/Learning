# .NET

- [C#汇总链接 搜索收藏](https://www.cnblogs.com/bycnboy/p/9040913.html)
- [C#利用委托线程实时刷新显示时间](https://jingyan.baidu.com/article/5d6edee2f701fd99eadeec31.html)
- [C# 获取当前方法的名称空间、类名和方法名称](https://www.cnblogs.com/cang12138/p/7714651.html)
- [C# List 分页](https://blog.csdn.net/rex_man/article/details/14120445)
- [C# List 实现假分页](https://blog.csdn.net/pengyan901120/article/details/82837447)
- [C# List 分页查询怎么实现](https://zhidao.baidu.com/question/406594247.html)
- [C#时间格式转换问题（12 小时制和 24 小时制）](https://www.cnblogs.com/LessIsMoreZ/p/7008867.html)
- [完美解决 C#中拖动 splitContainer 分割线时显示虚线问题](https://www.cnblogs.com/limj1987/p/8392786.html)
- [使用 SplitContainer 来实现隐藏窗口的部分内容（转）](https://www.cnblogs.com/liuxingleiyu/p/5882888.html)
- [C#的 SplitContainer 控件怎么样做可以又固定一边大小，又能实现拖动](https://bbs.csdn.net/topics/300029107)
- [窗体大小不可变、splitContainer1 固定 Panel 及分隔线](http://blog.sina.com.cn/s/blog_7d23f3570101afo7.html)
- [C#获取桌面路径](https://blog.csdn.net/qq_36051316/article/details/80026068)
- [C# 打开 txt 文件内容 与保存内容到 txt 文件](https://www.cnblogs.com/siyuanshuo/p/7297725.html)
- [C# winform 窗体弹出选择目录或文件 的对话框](https://www.cnblogs.com/su-king/p/5122026.html)
- [【C#】C#获取文件夹下的所有文件](https://www.cnblogs.com/willingtolove/p/9235353.html#_label1)
- [合并 byte 数组](https://www.cnblogs.com/yuwuji/p/8081897.html)
- [C# System.Guid.NewGuid() 格式化](https://www.cnblogs.com/AlanYN/p/6559418.html)
- [C# 字符串转义和反转义](https://www.cnblogs.com/sunxi/p/5073872.html)
- [C#中，能否获取文件路径中的文件名](https://zhidao.baidu.com/question/1433970480719842059.html)
- [C#将 Json 格式的数据进行转义操作](https://blog.csdn.net/weixin_39885282/article/details/80023758)
- [C# JavaScriptSerializer 序列化时的时间处理](https://www.cnblogs.com/basterdaidai/p/6212760.html)
- [C# JavaScriptSerializer 找不到引用](https://www.cnblogs.com/zhangjd/p/8135929.html)
- [C#里几种 Json 字符串特殊字符的转义](https://www.cnblogs.com/wuyujie/p/7656488.html)
- [C#读写 txt 文件的两种方法介绍 v](https://www.cnblogs.com/bingxing/p/7147562.html)
- [c#继承与构造函数的调用](https://www.cnblogs.com/chox/p/6722855.html)
- [C#中内嵌资源的读取](http://www.cnblogs.com/sanghg/p/8074745.html)
- [C# 给主程序签名及第三方 dll 强签名操作](https://www.cnblogs.com/xuliangxing/p/6708958.html)
- [Json.NET](https://www.newtonsoft.com/json)
- [C#单元测试使用 Fakes](https://www.cnblogs.com/shaoxuejun/p/5976162.html)
- [走进异步世界-犯傻也值得分享：ConfigureAwait(false)使用经验分享](http://www.cnblogs.com/cmt/p/configure_await_false.html)
- [c# UrlEncode,UrlDecode](https://www.cnblogs.com/lijea/p/4429073.html)
- [.NET DLL 保护措施详解（非混淆加密加壳）](https://www.cnblogs.com/dengxi/p/5750170.html)
- [interface](https://baike.baidu.com/item/interface/6070217?fr=aladdin)
- [C# 接口（Interface）](http://www.runoob.com/csharp/csharp-interface.html)
- [JSON 与 URL 参数互转](https://blog.csdn.net/lihefei_coder/article/details/81417311)

## What's this

```c#
   :::                                :::
 :::::::                             :::::
:::::::::                          ::::::::
:::::::::::::::::::::::::::::::::::::::::::
::::    :::    ::::::::::::::::   :::  ::::
:::    Smart    :::::cool::::    Crazy  :::
:::::   :::    :::::::::::::::    :::   :::
:::::::::::::::::::::::::::::::::::::::::::
```

## C#(.Net)引用

```c#
// packages 配置引用包
System.Web.Extensions
ResourceManager.GetObject("aaa", resourceCulture);
System.Reflection.Assembly Asmb = System.Reflection.Assembly.GetExecutingAssembly();
var Names = Asmb.GetManifestResourceNames();
string strName = Names[7];
System.IO.Stream ManifestStream = Asmb.GetManifestResourceStream(strName);
byte[] StreamData = new byte[ManifestStream.Length];
ManifestStream.Read(StreamData, 0, (int)ManifestStream.Length);

```

## VS 常用提醒坑

```c#
1. 如Newtonsoft.Json引用他,开发机器上,由于安装多个.net框架了,调试运行均正常.丢其它机器去,由于运行时都是4.0版本,但是目标框架如引用4.5框架时候就会报错.所以尽量可能选择4.0运行时和4.0编译的框架版本

```

## VS 项目

```c#
packages.config
```

## C#(.Net)代码

```c#
Math.Abs()
Newtonsoft.Json.JsonConvert.DeserializeObject<T>(config);
Newtonsoft.Json.JsonConvert.SerializeObject(obj);
Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, Ex.Message));
Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message));
Console.WriteLine(string.Format("Err[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message));
this.Invoke((EventHandler)delegate{});
//Wait for the MainFrame to finish loading
browser.FrameLoadEnd += (sender, args) =>
{
  //Wait for the MainFrame to finish loading
  if(args.Frame.IsMain)
  {
    args.Frame.ExecuteJavaScriptAsync("alert('MainFrame finished loading');");
  }
};
var url = new Uri(request.Url);
string strDesktopPath = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory);
System.Text.RegularExpressions.Regex.Unescape(s)
System.Text.RegularExpressions.Regex.Escape(s)
string wjm = s.Substring(s.LastIndexOf("\\")+1);
this.Icon = Properties.Resources.M;
```

## byte

```c#
byte[] bytes1 = { 1, 2, 3, 4, 5 };
byte[] bytes2 = { 6, 7, 8, 9 };
byte[] bytes3 = { 10, 11, 12, 13, 14, 15 };
byte[] allBytes1 = new byte[bytes1.Length + bytes2.Length + bytes3.Length];
            bytes1.CopyTo(allBytes1, 0);
            bytes2.CopyTo(allBytes1, bytes1.Length);
            bytes3.CopyTo(allBytes1, bytes1.Length + bytes2.Length);
            foreach (byte item in allBytes1)
            {
                Console.WriteLine(item);
            }

```

## c# UrlEncode,UrlDecode

```c#
HttpUtility.UrlEncode(text);  //utf-8 编码
HttpUtility.UrlDecode(text);  //utf-8 解码
HttpUtility.UrlEncode(text, System.Text.Encoding.GetEncoding(936));  //gb2312编码
HttpUtility.UrlDecode(text, System.Text.Encoding.GetEncoding(936));  //gb2312解码
```

## 发布出去的 DLL 所面临的风险 高手支招下如何保护.NET

```c#
// 一、混淆类的工具（如Dotfuscator，但是可以通过ILSpy、Reflector等反编译哦，直接COPY代码也能运行）
// 二、加密类的工具（如MaxToCode，网上有相应的破解教程）
// 三、加壳类的工具（如Sixxpack，网上有相应的破解教程）
// 四、强签名（签名只是防止项目中的某一个DLL被篡改了，不能防止反编译或反射的哦）
```

## interface

```c#
// 接口相当于程序开发的一组协议，需要此功能的类均可”继承”该方法和集合。
// 接口中的属性都是静态常量，方法都是抽象方法（即没有给出方法具体定义），一个类实现接口后，将继承接口中的所有静态常量。
// 实现接口中的抽象方法时，方法头必须与接口定义中的方法头完全相同（包括访问控制修饰符、返回值类型、参数列表等）
```
