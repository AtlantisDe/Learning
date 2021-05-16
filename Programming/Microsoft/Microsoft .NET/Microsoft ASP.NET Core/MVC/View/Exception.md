# Exception

- [MVC中全局错误拦截记录日志，WebApi中全局错误拦截以及授权验证401，jquery cors 跨域](https://blog.csdn.net/smartsmile2012/article/details/82751674)

## 代码

### Demo

#### 1. 控制器

- [ASP.NET MVC 异常 Exception 拦截 - 沉淀的风 - 博客园](https://www.cnblogs.com/xyb0226/p/9250334.html)

```c#
public class HandlerErrorAttribute : HandleErrorAttribute
{
    /// <summary>
    /// 控制器方法中出现异常，会调用该方法捕获异常
    /// </summary>
    /// <param name="context">提供使用</param>
    public override void OnException(ExceptionContext context)
    {
        WriteLog(context);
        base.OnException(context);
        context.ExceptionHandled = true;
        if (context.Exception is UserFriendlyException)
        {
            context.HttpContext.Response.StatusCode = (int)HttpStatusCode.OK;
            context.Result = new ContentResult { Content = new AjaxResult { type = ResultType.error, message = context.Exception.Message }.ToJson() };
        }
        else if (context.Exception is NoAuthorizeException)
        {
            context.HttpContext.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
            if (!context.HttpContext.Request.IsAjaxRequest())
            {
                context.HttpContext.Response.RedirectToRoute("Default", new { controller = "Error", action = "Error401", errorUrl = context.HttpContext.Request.RawUrl });
            }
            else
            {
                context.Result = new ContentResult { Content = context.HttpContext.Request.RawUrl };
            }
        }
        else
        {
             context.HttpContext.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
             ExceptionMessage error = new ExceptionMessage(context.Exception);
             var s = error.ToJson();
             if (!context.HttpContext.Request.IsAjaxRequest())
             {
                 context.HttpContext.Response.RedirectToRoute("Default", new { controller = "Error", action = "Error500", data = WebHelper.UrlEncode(s) });
             }
             else
             {
                 context.Result = new ContentResult { Content = WebHelper.UrlEncode(s) };
             }
        }
    }

    /// <summary>
    /// 写入日志（log4net）
    /// </summary>
    /// <param name="context">提供使用</param>
    private void WriteLog(ExceptionContext context)
    {
        if (context == null)
            return;
        if (context.Exception is NoAuthorizeException || context.Exception is UserFriendlyException)
        {
            //友好错误提示,未授权错误提示，记录警告日志
            LogHelper.Warn(context.Exception.Message);
        }
        else
        {
            //异常错误，
            LogHelper.Error(context.Exception);

            ////TODO :写入错误日志到数据库
        }
    }
}
```

#### 2. MVC 过滤器全局注册异常拦截

```c#
public class FilterConfig
{
    public static void RegisterGlobalFilters(GlobalFilterCollection filters)
    {
        filters.Add(new HandlerErrorAttribute());
    }
}
// 我们看到，context.Exception 分为3种：UserFriendlyException，NoAuthorizeException 或 Exception；UserFriendlyException 是指友好异常，前端友好提示错误信息。NoAuthorizeException 为401未授权异常，当页面未被授权访问时，返回该异常，并携带有未授权的路径地址。其他异常统一返回500错误，并携带异常信息。
```

#### 3.异常处理

##### 1.401 未授权错误

```c#
// 异常定义代码
/// <summary>
/// 没有被授权的异常
/// </summary>
public class NoAuthorizeException : Exception
{
    public NoAuthorizeException(string message)
        : base(message)
    {
    }
}
// 抛出异常代码：
// throw new NoAuthorizeException("未授权");
```
