# IActionResult

```c#
Microsoft.AspNetCore.Mvc.ControllerBase

return NotFound("错误!");

public IActionResult Demo()
{
    List<string> aaa = new List<string>() {"1","2" };
    return Ok(aaa);
}
```
