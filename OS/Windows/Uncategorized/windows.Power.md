# windows.Power

- [windows10 睡眠被自动更新唤醒的解决方法－系统城](http://www.xitongcheng.com/jiaocheng/win10_article_39503.html)
- [win10 睡眠后自动唤醒解决方法-百度经验](https://jingyan.baidu.com/article/2fb0ba40f44ef900f2ec5fd3.html)

## 常用

```c#
powercfg -lastwake
// 执行该命令后，系统会显示唤醒历史记录计数值。

// 在Windows 10“开始”菜单中依次选择“设置→系统→电源和睡眠”，然后在电源和睡眠窗口中选择“其他电源设置”；
// 在电源选项窗口中选择“更改电源计划”，打开“编辑计划设置”窗口，然后点击“更改高级电源设置”文字链接；
// 在随后打开的电源选项高级设置窗口中，依次选择“睡眠→允许使用唤醒定时器→设置：禁用”，确定即可。

依次选择“睡眠→允许使用唤醒定时器→设置：禁用”，确定即可。
```
