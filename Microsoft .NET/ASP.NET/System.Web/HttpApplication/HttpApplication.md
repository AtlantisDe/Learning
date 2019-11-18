# HttpApplication

- 全局类
- 事件查看 System.Web.HttpApplication
- [Global.asax 中的方法 - pinko - 博客园](https://www.cnblogs.com/pinko/archive/2013/05/02/3053965.html)

```c#
namespace AleEngine
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}
```

## 事件

```c#
再说这两个无顺序的
Application_PreSendRequestHeaders：向客户端发送Http标头之前执行。
Application_PreSendRequestContent：向客户端发送Http正文之前执行。
```
