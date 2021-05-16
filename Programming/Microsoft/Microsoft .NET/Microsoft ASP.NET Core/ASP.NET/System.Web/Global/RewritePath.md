# RewritePath

```c#
Context.RewritePath("/index.html");

// 默认是200状态码
case "robots.txt": Context.RewritePath("/App/Root/StaticFiles/Uncategorized/robots.txt"); return;

```

```c#
        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            var CurrentPath = System.Environment.CurrentDirectory;
            //Context.RewritePath("/index.html");

            var msg = "";
            try
            {
                var uri = new Uri(this.Request.Url.AbsoluteUri);

            }
            catch (Exception ex)
            {
                msg = ex.Message;
            }

            Context.RewritePath(
                string.Format("/Api/Custom/demo.aspx?Action={0}cc={1}msg={2}A3={3}"
                , System.Web.HttpUtility.UrlEncode(this.Request.Url.AbsoluteUri)
                , this.Request.Url.Host
                  , this.Request.Url.Port
                    , this.Request.MapPath("")
                ));

            //Context.RewritePath("/demo.png");
        }

```
