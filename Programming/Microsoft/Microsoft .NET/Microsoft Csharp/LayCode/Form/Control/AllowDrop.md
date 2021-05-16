# AllowDrop

- [Control.AllowDrop Property (System.Windows.Forms)](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.control.allowdrop?view=netcore-3.1)
- [C#-支持文件拖拽 - 墨鱼菜鸡 - 博客园](https://www.cnblogs.com/csnd/p/12062175.html)

## 1. 常用

```c#
// 简单语法示例
// Drag Enter 拖动回车
// Drag Drop 拖放

public UcAledbImport()
{
    InitializeComponent();
    this.AllowDrop = true;
    this.DragDrop += UcAledbImport_DragDrop;
    this.DragEnter += UcAledbImport_DragEnter;

}

private void UcAledbImport_DragEnter(object sender, DragEventArgs e)
{
    throw new NotImplementedException();
}

private void UcAledbImport_DragDrop(object sender, DragEventArgs e)
{
    throw new NotImplementedException();
}

private Image picture;
private Point pictureLocation;

public Form1()
{
   // Enable drag-and-drop operations and
   // add handlers for DragEnter and DragDrop.
   this.AllowDrop = true;
   this.DragDrop += new DragEventHandler(this.Form1_DragDrop);
   this.DragEnter += new DragEventHandler(this.Form1_DragEnter);
}

protected override void OnPaint(PaintEventArgs e)
{
   // If there is an image and it has a location,
   // paint it when the Form is repainted.
   base.OnPaint(e);
   if(this.picture != null && this.pictureLocation != Point.Empty)
   {
      e.Graphics.DrawImage(this.picture, this.pictureLocation);
   }
}

private void Form1_DragDrop(object sender, DragEventArgs e)
{
   // Handle FileDrop data.
   if(e.Data.GetDataPresent(DataFormats.FileDrop) )
   {
      // Assign the file names to a string array, in
      // case the user has selected multiple files.
      string[] files = (string[])e.Data.GetData(DataFormats.FileDrop);
      try
      {
         // Assign the first image to the picture variable.
         this.picture = Image.FromFile(files[0]);
         // Set the picture location equal to the drop point.
         this.pictureLocation = this.PointToClient(new Point(e.X, e.Y) );
      }
      catch(Exception ex)
      {
         MessageBox.Show(ex.Message);
         return;
      }
   }

   // Handle Bitmap data.
   if(e.Data.GetDataPresent(DataFormats.Bitmap) )
   {
      try
      {
         // Create an Image and assign it to the picture variable.
         this.picture = (Image)e.Data.GetData(DataFormats.Bitmap);
         // Set the picture location equal to the drop point.
         this.pictureLocation = this.PointToClient(new Point(e.X, e.Y) );
      }
      catch(Exception ex)
      {
         MessageBox.Show(ex.Message);
         return;
      }
   }
   // Force the form to be redrawn with the image.
   this.Invalidate();
}

private void Form1_DragEnter(object sender, DragEventArgs e)
{
   // If the data is a file or a bitmap, display the copy cursor.
   if (e.Data.GetDataPresent(DataFormats.Bitmap) ||
      e.Data.GetDataPresent(DataFormats.FileDrop) )
   {
      e.Effect = DragDropEffects.Copy;
   }
   else
   {
      e.Effect = DragDropEffects.None;
   }
}
```

## 2. winform(C#)拖拽实现获得文件路径

- [C#实现拖放获取文件路径\_冰封的落叶的博客-CSDN 博客](https://blog.csdn.net/frozleaf/article/details/50520813)
- [winform(C#)拖拽实现获得文件路径 - ahuo - 博客园](https://www.cnblogs.com/ahuo/archive/2008/04/21/1164028.html)

## 3. C# AllowDrop 设置为 True 后拖放无效的问题

- [C# AllowDrop 设置为 True 后拖放无效的问题\_时不我待-CSDN 博客](https://blog.csdn.net/aiqinxuancai/article/details/50903564)
- [Page not found - Microsoft Developer Blogs](https://devblogs.microsoft.com/blogs.msdn.com/28)
- [C#WinForm 程序以管理员方式运行后文件拖动无效\_menghuangxiao 的专栏-CSDN 博客](https://blog.csdn.net/menghuangxiao/article/details/83011556?utm_source=blogxgwz5)
- [WinForm 中管理员权限下获取拖拽文件路径的解决方案](https://zhuanlan.zhihu.com/p/48735364?from_voters_page=true)

```c#
// 设置了AllowDrop但是拖入进来鼠标还是显示禁止的标志，也调用不到Drop的事件。
// 这样的话一般来说是你的程序使用了管理员权限！在不同UAC等级下，是不允许拖放的。
// 官方建议是让你的程序不使用管理员权限。

public Dot.Net.Forms.FormCommon.Classes.FileDropHandler FileDroper;
FileDroper = new Dot.Net.Forms.FormCommon.Classes.FileDropHandler(this);
this.DragEnter += UcAledbImport_DragEnter;

// 拖入
private void UcAledbImport_DragEnter(object sender, DragEventArgs e)
{
    var paths = e.Data.GetData(typeof(string[]));
}
```
