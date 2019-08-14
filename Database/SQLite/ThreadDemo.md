# demo

```c#
   //go_demo_sqlite_001();
                bool go_demo_sqlite_001()
                {
                    object lockObj_dbsqlite = new object();

                    //多线程写  一定要加锁
                    Thread Th3 = new Thread(delegate ()
                    {
                        //批量写入测试
                        List<Aleseo.Database.Main.Entity.Models.demo_guiditem> demo_Guiditems = new List<Aleseo.Database.Main.Entity.Models.demo_guiditem>();


                        Parallel.For(0, 0, new ParallelOptions() { MaxDegreeOfParallelism = 1000 }, (i, loopState) =>
                        {
                            try
                            {
                                lock (lockObj_dbsqlite)
                                {
                                    demo_Guiditems.Add(new Aleseo.Database.Main.Entity.Models.demo_guiditem() { guid = i.ToString(), body = File.ReadAllText(@"D:\wwwrootRes\.....c4150a1b8b8005af3ad0127adb125fae.txt", Encoding.UTF8) });
                                }

                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine("写入异常," + ex.Message);
                            }

                        });

                        // 事务插入数据
                        if (demo_Guiditems.Count == 0) { return; }

                        System.Diagnostics.Stopwatch stopwatch = new System.Diagnostics.Stopwatch();
                        stopwatch.Reset();
                        stopwatch.Start();

                        using (var db = Aleseocore.Module.Aleseo.Database.Main.Base.GetInstance_demo_guid())
                        {


                            db.Utilities.PageEach(demo_Guiditems, 2, list =>
                            {
                                try
                                {

                                    //var t2 = db.Insertable(list).ExecuteCommand();
                                    var t2 = db.Updateable(list).ExecuteCommand();


                                }
                                catch (Exception ex)
                                {


                                }
                            });
                        }


                        stopwatch.Stop();
                        Console.WriteLine("成功导入{0}条数据 ，用时{1}秒。", demo_Guiditems.Count, stopwatch.Elapsed.TotalSeconds);

                        Console.WriteLine("执行完毕");



                    });
                    Th3.IsBackground = true;
                    Th3.Start();

                    //多线程读 无须加锁 //这是错误的 sqlite 读也要加锁 否则一切遇到写操作都会导致读失败
                    Thread Th4 = new Thread(delegate ()
                    {
                        Parallel.For(0, 0, new ParallelOptions() { MaxDegreeOfParallelism = 300 }, (i, loopState) =>
                        {
                            try
                            {
                                using (var db = Aleseocore.Module.Aleseo.Database.Main.Base.GetInstance_demo_guid())
                                {
                                    var urlitems = db.Queryable<Aleseo.Database.Main.Entity.Models.demo_guiditem>().OrderBy(it => SqlSugar.SqlFunc.GetRandom()).Take(50).ToList();
                                }
                            }
                            catch (Exception)
                            {
                                Console.WriteLine("读取异常");
                            }
                            lock (lockObj_dbsqlite)
                            {
                            }
                        });

                        Console.WriteLine("执行完毕");

                    });
                    Th4.IsBackground = true;
                    Th4.Start();

                    return true;
                }

```
