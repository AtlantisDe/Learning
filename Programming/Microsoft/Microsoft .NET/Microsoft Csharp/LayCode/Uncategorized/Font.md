# Font

- [Font Class (System.Drawing)](https://docs.microsoft.com/en-us/dotnet/api/system.drawing.font?view=dotnet-plat-ext-5.0)
- [How to: Construct Font Families and Fonts - Windows Forms .NET Framework](https://docs.microsoft.com/en-us/dotnet/desktop/winforms/advanced/how-to-construct-font-families-and-fonts?view=netframeworkdesktop-4.8)

## 1. QuickStart

```c#
var Font = new Font(new FontFamily("Arial"), 40, FontStyle.Italic, GraphicsUnit.Pixel);

var Font = new System.Drawing.Font("新宋体", 39.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(134)));



FontFamily fontFamily = new FontFamily("Arial");
Font font = new Font(
   fontFamily,
   16,
   FontStyle.Regular,
   GraphicsUnit.Pixel);

new Font(new FontFamily("Arial"), 16, FontStyle.Regular, GraphicsUnit.Pixel)

private void ComboBox1_SelectedIndexChanged(System.Object sender,
    System.EventArgs e)
{

    // Cast the sender object back to a ComboBox.
    ComboBox ComboBox1 = (ComboBox) sender;

    // Retrieve the selected item.
    string selectedString = (string) ComboBox1.SelectedItem;

    // Convert it to lowercase.
    selectedString = selectedString.ToLower();

    // Declare the current size.
    float currentSize;

    // Switch on the selected item.
    switch(selectedString)
    {

            // If Bigger is selected, get the current size from the
            // Size property and increase it. Reset the font to the
            //  new size, using the current unit.
        case "bigger":
            currentSize = Label1.Font.Size;
            currentSize += 2.0F;
            Label1.Font = new Font(Label1.Font.Name, currentSize,
                Label1.Font.Style, Label1.Font.Unit);

            // If Smaller is selected, get the current size, in points,
            // and decrease it by 1.  Reset the font with the new size
            // in points.
            break;
        case "smaller":
            currentSize = Label1.Font.SizeInPoints;
            currentSize -= 1;
            Label1.Font = new Font(Label1.Font.Name, currentSize,
                Label1.Font.Style);
            break;
    }
}
```

## 2. Image.Save Method

-[Image.Save Method (System.Drawing)](https://docs.microsoft.com/en-us/dotnet/api/system.drawing.image.save?view=dotnet-plat-ext-5.0)

```c#
logo.Save(path);

```
