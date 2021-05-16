# Color

- [Color Struct (System.Drawing)](https://docs.microsoft.com/en-us/dotnet/api/system.drawing.color?view=net-5.0)
- [C# .NET: Convert System.Drawing.Color to HTML color | Chris Pietschmann](https://pietschsoft.com/post/2006/06/29/c-net-convert-systemdrawingcolor-to-html-color)

```c#

```

## 0. Installation

```c#
System.Drawing.ColorTranslator.FromHtml("#F5F7F8");

// Convert from HTML color
System.Drawing.Color c = System.Drawing.ColorTranslator
    .FromHtml("#F5F7F8");

// Convert to HTML color
String strHtmlColor = System.Drawing.ColorTranslator
    .ToHtml(c);


```

## 1. QuickStart

```c#
var DefaultColors = {
    Head_Back_Color: "rgb(60,60,60)",
    Head_Txt_Color: "rgb(255,255,255)",
    Head_Btn_Back: ["rgb(100,100,100)", "rgb(80,80,80)"],
    Head_Btn_Txt: "rgb(255,255,255)",
    Head_Btn_Border: "rgb(20,20,20)",
    Tab_Border_Color: "rgb(85,85,85)",
    Tab_Head_Back: "rgb(20,20,20)",
    Tab_Head_Txt: "rgb(192,192,192)",
    Tab_Body_Back: ["rgb(50,50,50)", "rgb(45,45,45)"],
    Tab_Hover_Back: "rgb(65,65,65)",
    Grid_Up_Color: "rgb(255,50,50)",
    Grid_Down_Color: "rgb(0,230,0)",
    Grid_Level_Color: "rgb(255,255,255)",
    Grid_Volume_Color: "rgb(192,192,0)",
    Grid_Code_Color: "rgb(240,248,136)",
    Grid_Name_Color: "rgb(240,248,136)",
    Grid_Zxg_Color: "rgb(2,226,244)",
    HQ_BACKCOLOR: "rgb(0,0,0)",
    HQ_AXISCOLOR: "rgb(170,0,0)",
    HQ_TIMECOLOR: "rgb(192,192,192)",
    HQ_KPCOLOR: "rgb(255,50,50)",
    HQ_KNCOLOR: "rgb(84,255,255)",
    HQ_LEVELCOLOR: "rgb(255,255,255)",
    HQ_BIGTITLECOLOR: "rgb(185,185,0)",
    HQ_ZBCOLOR1: "rgb(250,250,250)",
    HQ_ZBCOLOR2: "rgb(255,255,0)",
    HQ_ZBCOLOR3: "rgb(255,0,255)",
    HQ_ZBCOLOR4: "rgb(0,255,0)",
    HQ_ZBCOLOR5: "rgb(192,192,192)",
    HQ_ZBCOLOR6: "rgb(0,0,255)",
    HQ_VOLCOLOR: "rgb(192,192,0)",
    HQ_NORMALCOLOR: "rgb(192,192,192)",
  },
  BlackColors = {
    Head_Back_Color: "rgb(60,60,60)",
    Head_Txt_Color: "rgb(255,255,255)",
    Head_Btn_Back: ["rgb(100,100,100)", "rgb(80,80,80)"],
    Head_Btn_Txt: "rgb(255,255,255)",
    Head_Btn_Border: "rgb(20,20,20)",
    Tab_Border_Color: "rgb(85,85,85)",
    Tab_Head_Back: "rgb(20,20,20)",
    Tab_Head_Txt: "rgb(192,192,192)",
    Tab_Body_Back: ["rgb(0,0,0)", "rgb(0,0,0)"],
    Tab_Hover_Back: "",
    Grid_Up_Color: "rgb(255,50,50)",
    Grid_Down_Color: "rgb(0,230,0)",
    Grid_Level_Color: "rgb(255,255,255)",
    Grid_Volume_Color: "rgb(192,192,0)",
    Grid_Code_Color: "rgb(240,248,136)",
    Grid_Name_Color: "rgb(240,248,136)",
    Grid_Zxg_Color: "rgb(2,226,244)",
    HQ_BACKCOLOR: "rgb(0,0,0)",
    HQ_AXISCOLOR: "rgb(170,0,0)",
    HQ_TIMECOLOR: "rgb(192,192,192)",
    HQ_KPCOLOR: "rgb(255,50,50)",
    HQ_KNCOLOR: "rgb(84,255,255)",
    HQ_LEVELCOLOR: "rgb(255,255,255)",
    HQ_BIGTITLECOLOR: "rgb(185,185,0)",
    HQ_ZBCOLOR1: "rgb(250,250,250)",
    HQ_ZBCOLOR2: "rgb(255,255,0)",
    HQ_ZBCOLOR3: "rgb(255,0,255)",
    HQ_ZBCOLOR4: "rgb(0,255,0)",
    HQ_ZBCOLOR5: "rgb(192,192,192)",
    HQ_ZBCOLOR6: "rgb(0,0,255)",
    HQ_VOLCOLOR: "rgb(192,192,0)",
    HQ_NORMALCOLOR: "rgb(192,192,192)",
  },
  WhiteColors = {
    Head_Back_Color: "rgb(240,240,240)",
    Head_Txt_Color: "rgb(0,0,0)",
    Head_Btn_Back: ["rgb(247,247,247)", "rgb(222,222,222)"],
    Head_Btn_Txt: "rgb(0,0,0,)",
    Head_Btn_Border: "rgb(208,208,208)",
    Tab_Border_Color: "rgb(208,208,208)",
    Tab_Head_Back: "rgb(245,245,245)",
    Tab_Head_Txt: "rgb(0,0,0)",
    Tab_Body_Back: ["rgb(255,255,255)", "rgb(255,255,255)"],
    Tab_Hover_Back: "",
    Grid_Up_Color: "rgb(255,0,0)",
    Grid_Down_Color: "rgb(0,128,0)",
    Grid_Level_Color: "rgb(0,0,0)",
    Grid_Volume_Color: "rgb(220,120,60)",
    Grid_Code_Color: "rgb(0,0,0)",
    Grid_Name_Color: "rgb(0,0,0)",
    Grid_Zxg_Color: "rgb(2,126,244)",
    HQ_BACKCOLOR: "rgb(255,255,255)",
    HQ_AXISCOLOR: "rgb(208,208,208)",
    HQ_TIMECOLOR: "rgb(136,136,136)",
    HQ_KPCOLOR: "rgb(255,0,0)",
    HQ_KNCOLOR: "rgb(51,170,17)",
    HQ_LEVELCOLOR: "rgb(0,0,0)",
    HQ_BIGTITLECOLOR: "rgb(185,185,0)",
    HQ_ZBCOLOR1: "rgb(0,85,162)",
    HQ_ZBCOLOR2: "rgb(140,48,55)",
    HQ_ZBCOLOR3: "rgb(244,120,32)",
    HQ_ZBCOLOR4: "rgb(124,167,0)",
    HQ_ZBCOLOR5: "rgb(205,67,67)",
    HQ_ZBCOLOR6: "rgb(255,202,83)",
    HQ_VOLCOLOR: "rgb(230,80,10)",
    HQ_NORMALCOLOR: "rgb(0,0,0)",
  };

```
