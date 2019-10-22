# 异步情况经验

## 常用

### 1. ApiController 中异步

```c#
[Route("api/demo/{hostToken}")]
[HttpGet]
[HttpPost]
public async Task<apiPublish> Demo(string hostToken)
{
    var root = await TokenCheck(hostToken);
    if (root.code != 200)
    {
    return root;
    }

    return await SiteExtenions.demo(this.Request.RequestUri);

    //  以上是正确用法

    // 错误用法 导致卡死 线程阻塞情况

    // 在第二个 await 方法里使用 .Result 将导致线程阻塞
}
```
