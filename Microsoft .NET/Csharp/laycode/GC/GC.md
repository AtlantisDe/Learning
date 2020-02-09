# GC

- [C#怎么使用 GC 强制回收资源 -CSDN 问答](https://ask.csdn.net/questions/333291?locationNum=2)
- [从 C#垃圾回收(GC)机制中挖掘性能优化方案-云栖社区-阿里云](https://yq.aliyun.com/articles/308021?spm=a2c4e.11153940.0.0.5c3d6306GPRplx)
- [gc.collect()清内存-云栖社区-阿里云](https://yq.aliyun.com/articles/667999)

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
var gc_counT_demousers = 0;
while (true)
{
    CsharpLazycode.Module.Laycode.sys.WaitDelay(2 * 1000, true);
    gc_counT_demousers++; if (gc_counT_demousers > 5) { gc_counT_demousers = 0; GC.Collect(); }
}
```

### 统计值

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace GarbageCollect
{
   class Program
   {
      static void Main(string[] args)
      {
         using(Factory f = new Factory())
         {
            f.MakeSomeGarbage();
            Console.WriteLine("Total memory is {0} KBs.", GC.GetTotalMemory(false) / 1024);
         }

         Console.WriteLine("After GC total memory is {0} KBs.", GC.GetTotalMemory(false) / 1024);

         Console.Read();
      }
   }
}
```
