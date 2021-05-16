# TimingTask

- [Asp.net Global 定时执行 - peterYong - 博客园](https://www.cnblogs.com/peterYong/p/6956978.html)

## Demo

### Demo1

```c#
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Timers;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace TimingTask
{
    /**
     *原理：Global.asax 可以是asp.net中应用程序或会话事件处理程序，
     *我们用到了Application_Start(应用程序开始事件)和Application_End(应用程序结束事件)。
     *当应用程序开始时，启动一个定时器，用来定时执行任务YourTask()方法，
     *这个方法里面可以写上需要调用的逻辑代码，可以是单线程和多线程。
     *当应用程序结束时，如IIS的应用程序池回收，让asp.net去访问当前的这个web地址。
     *这里需要访问一个aspx页面，这样就可以重新激活应用程序。
     */
    public class Global : System.Web.HttpApplication
    {
        //在应用程序启动时运行的代码
        protected void Application_Start(object sender, EventArgs e)
        {
            //定时器
            System.Timers.Timer myTimer = new System.Timers.Timer(2000);
            myTimer.Elapsed += new ElapsedEventHandler(myTimer_Elapsed);
            myTimer.Enabled = true;
            myTimer.AutoReset = true;
        }
        private void myTimer_Elapsed(object source, ElapsedEventArgs e)
        {
            try
            {
                RunTheTask();
            }
            catch (Exception ex)
            {
                WebForm1.html = ex.Message;
            }
        }

        private void RunTheTask()
        {
            //在这里写你需要执行的任务
            WebForm1.html = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + ":AutoTask is Working!";
        }

        // 在新会话启动时运行的代码
        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }
        // 在出现未处理的错误时运行的代码
        protected void Application_Error(object sender, EventArgs e)
        {

        }
        // 在会话结束时运行的代码。
        protected void Session_End(object sender, EventArgs e)
        {
            // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
            // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer
            // 或 SQLServer，则不会引发该事件
        }
        //  在应用程序关闭时运行的代码
        protected void Application_End(object sender, EventArgs e)
        {
            WebForm1.html = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + ":Application End!";

            //下面的代码是关键，可解决IIS应用程序池自动回收的问题

            Thread.Sleep(1000);

            //这里设置你的web地址，可以随便指向你的任意一个aspx页面甚至不存在的页面，目的是要激发Application_Start
            string url = "WebForm1.aspx";
            HttpWebRequest myHttpWebRequest = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();
            Stream receiveStream = myHttpWebResponse.GetResponseStream();//得到回写的字节流
        }
    }
}
```
