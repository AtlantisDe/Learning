# Base64

## 常用方法

### Wiki

- [C＃实现 Base64 编码与解码 - 冷香残 - 博客园](https://www.cnblogs.com/lxc89/p/6574475.html)

### 基本用法

```c#
var a = Convert.FromBase64String("5L2g5aW9LOaIkemcgOimgee8lueggQ==");
var b= Encoding.UTF8.GetString(a);

//base64  to  string
string strPath =  "aHR0cDovLzIwMy44MS4yOS40Njo1NTU3L19iYWlkdS9yaW5ncy9taWRpLzIwMDA3MzgwLTE2Lm1pZA==";
byte[] outputb = Convert.FromBase64String(strPath);
strPath = Encoding.Default.GetString(outputb);


//string  to  base64
System.Text.Encoding encode = System.Text.Encoding.ASCII;
byte[]  bytedata = encode.GetBytes("test");
string strPath = Convert.ToBase64String(bytedata,0,bytedata.Length);
```

### 常遇到问题与解决方案

- [C# 出现 base-64 字符数组的无效长度的解决办法 - 晓晨 - 博客园](https://www.cnblogs.com/chendaoyin/archive/2013/06/28/3161579.html)

### base-64 字符数组的无效长度

```text
最近的一个项目，在传递参数时，在Win2003上正常，在Win7下抛出“base-64 字符数组的无效长度”这样的错误
对比了一下经过Convert.ToBase64String()转换过的参数发现，+都变成了空格
于是在传递参数前，使用Replace("+", "%2B")，目标页使用Replace("%2B", "+")，这样一替换，问题就解决了
```
