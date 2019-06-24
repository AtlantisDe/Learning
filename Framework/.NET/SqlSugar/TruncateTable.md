# TruncateTable

- [SQLite Vacuum | 菜鸟教程](https://www.runoob.com/sqlite/sqlite-vacuum.html)
- VACUUM
- 手动 VACUUM \$sqlite3 database_name "VACUUM;"
- 自动 VACUUM（Auto-VACUUM）
- 您可以从命令提示符中运行下面的命令来检查 auto-vacuum 设置：\$sqlite3 database_name "PRAGMA auto_vacuum;"

```c#
 public static bool TruncateTable()
{
    try
    {
        using (var db = Module.Aleseo.Database.Main.Base.GetInstance())
        {
            db.Ado.GetInt("VACUUM");
            return true;
        }
    }
    catch (Exception Ex)
    {
        Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, Ex.Message));
    }
    finally
    {
    }
    return true;
}
```
