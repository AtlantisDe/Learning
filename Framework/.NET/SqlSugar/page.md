# 分页查询

```c#
public static bool ReleaseResources()
{
    Thread oThread = new Thread(delegate ()
    {

        System.Diagnostics.Stopwatch stopwatch = new System.Diagnostics.Stopwatch();
        stopwatch.Reset();
        stopwatch.Start();

        var pageIndex = 1;
        var pageSize = 1000;
        var totalCount = 0;
        var totalPage = 1;

        object lockObj_lock = new object();
        var SuccessTotalCount = 0;

        using (var db = GetInstance_main_urlitems())
        {
            var urlitems = db.Queryable<urlitem>().ToPageList(pageIndex, pageSize, ref totalCount, ref totalPage);


        }

        Parallel.For(0, totalPage, new ParallelOptions() { MaxDegreeOfParallelism =60 }, (i, loopState) =>
        {
            using (var db = GetInstance_main_urlitems())
            {
                var urlitems = db.Queryable<urlitem>().Select("guid").ToPageList(i+1, pageSize);
                lock (lockObj_lock)
                {
                    SuccessTotalCount += urlitems.Count;
                }

            }
        });

        stopwatch.Stop();
        Console.WriteLine("总数据量:{0}", totalCount);
        Console.WriteLine("成功遍历{0}条数据 ，用时{1}秒。", SuccessTotalCount, stopwatch.Elapsed.TotalSeconds);
        Console.WriteLine("总页数:{0}", totalPage);

    });
    oThread.IsBackground = true;
    oThread.Start();


    return true;
}

```
