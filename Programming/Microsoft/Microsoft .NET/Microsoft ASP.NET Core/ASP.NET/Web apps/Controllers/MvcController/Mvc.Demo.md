# Mvc.Demo

## 常用代码示例

```c#
 public class AccountController : Controller
    {
        public IActionResult Index()
        {
            return Content("Account Home Index");

            //return View();
        }
        /// <summary>登陆</summary>
        public IActionResult Logon()
        {
            return View("Logon");
        }

    }
```
