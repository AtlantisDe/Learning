# Windows Service

- [使用 C#创建 Windows 服务 - jack_Meng - 博客园](https://www.cnblogs.com/mq0036/p/7875864.html)

## 常常遇到问题

### 经测试服务模块不同系统可能安装不成功

### .NET 安装需要引用两个程序集

```c#
using System.Collections;
using System.ServiceProcess;
```

### 安装完服务 看不到服务名称

- 看不到服务名称
- 可能当前使用账户不是 Administrator

### Unable to Open Database

- 请用管理员权限

```c#
Unable to open the Security Manager Database.
Please make certain that you have sufficient permissions to perform this operation.
// 无法打开Security Manager数据库。
// 请确保您具有足够的权限来执行此操作。
```

### 如果应用程序没有控制台或控制台输入已通过文件进行了重定向，则无法读取键。请尝试使用 Console.Read

- 原来笔者的这个工程是一个 Window 窗口应用程序，只有在 Console 控制台应用程序中才能使用 Console 类的函数。
- [法 - 射手熊能能的博客 - CSDN 博客](https://blog.csdn.net/Sagittarius_bear/article/details/52233040)
