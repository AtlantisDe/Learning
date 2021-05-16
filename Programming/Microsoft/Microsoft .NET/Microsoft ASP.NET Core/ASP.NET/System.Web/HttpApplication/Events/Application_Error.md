# Application_Error

## 百科

```c#

```

### 0. 代码示例

```c#
Exception ex = Server.GetLastError();
string path = "N/A";
if (sender is HttpApplication)
   path = ((HttpApplication)sender).Request.Url.PathAndQuery;

string args = string.Format("<b>Path:</b> {0}", path);
Response.Write(args);
```

### 1. 代码示例

```c#
protected void Application_Error(object sender, EventArgs e)
{
var error = "";
try
{
    Exception exception = Server.GetLastError();
    error = exception != null ? exception.Message : "";
    Response.Clear();
    HttpException httpException = exception as HttpException;
    RouteData routeData = new RouteData();
    routeData.Values.Add("controller", "Error");

    if (httpException != null)
    {
        switch (httpException.GetHttpCode())
        {
            case 404:
                // Page not found.
                routeData.Values.Add("action", "HttpError404");
                break;
            case 500:
                // Server error.
                routeData.Values.Add("action", "HttpError500");
                break;
            // Here you can handle Views to other error codes.
            // I choose a General error template
            default:
                routeData.Values.Add("action", "General");
                break;
        }
    }
    // Pass exception details to the target error View.
    routeData.Values.Add("error", exception.Message);
    // Clear the error on server.
    Server.ClearError();
    // Call target Controller and pass the routeData.

}
catch (Exception ex)
{
    error = ex.Message;
}
finally
{

}

if (Request.IsAuthenticated == false)
{
    Response.Redirect("/App/Console");
    return;
}


var root = new DemoCore.Module.DemoTest.Host.Main.Entity.apipublish();
root.code = 0;
root.message = error;

var json = Newtonsoft.Json.JsonConvert.SerializeObject(root);

this.Response.Clear();
this.Response.ContentType = "application/json;charset=utf-8";



this.Response.Write(json);
}

```
