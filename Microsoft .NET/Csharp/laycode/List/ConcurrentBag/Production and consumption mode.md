# Production and consumption mode 生产消费模式

- [Production and consumption mode 生产消费模式](https://blog.csdn.net/u011109589/article/details/80519863)

## 常用

### 1. 生产消费模式 Demo 代码

```c#
    public class ConcurrentBagDemo
    {
        public static bool Go()
        {
            ConcurrentBag<int> cb = new ConcurrentBag<int>();
            var tasks = new List<Task>
            {

                Task.Run(() => {

                                Parallel.For(0, 10000000, new ParallelOptions() { MaxDegreeOfParallelism = 10000 }, (i, loopState) =>
                                {
                               cb.Add(i);
                                });

                    return true; }),

                Task.Run(() => {

                                Parallel.For(0, 10000000, new ParallelOptions() { MaxDegreeOfParallelism = 10000 }, (i, loopState) =>
                                {
                                       cb.Add(i);
                                });


                    return true; }),



                Task.Run(() => {

                                Parallel.For(0, 20000000, new ParallelOptions() { MaxDegreeOfParallelism = 10000 }, (i, loopState) =>
                                {
                                        if (cb.TryTake(out int item))
                                        {

                                        }

                                });


                    return true; })



            };
            Task.WaitAll(tasks.ToArray());


            return true;
        }


    }

```
