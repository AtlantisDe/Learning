# GC

- [C#怎么使用 GC 强制回收资源 -CSDN 问答](https://ask.csdn.net/questions/333291?locationNum=2)

## 常用代码

### 强制回收

```c#
// 强行回收， 必须是，
GC.Collect();
// 但是也不是滥用的， 你最好贴出核心部分代码看看、
```

### while 会增加内存

```c#
while (true)
{


}

```

### while 正确用法

```C#
var gc_count_urls = 0;
while (true)
{
    CsharpLazycode.Module.Laycode.sys.WaitDelay(2 * 1000, true);
    gc_count_urls++; if (gc_count_urls > 5) { gc_count_urls = 0; GC.Collect(); } 
}
```
