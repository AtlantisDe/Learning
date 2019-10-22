# GetHashCode

- [C# GetHashCode 在 x64 与 x86 版本下不一样 - zhaogaojian - 博客园](https://www.cnblogs.com/zhaogaojian/p/10417638.html)
- 最好指定一下目标平台
- [除版本库不同还有什么原因会影响 String.GetHashCode](https://ask.csdn.net/questions/341620)
- [关于 hashCode() 你需要了解的 3 件事 - 沙漏哟 - 博客园](https://www.cnblogs.com/yeahwell/p/7572496.html)

## 常用

```c#
var hash1 = "A".GetHashCode();
var hash2 = "a".GetHashCode();

var md51 = "A".Md5();
var md52 = "a".Md5();


```
