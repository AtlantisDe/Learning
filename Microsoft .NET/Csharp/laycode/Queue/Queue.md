# Queue

## Wiki

- [C# 队列（Queue） | 菜鸟教程](https://www.runoob.com/csharp/csharp-queue.html)

## Demo

### 基本使用

```c#
Queue q = new Queue();

q.Enqueue('A');
q.Enqueue('M');
q.Enqueue('G');
q.Enqueue('W');

Console.WriteLine("Current queue: ");
foreach (char c in q)
Console.Write(c + " ");
Console.WriteLine();
q.Enqueue('V');
q.Enqueue('H');
Console.WriteLine("Current queue: ");
foreach (char c in q)
Console.Write(c + " ");
Console.WriteLine();
Console.WriteLine("Removing some values ");
char ch = (char)q.Dequeue();
Console.WriteLine("The removed value: {0}", ch);
ch = (char)q.Dequeue();
Console.WriteLine("The removed value: {0}", ch);
Console.ReadKey();

...........rst
Current queue:
A M G W
Current queue:
A M G W V H
Removing values
The removed value: A
The removed value: M
```

### 错误方法线程中示例

```c#

//任务队列DEMO

Queue<string> q = new Queue<string>();

Thread Th1 = new Thread(delegate ()
{

    Parallel.For(0, 5,
                        new ParallelOptions() { MaxDegreeOfParallelism = 100 },
    (i, loopState) =>
    {
        q.Enqueue(CsharpLazycode.Module.Laycode.words.Util.GenerateSurname());

    });



});
Th1.IsBackground = true;
Th1.Start();


Thread Th2 = new Thread(delegate ()
{
    while (true)
    {
        foreach (var c in q)
        {
            string ch = (string)q.Dequeue();
        }
    }


});
Th2.IsBackground = true;
Th2.Start();
```
