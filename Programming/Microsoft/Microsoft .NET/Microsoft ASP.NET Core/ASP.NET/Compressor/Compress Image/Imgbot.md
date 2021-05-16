# Imgbot

- [dabutvin/Imgbot](https://github.com/dabutvin/Imgbot)
- [c# 无损高质量压缩图片代码 - 衆尋 - 博客园](https://www.cnblogs.com/ZXdeveloper/p/6841878.html)
- [Imgbot - Automatic image compression](https://imgbot.net/)
- [C# 大图片压缩算法，减少图片体积 - 代码描绘人生 - 博客园](https://www.cnblogs.com/testsec/p/6095939.html)
- [c#无损压缩图片代码，可设置压缩质量](https://www.leavescn.com/Articles/Content/1120)

## 其它代码

```c#
using (FileStream file = new FileStream(sFile, FileMode.Open))
{
    var img = CompressionImage(file, 50L);
    CreateImageFromBytes(dFile, img);
}
```
