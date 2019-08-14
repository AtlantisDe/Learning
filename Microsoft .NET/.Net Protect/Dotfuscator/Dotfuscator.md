# Dotfuscator

- [Dotfuscator CE](https://www.preemptive.com/products/dotfuscator-ce?id=267909)
- [Dotfuscator Community - Visual Studio](https://docs.microsoft.com/en-us/visualstudio/ide/dotfuscator/?view=vs-2019)
- [dotfuscator 使用方法 - 脸谱匠 - 博客园](https://www.cnblogs.com/icyJ/p/dotfuscator.html)
- [C#之 Dotfuscator Pro 的使用 - IT 閱讀](https://www.itread01.com/content/1529675914.html)
- [dofuscator C# 混淆器 原来如此](https://www.cnblogs.com/slowtech/p/4752142.html)
- [Install Dotfuscator Community - Visual Studio](https://docs.microsoft.com/en-us/visualstudio/ide/dotfuscator/install?view=vs-2019)
- [Dotfuscator - .NET Obfuscator &amp; App Hardening - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=PreEmptiveSolutions.NETObfuscator-Dotfuscator)
- [VS 自带的混淆器 Dotfuscator 安装破解图文教程](https://www.jb51.net/softs/596730.html)
- [VS 自带代码混淆器 DotFuscator 的使用步骤 - Drinko - 博客园](https://www.cnblogs.com/drinkoJam/p/3618548.html)

## official

- [Dotfuscator Community - Visual Studio](https://docs.microsoft.com/en-us/visualstudio/ide/dotfuscator/?view=vs-2019)
- [Dotfuscator Downloads](https://www.preemptive.com/products/dotfuscator/downloads)

## 用法

### Where are the SDK tools? Where is ildasm

- [Where are the SDK tools? Where is ildasm?](https://blogs.msdn.microsoft.com/lucian/2008/11/14/where-are-the-sdk-tools-where-is-ildasm/)

### dotfuscator 在混淆.Net Framework 4.0 以上版本的时候报错的解决方法

- [dotfuscator 在混淆.Net Framework 4.0 以上版本的时候报错的解决方法 - Leckun 的专栏 - CSDN 博客](https://blog.csdn.net/winnyrain/article/details/17141331)

- 要混淆不同的.Net Framework 版本需要在 Settings，Project Properties，添加配置如下。
- 其中 ILASM 和 ILDASM 后面必需要加上对应版本的版本号，然后文件引用对应的版本文件即可。

```c#
ILASM_v4.0.30319
C:\Windows\Microsoft.NET\Framework\v4.0.30319\ilasm.exe

ILDASM_v4.0.30319
C:\Program Files\Microsoft SDKs\Windows\v8.0A\bin\NETFX 4.0 Tools\ildasm.exe

C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\bin\x64\ildasm.exe
C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6.2 Tools\ildasm.exe
C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6.1 Tools\x64\ildasm.exe
C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.2 Tools\x64\ildasm.exe

C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin
```

### Command Line 命令行

- [.NET 混淆器 Dotfuscator 使用教程：命令行（Command Line） - stefan520 的专栏 - CSDN 博客](https://blog.csdn.net/stefan520/article/details/8809990)

```c#
dotfuscator Dotfuscator.xml
```
