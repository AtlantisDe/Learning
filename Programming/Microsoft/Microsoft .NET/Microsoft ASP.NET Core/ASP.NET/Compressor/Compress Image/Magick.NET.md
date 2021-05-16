# Magick.NET

- [ImageMagick](https://imagemagick.org/script/index.php)
- [dlemstra/Magick.NET](https://github.com/dlemstra/Magick.NET)
- [C#图片压缩 玄火的专栏-CSDN 博客](https://blog.csdn.net/gis_101/article/details/51398454)
- [How to adjust jpeg quality with Magick.Net](https://stackoverflow.com/questions/19884486/how-to-adjust-jpeg-quality-with-magick-net)
- [https://adebayoadesegun.hashnode.dev/compressing-images-in-c-using-magicknet-ck2gokxwg00jdwks18lcl5ly2](https://adebayoadesegun.hashnode.dev/compressing-images-in-c-using-magicknet-ck2gokxwg00jdwks18lcl5ly2)
- [c# - Magick.NET 减少 gif 文件大小 - IT 工具网](https://www.coder.work/article/2919283)
- [ImageMagick/ImageMagick](https://github.com/ImageMagick/ImageMagick/discussions)
- [dlemstra/Magick.NET](https://github.com/dlemstra/Magick.NET/blob/fe49f46898f0d06cf866cfe2d2d79a999775bf56/tests/Magick.NET.Tests/Shared/Settings/MagickReadSettingsTests.cs)

## 1. 常用

```c#
// 另外一点使用Magick.NET要注意，Magick.NET有64/32位之分，当然也有适应64/32位系统的库。也就是说Magick.NET有三个版本，32位、64位以及AndyCPU版。使用时还需注意资源的释放，.NET的程序员习惯把资源回收任务交给.NET垃圾回收机制进行处理。其实对于消耗资源的操作，必要时应该手动释放资源，毕竟.NET垃圾回收不是万能的，批量操作很有可能导致资源无法及时释放而出异常，严重点也许会爆内存。




F1(true);
/// <summary>图片压缩</summary>
bool F1(bool IsDebug = false)
{
    if (IsDebug == false) { return false; }

    string sFile;
    string dFile;

    sFile = $@"D:\TestEmpire\Logs\Images\t0123393b7eb1a4f921.gif";
    dFile = $@"D:\TestEmpire\Logs\Images\t0123393b7eb1a4f921_1.gif";

    sFile = $@"D:\TestEmpire\Logs\Images\t01d31649031655eb16.jpg";
    dFile = $@"D:\TestEmpire\Logs\Images\t01d31649031655eb16_1.jpg";



    TestEmpire.Net.Collection.Engine.Article.Util.Images.CompressImage(sFile, dFile,50,80);

    using (var image = new ImageMagick.MagickImage(sFile))
    {
        image.Quality = 75;
        //image.Format = ImageMagick.MagickFormat.Gif;
        //image.Resize(1000, 1000);

        image.Write(dFile);
        image.AdaptiveResize(1000,600);

    }

    return true;
}


MagickImage image = new MagickImage（path）;//获得一个图片对象
image.Quality = 100;//进行无损压缩
image.Resize（1000,1000）; //整体进行尺寸调整
string SaveToPath = @rootPath +“\\”+ reName +“resize.jpg”;//对保存路径进行编辑
image.Write（SaveToPath）;//以流的方式写入目标路径
image.Dispose（）;//对象进行释放


collection = new MagickImageCollection("E:\\temp\\201710.gif");

using (var image = new ImageMagick.MagickImage(sFile))
{
    image.Quality = 75;
    //image.Format = ImageMagick.MagickFormat.Gif;
    //image.Resize(1000, 1000);

    image.Write(dFile);
    image.AdaptiveResize(1000, 600);

}

using (MagickImage sprite = images.AppendHorizontally())
{
    sprite.Format = MagickFormat.Jpeg;
    sprite.Quality = 10;
    sprite.Resize(40, 40);
    sprite.Write(spriteFile);
}

using (MagickImage image = new MagickImage("Snakeware.gif"))
{
  // Save frame as jpg
  image.Write("Snakeware.jpg");
}

// Write to stream
MagickReadSettings settings = new MagickReadSettings();
// Tells the xc: reader the image to create should be 800x600
settings.Width = 800;
settings.Height = 600;

using (MemoryStream memStream = new MemoryStream())
{
  // Create image that is completely purple and 800x600
  using (MagickImage image = new MagickImage("xc:purple", settings))
  {
 // Sets the output format to png
 image.Format = MagickFormat.Png;
 // Write the image to the memorystream
 image.Write(memStream);
  }
}

// Read image from file
using (MagickImage image = new MagickImage("Snakeware.png"))
{
  // Sets the output format to jpeg
  image.Format = MagickFormat.Jpeg;
  // Create byte array that contains a jpeg file
  byte[] data = image.ToByteArray();
}
```

## 2. 安装

- [Magick.NET-Q8-x64 7.21.1](https://www.nuget.org/packages/Magick.NET-Q8-x64/)
- [Magick.NET.Core 4.1.0](https://www.nuget.org/packages/Magick.NET.Core/)

```c#
Magick.NET-Q8-x64
Magick.NET.Core

Install-Package Magick.NET-Q8-x64 -Version 7.21.1
Install-Package Magick.NET.Core -Version 4.1.0
```

## 3. 其它 DEMO

```c#

        public class ImageProcess
        {
            private string _inputPath;
            private string _outputPath;
            private int _resizeToHeight;
            private int _resizeToWidth;
            public ImageProcess(string inputPath, string outPutPath, int resizeHeight = 650, int resizeWidth = 600)
            {
                _inputPath = inputPath;
                _outputPath = outPutPath;
                _resizeToHeight = resizeHeight;
                _resizeToWidth = resizeWidth;
            }

            /// <summary>
            /// Compress Image
            /// </summary>
            /// <returns></returns>
            public Tuple<bool, string> CompressImage()
            {
                try
                {
                    using (var image = new MagickImage(_inputPath))
                    {
                        var geometry = new MagickGeometry
                        {
                            Height = _resizeToHeight,
                            Width = _resizeToWidth,
                            IgnoreAspectRatio = false,
                            Greater = true
                        };
                        image.Resize(geometry);

                        using (var stream = new MemoryStream())
                        {
                            image.Write(stream);
                            byte[] imageByte = stream.ToArray();
                            File.WriteAllBytes(_outputPath, imageByte);
                        }
                    }
                    return new Tuple<bool, string>(true, $"Image saved to {_outputPath}");
                }
                catch (MagickException ex) // Catch Magick ExceptionErrors
                {
                    throw ex;
                }
                catch (Exception ex) // Catch Exception Errors
                {
                    throw ex;
                }
            }
        }

```
