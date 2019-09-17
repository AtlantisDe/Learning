# 线程读写

- [Sqlite3 多线程读写解决方案 - tajon1226 的专栏 - CSDN 博客](https://blog.csdn.net/tajon1226/article/details/54864322)
- [sqlite3 多线程和锁 ，优化插入速度及性能优化 - 熠熠闪光 - 博客园](https://www.cnblogs.com/huozhong/p/5973938.html)

## Sqlite3 多线程读写解决方案

```text
重要的事情说三遍！！！

如果你想在多线程环境下使用数据库，
那么你得确保所有的线程使用的都是同一个数据库连接。

如果你想在多线程环境下使用数据库，
那么你得确保所有的线程使用的都是同一个数据库连接。

如果你想在多线程环境下使用数据库，
那么你得确保所有的线程使用的都是同一个数据库连接。

```

## 多线程读写操作

```c#
                //多线程写  一定要加锁
                Thread Th3 = new Thread(delegate ()
                {
                    Parallel.For(0, 1, new ParallelOptions() { MaxDegreeOfParallelism = 300 }, (i, loopState) =>
                   {
                       try
                       {
                           lock (lockObj)
                           {
                               using (var db = DemoCore.Module.DemoTest.Database.Main.Base.GetInstance_demo_guid())
                               {
                                   var demo_guiditem = new DemoTest.Database.Main.Entity.Models.demo_guiditem();
                                   demo_guiditem.guid = i.ToString();
                                   demo_guiditem.body = System.Guid.NewGuid().ToString("N");
                                   var t2 = db.Insertable(demo_guiditem).ExecuteCommand();
                               }
                           }
                       }
                       catch (Exception)
                       {
                           Console.WriteLine("写入异常");
                       }

                   });

                });
                Th3.IsBackground = true;
                Th3.Start();

                //多线程读 无须加锁
                Thread Th4 = new Thread(delegate ()
                {
                    Parallel.For(0, 999999999, new ParallelOptions() { MaxDegreeOfParallelism = 300 }, (i, loopState) =>
                   {
                       try
                       {
                           using (var db = DemoCore.Module.DemoTest.Database.Main.Base.GetInstance_demo_guid())
                           {
                               var urlitems = db.Queryable<DemoTest.Database.Main.Entity.Models.demo_guiditem>().OrderBy(it => SqlSugar.SqlFunc.GetRandom()).Take(50).ToList();
                           }
                       }
                       catch (Exception)
                       {
                           Console.WriteLine("读取异常");
                       }
                       lock (lockObj)
                       {
                       }
                   });

                });
                Th4.IsBackground = true;
                Th4.Start();

```

## 批量写测试

```c#

                //多线程写  一定要加锁
                Thread Th3 = new Thread(delegate ()
                {
                    //批量写入测试
                    List<DemoTest.Database.Main.Entity.Models.demo_guiditem> demo_Guiditems = new List<DemoTest.Database.Main.Entity.Models.demo_guiditem>();



                    Parallel.For(0, 0, new ParallelOptions() { MaxDegreeOfParallelism = 5000 }, (i, loopState) =>
                   {
                       try
                       {
                           lock (lockObj)
                           {
                               demo_Guiditems.Add(new DemoTest.Database.Main.Entity.Models.demo_guiditem() { guid = i.ToString(), body = File.ReadAllText(@"D:\wwwrootRes\DemoTestTemp\Articles\c4150a1b8b8005af3ad0127adb125fae.txt", Encoding.UTF8) });
                           }

                       }
                       catch (Exception ex)
                       {
                           Console.WriteLine("写入异常," + ex.Message);
                       }

                   });

                    if (demo_Guiditems.Count==0)
                    {
                        return;
                    }

                    System.Diagnostics.Stopwatch stopwatch = new System.Diagnostics.Stopwatch();
                    stopwatch.Reset();
                    stopwatch.Start();

                    using (var db = DemoCore.Module.DemoTest.Database.Main.Base.GetInstance_demo_guid())
                    {

                        var t2 = db.Insertable(demo_Guiditems).ExecuteCommand();
                    }

                    stopwatch.Stop();
                    Console.WriteLine("成功导入{0}条数据 ，用时{1}秒。", demo_Guiditems.Count, stopwatch.Elapsed.TotalSeconds);

                    Console.WriteLine("执行完毕");



                });
                Th3.IsBackground = true;
                Th3.Start();
```

## 事务多线程下错误示例

```c#
 // 事务插入数据
                    if (demo_Guiditems.Count == 0) { return; }

                    System.Diagnostics.Stopwatch stopwatch = new System.Diagnostics.Stopwatch();
                    stopwatch.Reset();
                    stopwatch.Start();

                    Thread Th_insert_1 = new Thread(delegate ()
                    {
                        using (var db = DemoCore.Module.DemoTest.Database.Main.Base.GetInstance_demo_guid())
                        {
                            for (int i = 0; i < 2500; i++)
                            {
                                var item = demo_Guiditems[i];
                                db.Insertable<DemoTest.Database.Main.Entity.Models.demo_guiditem>(item).AddQueue();
                            }
                            var more = db.SaveQueuesAsync();
                        }

                    });
                    Th_insert_1.IsBackground = true;
                    Th_insert_1.Start();

                    Thread Th_insert_2 = new Thread(delegate ()
                    {

                        using (var db = DemoCore.Module.DemoTest.Database.Main.Base.GetInstance_demo_guid())
                        {
                            for (int i = 2500 - 1; i < 5000; i++)
                            {
                                var item = demo_Guiditems[i];
                                db.Insertable<DemoTest.Database.Main.Entity.Models.demo_guiditem>(item).AddQueue();
                            }
                            var more = db.SaveQueuesAsync();
                        }

                    });
                    Th_insert_2.IsBackground = true;
                    Th_insert_2.Start();


```
