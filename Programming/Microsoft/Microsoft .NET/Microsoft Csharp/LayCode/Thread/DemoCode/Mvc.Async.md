# Mvc.Async

## 常用

### 1. MVC 异步

```c#
        [AsyncTimeout(3000)]
        public async Task<ActionResult> Demoasync()
        {

            var task1 = await Task<bool>.Run(() =>
            {
                ViewBag.Html = GuidExtenions.N;

                return true;

            });

            var task2 = await SiteExtenions.SiteTaskaaa();

            ViewBag.Html = task2;

            //await Task.WhenAll(task1, task2);


            return View("SiteContentHtml", "");
        }


```
