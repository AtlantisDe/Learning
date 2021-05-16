# Image

- [Image.FromFile Method (System.Drawing)](https://docs.microsoft.com/en-us/dotnet/api/system.drawing.image.fromfile?view=dotnet-plat-ext-5.0)
- [C#Image 和 Icon 的相互转化](https://www.cnblogs.com/qq1223558/p/3651573.html)
- [c#中 image 和 byte[]的互相转换](https://www.cnblogs.com/zxk3200/articles/4244132.html)

```C#
private void DemonstratePropertyItem(PaintEventArgs e)
{

    // Create two images.
    Image image1 = Image.FromFile("c:\\FakePhoto1.jpg");
    Image image2 = Image.FromFile("c:\\FakePhoto2.jpg");

    // Get a PropertyItem from image1.
    PropertyItem propItem = image1.GetPropertyItem(20624);

    // Change the ID of the PropertyItem.
    propItem.Id = 20625;

    // Set the PropertyItem for image2.
    image2.SetPropertyItem(propItem);

    // Draw the image.
    e.Graphics.DrawImage(image2, 20.0F, 20.0F);
}



Image img = Image.FromHbitmap(icon.ToBitmap().GetHbitmap());
Graphics g = Graphics.FromImage(img);
g.DrawImage(img, 0, 0, img.Width, img.Height);
Font f = new Font("Verdana", 32);
Brush b = new SolidBrush(Color.Red);
g.DrawString("!!!", f, b,0, 0);
Icon  icon = Icon.FromHandle(((Bitmap)img).GetHicon());
g.Dispose();
```

## c#中 image 和 byte[]的互相转换

### 1. 参数是图片路径:返回 Byte[]类型

```C#
//参数是图片的路径
public byte[] GetPictureData(string imagePath)
{
    FileStream fs = new FileStream(imagePath, FileMode.Open);
    byte[] byteData = new byte[fs.Length];
    fs.Read(byteData, 0, byteData.Length);
    fs.Close();
    return byteData;
}
```

### 2. 参数类型是 Image 对象，返回 Byte[]类型

```C#
//将Image转换成流数据，并保存为byte[]
public byte[] PhotoImageInsert(System.Drawing.Image imgPhoto)
{
    MemoryStream mstream = new MemoryStream();
    imgPhoto.Save(mstream, System.Drawing.Imaging.ImageFormat.Bmp);
    byte[] byData = new Byte[mstream.Length];
    mstream.Position = 0;
    mstream.Read(byData, 0, byData.Length); mstream.Close();
    return byData;
}
```

### 3. 参数是 Byte[]类型，返回值是 Image 对象

```C#
public System.Drawing.Image ReturnPhoto(byte[] streamByte)
{
    System.IO.MemoryStream ms = new System.IO.MemoryStream(streamByte);
    System.Drawing.Image img = System.Drawing.Image.FromStream(ms);
    return img;
}
```

### 4. 参数是 Byte[] 类型，没有返回值（ASP.NET 输出图片）

```C#
public void WritePhoto(byte[] streamByte)
{
    // Response.ContentType 的默认值为默认值为“text/html”
    Response.ContentType = "image/GIF";
    //图片输出的类型有: image/GIF     image/JPEG
    Response.BinaryWrite(streamByte);
}
```

### 5. Watermark / generate an image from text

- [How to Add a Watermark to an Image In C#](https://www.c-sharpcorner.com/blogs/using-c-sharp-write-text-on-image)
- [How to generate an image from text on fly at runtime](https://stackoverflow.com/questions/2070365/how-to-generate-an-image-from-text-on-fly-at-runtime)
- [Graphics.MeasureString Method (System.Drawing)](https://docs.microsoft.com/en-us/dotnet/api/system.drawing.graphics.measurestring?redirectedfrom=MSDN&view=dotnet-plat-ext-5.0#System_Drawing_Graphics_MeasureString_System_String_System_Drawing_Font_)
- [C# 图片的裁剪，两个图片合成一个图片 - yan_jinLiang - 博客园](https://www.cnblogs.com/yanjinliang/p/5972038.html)
- [Generate Image from text using C# OR Convert Text in to Image using C#](https://chiragrdarji.wordpress.com/2008/05/09/generate-image-from-text-using-c-or-convert-text-in-to-image-using-c/)
- [Error Happened](https://web.archive.org/web/20140105033449/http://tech.pro/tutorial/654/csharp-snippet-tutorial-how-to-draw-text-on-an-image)
- [How to make high qaulity image with text in C# - CodeProject](https://www.codeproject.com/Questions/388845/HOW-TO-MAKE-HIGH-QAULITY-IMAGE-WITH-TEXT-IN-Csharp)
- [How to generate a image with text and images in C#](https://stackoverflow.com/questions/14975980/how-to-generate-a-image-with-text-and-images-in-c-sharp?rq=1)
- [C# 文字圖片生成與背景圖片合成 - IT 閱讀](https://www.itread01.com/content/1517209408.html)
- [C#一些常用的图片操作方法：生成文字图片 合并图片等 - 晓晨 Master - 博客园](https://www.cnblogs.com/stulzq/p/6137715.html)

```C#
private Image DrawText(String text, Font font, Color textColor, Color backColor)
{
    //first, create a dummy bitmap just to get a graphics object
    Image img = new Bitmap(1, 1);
    Graphics drawing = Graphics.FromImage(img);

    //measure the string to see how big the image needs to be
    SizeF textSize = drawing.MeasureString(text, font);

    //free up the dummy image and old graphics object
    img.Dispose();
    drawing.Dispose();

    //create a new image of the right size
    img = new Bitmap((int) textSize.Width, (int)textSize.Height);

    drawing = Graphics.FromImage(img);

    //paint the background
    drawing.Clear(backColor);

    //create a brush for the text
    Brush textBrush = new SolidBrush(textColor);

    drawing.DrawString(text, font, textBrush, 0, 0);

    drawing.Save();

    textBrush.Dispose();
    drawing.Dispose();

    return img;

}
```
