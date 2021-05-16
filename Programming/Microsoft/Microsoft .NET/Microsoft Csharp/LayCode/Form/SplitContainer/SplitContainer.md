# SplitContainer

```C#
this.splitContainer1.Panel1Collapsed = true;
this.splitContainer1.FixedPanel = FixedPanel.Panel2;
this.splitContainer1.IsSplitterFixed = true;

this.splitContainer1.Panel1MinSize = 0;
this.splitContainer1.SplitterDistance = 0;
```

## 常用

### 1.调整大小

- ==》随便单击一个 Panel，再按一下 Esc
- [Ｃ＃SplitContainer 容器控件调整左右 Panel 大小 - yinyuliangQQQ 的博客 - CSDN 博客](https://blog.csdn.net/yinyuliangQQQ/article/details/80915050)

### 2.分割成上下两部分 即纵向分割窗口

- [c# 如何用 SplitContainer 将 From 分割成上下两部分 即纵向分割窗口 - 悟生慧 - 博客园](https://www.cnblogs.com/wuhuisheng/archive/2012/04/13/2445405.html)

```C#
// C#如何使用SplitContainer控件实现上下分隔
// Orientation 属性设置为Horizontal

this.splitContainer1.Orientation=Orientation.Horizontal;
this.splitContainer1.Orientation = Orientation.Vertical;
```
