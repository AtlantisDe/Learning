# Fastest way to get Width and Height of Jpg without opening image using C# and threading

- [Fastest way to get Width and Height of Jpg without opening image using C# and threading](https://stackoverflow.com/questions/34453950/fastest-way-to-get-width-and-height-of-jpg-without-opening-image-using-c-sharp-a)

```c#
public void GetJpegImageSizeAndRes(string filename, out int width, out int height, out float res)
    {
        using (var sr = new FileStream(filename, FileMode.Open, FileAccess.Read, FileShare.Read))
        {
            var sz = Image.FromStream(sr, false, false).Size;
            res = Image.FromStream(sr, false, false).HorizontalResolution;
            width= sz.Width;
            height = sz.Height;
        }
    }
```

## 代码

- 获取图片尺寸大小

```c#
  public Size GetJpegImageSize(string filename)
            {
                var size = new Size();

                using (var sr = new FileStream(filename, FileMode.Open, FileAccess.Read, FileShare.Read))
                {
                    var sz = Image.FromStream(sr, false, false).Size;
                    var res = Image.FromStream(sr, false, false).HorizontalResolution;
                    size.Width = sz.Width;
                    size.Height = sz.Height;
                }
                return size;
            }

```
