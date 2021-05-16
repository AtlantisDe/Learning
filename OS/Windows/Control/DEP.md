# DEP

- [关掉该死的 DEP（数据执行保护，仅针对 win7） - 邹邹的博客 - CSDN 博客](https://blog.csdn.net/yxwmzouzou/article/details/50070875)

## 关闭

```c#
// 关闭DEP的方法:

bcdedit.exe/set {current} nx AlwaysOff

// （1）先找到“命令运行符”-〉右击“以管理员身份运行”
// （2）在CMD中输入：bcdedit.exe/set {current} nx AlwaysOff
// （3）“操作完成”就可以了，关闭并保存所有的东西。
// （4）重新启动计算机生效。
```
