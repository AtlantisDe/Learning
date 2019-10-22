# AppDomain

- [C#获取当前程序运行路径的方法集合](https://www.cnblogs.com/CSharpLover/p/5969017.html)

## 常用

### 获取和设置包含该应用程序的目录的名称。(推荐)

```c#
//获取当前 Thread 的当前应用程序域的基目录，它由程序集冲突解决程序用来探测程序集。
string str = System.AppDomain.CurrentDomain.BaseDirectory;
// result: X:\xxx\xxx\ (.exe文件所在的目录+"\")
```
