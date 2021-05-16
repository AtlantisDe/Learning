# PageSplit

```c#

```

## 0. Installation

```c#
var pager = new Dot.Net.Common.Engine.Page.Pager(1,80);
var pageSplit = new Dot.Net.Common.Engine.Page.PageSplit(100, 2, 25);


//total : 总数
//pageSize : 每页显示数
//totalPage : 共页数
var totalPage = (total + pageSize - 1)/pageSize;

/// web端分页 推荐这个类
PageSplit

var pageSplit = new PageSplit(100, 2, 25);
pageSplit.SetSplitLength = 25;



// .Net中通用分页页数计算方式,分页的总页数算法

// 总记录数：totalRecord
// 每页最大记录数：maxResult

// 算法一:
totalPage = totalRecord % maxResult == 0 ? totalRecord / maxResult : totalRecord / maxResult + 1 ;

// 算法二：（推荐）
totalPage = (totalRecord + maxResult -1) / maxResult;
// 其中 maxResult  - 1 就是 totalRecord / maxResult 的最大的余数




var totalRecord = 7186;
var maxResult = 10;
var totalPage = (totalRecord + maxResult - 1) / maxResult;
```

## 1. PageEach 与 Paginate 实现分页

```c#
// Paginate
var newItems = items.Paginate<CategoryInfo>(pageIndex, pageSize).ToList();

var newItems0 = items.Paginate<IDtem>(1, 10);
var newItems1 = items.Paginate<IDtem>(2, 10);
var newItems3 = items.Paginate<IDtem>(3, 10);

// API PageList 分页信息
return ServiceResult.IsSuccess($"查询完成!", new Dot.Net.Common.Engine.Service.Models.PageList<CategoryInfo>(pageIndex, pageSize, items.Count, newItems));
 
// 示例:固定保持有分页写法请求数据 不关系总页码数
var items = GoogleApp.Net.Web.Engine.TDX.Util.Driver.FunStockJgYyxxV2Items(jgName, pageIndex, pageSize, true);
//var newItems = items.Paginate<GoogleApp.Net.Collection.Engine.Stock.Models.JgYyxxV2Item>(pageIndex, pageSize).ToList();
return ServiceResult.IsSuccess($"查询完成!", new Dot.Net.Common.Engine.Service.Models.PageList<GoogleApp.Net.Collection.Engine.Stock.Models.JgYyxxV2Item>(pageIndex, pageSize, 1000, items));



// PageEach
ExtenionsPage.PageEach(items, 10, list =>
{
    try
    {
        var items0 = list;
    }
    catch (Exception ex)
    {
    }
});

```
