# View.Help

- 视图相关知识点

## 常用

```c#
// 引用扩展方法
@using Google.Tookits.Extension;
@model IEnumerable<Google.Service.System.Bo.MenuBo>

```

### 1. partial 局部视图

```c#
<partial name="~/Views/Home/_menuList.cshtml" model="item.Children" />
```
