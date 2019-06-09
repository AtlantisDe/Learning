# Update

- [更新-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1129)

## 更新

### 只更新某列

- 只更新实体里面的 Name 列(主键要有值，主键是更新条件)

```c#
var t3 = db.Updateable(updateObj).UpdateColumns(it => new { it.Name }).ExecuteCommand();
```
