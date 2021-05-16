# random-list

## 随机从集合中取出元素

### 正确避免错误的正确用法

```c#
//随机取出一个网站名称 并且不重复
        public string GetonerandomNotrepeating()
        {
            var a = "数据库随机检查抽取网站名称失败";
            try
            {
                using (var db = Module.DemoTest.Database.Main.Base.GetInstance())
                {
                    var sitenametmp = GetoneSitenameforbuild();
                    var count = 0;
                    var hostitems = new List<Module.DemoTest.Database.Main.Entity.Models.hostitem>();
                    while (true)
                    {
                        try { hostitems = db.Queryable<Module.DemoTest.Database.Main.Entity.Models.hostitem>().Where(it => it.name == sitenametmp).ToList(); }
                        catch (Exception) { return sitenametmp; }
                        count++; if (count > 1000) { Console.WriteLine("网站名称随机提取失败!"); break; }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message));
            }
            return a;
        }
```
