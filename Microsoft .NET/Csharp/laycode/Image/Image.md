# Image

- [C#Image 和 Icon 的相互转化](https://www.cnblogs.com/qq1223558/p/3651573.html)
- [c#中 image 和 byte[]的互相转换](https://www.cnblogs.com/zxk3200/articles/4244132.html)

```C#
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

### 参数是图片路径:返回 Byte[]类型

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

### 参数类型是 Image 对象，返回 Byte[]类型

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

### 参数是 Byte[]类型，返回值是 Image 对象

```C#
public System.Drawing.Image ReturnPhoto(byte[] streamByte)
{
    System.IO.MemoryStream ms = new System.IO.MemoryStream(streamByte);
    System.Drawing.Image img = System.Drawing.Image.FromStream(ms);
    return img;
}
```

### 参数是 Byte[] 类型，没有返回值（ASP.NET 输出图片）

```C#
public void WritePhoto(byte[] streamByte)
{
    // Response.ContentType 的默认值为默认值为“text/html”
    Response.ContentType = "image/GIF";
    //图片输出的类型有: image/GIF     image/JPEG
    Response.BinaryWrite(streamByte);
}
```
