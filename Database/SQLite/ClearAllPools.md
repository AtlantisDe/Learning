# ClearAllPools

```c#
public static bool ConnectionAndClose()
{
    using (var db = GetInstance_ByCustomPathConnection(@"D:\Tmp\SqliteDemo\main.db3"))
    {
        var Linkitems = db.Queryable<Linkitem>().ToList();
    }

    GC.Collect();
    GC.WaitForPendingFinalizers();
    System.Data.SQLite.SQLiteConnection.ClearAllPools();

    return true;
}
```
