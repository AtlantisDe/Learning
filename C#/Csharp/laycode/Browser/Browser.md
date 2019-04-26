# Browser

## 打开浏览器

## 方法一：从注册表中读取默认浏览器可执行文件路径

```C#
//从注册表中读取默认浏览器可执行文件路径
RegistryKey key = Registry.ClassesRoot.OpenSubKey(@"http\shell\open\command\");
string s = key.GetValue("").ToString();
//s就是你的默认浏览器，不过后面带了参数，把它截去，不过需要注意的是：不同的浏览器后面的参数不一样！
//"D:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -- "%1"
System.Diagnostics.Process.Start(s.Substring(0, s.Length - 8), "http://blog.csdn.net/testcs_dn");
```

## 调用 IE 浏览器

```C#
System.Diagnostics.Process.Start("iexplore.exe", "http://blog.csdn.net/testcs_dn");
```

## 调用系统默认的浏览器

```C#
System.Diagnostics.Process.Start("http://blog.csdn.net/testcs_dn");
```
