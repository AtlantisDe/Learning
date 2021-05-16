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
where ilasm
C:\Windows\Microsoft.NET\Framework\v4.0.30319\ilasm.exe
where ildasm
C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.2 Tools\ildasm.exe

ILASM_v4.0.30319
C:\Windows\Microsoft.NET\Framework\v4.0.30319\ilasm.exe

ILDASM_v4.0.30319
C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6.1 Tools\ildasm.exe
C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.2 Tools\ildasm.exe
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
// CE(社区版)
// C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\Extensions\PreEmptiveSolutions\DotfuscatorCE\
// C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\Extensions\PreEmptiveSolutions\DotfuscatorCE\dotfuscator.exe
C:\Program Files (x86)\PreEmptive Solutions\Dotfuscator Professional Edition 4.9

dotfuscator Dotfuscator.xml
dotfuscator.exe
```

### 中文语言包

```c#
Global Options 全局配置/选项
Advanced 高级
Emit Debugging Symbols 发出调试符号
Inherit Obfuscation Attributes 继承混淆属性
Smart Obfuscation 智能混淆
Suppress ILdasm 支持ILdasm


Feature 特征
Disable Control Flow 禁用控制流
// Dsiable Renaming 也为 NO，即保证控制流和混淆功能打开，其他默认
// Rename 选项 勾选“use enhanced overload induction”（使用增强模式），
注意：不要勾选下方的“ Do not suppress on serializable types”，即序列化类型的变量不加密，否则编译后可能异常；
“Renaming Scheme” 选择“Unprintable”（不可打印字符，即乱码），也可以选择其他如小写字母、大写字符、数字的方式，如下图：
String Encryption 选项 include里勾选需要字符串加密的工程文件EXE、DLL等，点击Build，之后就可以啦：

Disable PreMark
Disable String Encryption 禁用字符串加密
use enhanced overload induction 使用增强的过载感应

Instrumentation 仪表
Merge Runtime 合并运行时

Unprintable 不可打印
```
