# Delete

## 代码删除

### demo 一

```c#
using (var db = GetInstance_main_log())
{
    var count = db.Deleteable<logitem>().ExecuteCommand();
    db.Ado.GetInt("VACUUM");

    root.code = 200;
    root.message = string.Format("删除成功!删除数据总量:{0}", count);
}
```
