# ServiceResult

## 1. Usage

```c#
Dot.Net.Common.Engine.Service.Models.ServiceResult
Dot.Net.Common.Engine.Service.Models.ServiceResult<string>

ServiceResult<Site>.IsSuccess($"读取网站完成!", site);
ServiceResult<Site>.IsSuccess($"读取网站失败!", null);
ServiceResult<Site>.IsSuccess($"读取网站失败!异常:{ex.Message}", null);

ServiceResult<List<Uri>> CreateSiteURIs(Site site, Uri Uri);
ServiceResult<List<Uri>>.IsError($"创建网页URI失败!", null);
ServiceResult<List<Uri>>.IsError($"创建网页URI失败!异常:{ex.Message}", null);
ServiceResult<List<Uri>>.IsSuccess($"创建网页URI成功!总量:{items.Count}", items);

Dot.Net.Common.Engine.Service.Models.PageList<UItem>
return new Dot.Net.Common.Engine.Service.Models.PageList<UItem>(1, 1, 100, UItems);
return ServiceResult.IsSuccess($"查询完成!", new Dot.Net.Common.Engine.Service.Models.PageList<CategoryInfo>(1, 1, 100, items));

// 对象需要转化
Dot.Net.Common.Engine.Service.Models.ServiceResult WebsiteCategoryInfos(int pageIndex, int pageSize);
return ServiceResult.IsSuccess($"查询完成!", new Dot.Net.Common.Engine.Service.Models.PageList<CategoryInfo>(pageIndex, pageSize, items.Count, items));


// 注意API 接口编写时候 如果少了一个public修饰 得找半天问题注意细节
public


```

## 2. Page Select

```c#
var fields = Builders<ResItem>.Projection.Include(p => p.MongoId)
            .Include(p => p.Title)
            .Include(p => p.Category)
            .Include(p => p.UsedStates)
            .Include(p => p.PublishDate)
            .Include(p => p.CreateDate)
            ;

var items = TArticleContent.Find(x => x.Keywords.Equals(category)).Project<ResItem>(fields).Skip((pageIndex - 1) * pageSize).Limit(pageSize).ToList();

var Count = TArticleContent.CountDocuments(x => x.Keywords.Equals(category));

return ServiceResult.IsSuccess($"查询完成!", new Dot.Net.Common.Engine.Service.Models.PageList<ResItem>(pageIndex, pageSize, Count, items));

var items = ((PageList<Net.Collection.Engine.Stock.Models.DailyKDataItem>)rst.Data).Items;

```

## 3. 内存分页

```c#
public ServiceResult WebsiteUpdateCyclePool(int pageIndex, int pageSize)
{
    var items = new List<CategoryInfo>();
    try
    {
        items = TVisitInfos.Aggregate().Match(x => x.Yymmdd == yymmdd)
            .Group(x => x.VisitorName, g => new
            {
                Count = g.Count()
            }).As<CategoryInfo>().ToList();


        var newItems = items.Paginate<CategoryInfo>(pageIndex, pageSize).ToList();
        return ServiceResult.IsSuccess($"查询完成!", new Dot.Net.Common.Engine.Service.Models.PageList<CategoryInfo>(pageIndex, pageSize, items.Count, newItems));

    }
    catch (Exception ex)
    {
        return ServiceResult.IsFailed($"查询异常:{ex.Message}", null);
    }
    finally
    {
    }

}
```

## 4. ServiceResult

```c#
// 正常异常
try
{

    return ServiceResult.IsSuccess($"节点同步,成功", null);
}
catch (Exception ex) { return ServiceResult.IsFailed($"节点同步,异常:{ex.Message}", null); }
finally { }

// bool 结果返回
try
{
    var rst = TBaseInfoItems.Update(baseInfoItem);
    if (rst == false)
    {
        return ServiceResult.IsSuccess($"更新,失败", null);
    }
    return ServiceResult.IsSuccess($"更新,成功", null);
}
catch (Exception ex) { return ServiceResult.IsFailed($"更新,异常:{ex.Message}", null); }
finally { }
```

## 5. QuickStart

```c#

/// <summary>通讯消息示例</summary>
public static Dot.Net.Common.Engine.Service.Models.ServiceResult FunServiceResult1()
{
    try
    {

        return ServiceResult.IsSuccess($"操作,完成!");
    }
    catch (Exception ex)
    {
        return ServiceResult.IsFailed($"操作,异常:{ex.Message}");
    }
    finally { }

}


/// <summary>通讯消息示例</summary>
public static Dot.Net.Common.Engine.Service.Models.ServiceResult<HttpCommon.Models.ResponseItem> FunServiceResult2()
{
    try
    {
        var item = new HttpCommon.Models.ResponseItem();

        return ServiceResult<HttpCommon.Models.ResponseItem>.IsSuccess($"操作,完成!");
    }
    catch (Exception ex)
    {
        return ServiceResult<HttpCommon.Models.ResponseItem>.IsFailed($"操作,异常:{ex.Message}",null);
    }
    finally { }

}

```
