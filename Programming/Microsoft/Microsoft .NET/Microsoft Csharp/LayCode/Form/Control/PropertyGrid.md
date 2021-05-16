# PropertyGrid

- [PropertyGrid Class (System.Windows.Forms)](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.propertygrid?view=netcore-3.1)
- [C# PropertyGrid 控件应用心得\_卢弋 的个人技术专栏 -- 总结使人进步-CSDN 博客](https://blog.csdn.net/luyifeiniu/article/details/5426960)
- [C# WinForm PropertyGrid 用法 - 大气象 - 博客园](https://www.cnblogs.com/greatverve/archive/2010/10/26/csharp-propertygrid.html)
- [通过反射更改 PropertyGrid 的只读以及可见特性](https://www.cnblogs.com/Jason-han/p/4467758.html)
- [Error Happened](https://www.codeproject.com/Articles/28933/A-C-2008-Advanced-Customizable-PropertyGrid-Contro)
- [PropertyGrid Control - Telerik UI for WinForms Components - Telerik](https://www.telerik.com/products/winforms/property-grid.aspx)

## 1. 常用

- [PropertyGrid 中的枚举显示为中文](https://blog.csdn.net/nieweiking/article/details/11481599)
- [枚举显示中文问题 - 停留的风 - 博客园](https://www.cnblogs.com/yank/archive/2011/09/08/EnumDisplayInChinese.html)

```c#
this.propertyGrid1.SelectedObject = this.BaseInfoItem;

// System.ComponentModel
// 用于表明此属性绑定到的属性是只读的; false 来显示该属性是读/写

/// <summary>Id</summary>
[ReadOnly(true)]
public int Id { get; set; }





```

## 2. 对属性进行分类并加注释

```c#

```

## 3. 通过反射更改 PropertyGrid 的只读以及可见特性

```c#

```

## 4. DescriptionAttribute

- [DescriptionAttribute Class (System.ComponentModel)](https://docs.microsoft.com/en-us/dotnet/api/system.componentmodel.descriptionattribute?view=netcore-3.1)
- [Use a type converter with a PropertyGrid control in C# - C# Helper](http://csharphelper.com/blog/2014/09/use-a-type-converter-with-a-propertygrid-control-in-c/)

```c#

[Description("自动推送")]
[DescriptionAttribute("自动推送")]

[Category("触发方式分类"), Description("网站推送触发方式枚举类型")]
[CategoryAttribute("触发方式分类"), DescriptionAttribute("网站推送触发方式枚举类型")]


/// <summary>网站推送触发方式枚举类型</summary>
[CategoryAttribute("触发方式分类"), DescriptionAttribute("网站推送触发方式枚举类型")]
public WebsitePushTriggerMethod WebsitePushTriggerMethod { get; set; }

[Description("The image associated with the control"),Category("Appearance")]
 public Image MyImage {
    get {
       // Insert code here.
       return image1;
    }
    set {
       // Insert code here.
    }
 }

 // Gets the attributes for the property.
 AttributeCollection attributes =
    TypeDescriptor.GetProperties(this)["MyImage"].Attributes;

 /* Prints the description by retrieving the DescriptionAttribute
  * from the AttributeCollection. */
 DescriptionAttribute myAttribute =
    (DescriptionAttribute)attributes[typeof(DescriptionAttribute)];
 Console.WriteLine(myAttribute.Description);
```

## 9. 其它相关项目

- [DynamicPropertyPropertiesListGridViewExample](https://github.com/9swampy/DynamicPropertyPropertiesListGridViewExample/tree/master/DynamicPropertyPropertiesListGridViewExample)
- [PropertyGridHelpers](https://github.com/dparvin/PropertyGridHelpers)
- [CodenameColors/PropertyGridControl](https://github.com/CodenameColors/PropertyGridControl)
- [sknchan/PropertyGridGenerator](https://github.com/sknchan/PropertyGridGenerator)
