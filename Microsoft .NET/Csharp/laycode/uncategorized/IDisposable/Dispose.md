# Dispose

- [C# Dispose()释放顺序杂谈 - 竹木人 - 博客园](https://www.cnblogs.com/lonelyDog/archive/2012/02/17/2355430.html)

```c#
// Dispose与Close没有任何关系.它们的共同点是遵循一个相似的约定.
// Dispose的约定是,这个方法将释放该实例所占用的所有资源,销毁自身.
// 注意Dispose的约定是释放所有资源并销毁自身,就是说大多数情况下,被Dispose掉的实例都不应该被再次使用.
// 如果一个类同时拥有Dispose和Close方法,一般来说,Dispose中都会调用Close方法.

Close   只是关闭而已,没有释放真正的释放资源,可以重新打开
Dispose   是把对象销毁,将不再存在

Close是停业整顿，Dispose是炸毁；
Close是关门，Dispose是破产。
```
