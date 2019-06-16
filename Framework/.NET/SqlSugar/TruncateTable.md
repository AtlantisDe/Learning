# TruncateTable

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
