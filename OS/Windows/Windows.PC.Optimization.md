# Windows.PC.Optimization 电脑装机优化

## 1. 拒绝垃圾软件后台服务

```c#
// 拒绝权限: 完全访问权限
Icacls "C:\Tmp\1.txt" /deny Everyone:(F)


// Icacls "D:\SoftWare\Kingsoft\WPS Office\11.1.0.9912\office6\wpscenter.exe" /deny Everyone:(F)
Icacls "D:\SoftWare\Kingsoft\WPS Office\11.1.0.9912\office6\wpsinfo.exe" /deny Everyone:(F)
// Icacls "D:\SoftWare\Kingsoft\WPS Office\11.1.0.9912\office6\promecefpluginhost.exe" /deny Everyone:(F)
// Icacls "D:\SoftWare\Kingsoft\WPS Office\11.1.0.9912\office6\wpscloudsvr.exe" /deny Everyone:(F)




Icacls "C:\Program Files (x86)\SogouInput\9.8.0.3746\SogouCloud.exe" /deny Everyone:(F)


```

## 2. 鼠标优化配置

```c#
// Windows 10
1. 光标速度,个人设置:8
1. 滚动鼠标滚轮一次多行,设置每次滚动行数 个人一般设置:5

```

## 3. 夜间模式

```c#
// Windows 10
1. 夜间模式,个人设置:35
```

## 4. 开启 VT

- [电脑 VT 快速开启教程\_夜神安卓模拟器新手帮助页](https://www.yeshen.com/faqs/36pb5vYN9g)

```c#

```

## 5. 电脑没有休眠图标怎么办

- [电脑没有休眠图标怎么办-百度经验](https://jingyan.baidu.com/article/597035529272538fc00740cb.html)

```c#
// 按Win键+R调出   运行 ，输入powercfg -h on  并确定。
powercfg -h on

打开“系统和安全”------“更改电源按钮的功能” --------点击“更改当前不可用的设置”。

// 搜索 更改电源按钮的功能 即可

更改电源按钮的功能


// 方法2

按Win+X,选择“命令提示符”。


// 输入
powercfg.exe /hibernate on


重复 方法1 的第二步。
```

## 6. 多显示器分屏设置

```c#
// 请选择这一项
打开了窗口的任务栏


// 主任务栏和打开了窗口的任务栏  (不好用)


```
