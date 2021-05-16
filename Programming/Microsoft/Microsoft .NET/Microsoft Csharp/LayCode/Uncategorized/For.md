# For

## 1. 倒序

```c#
for (int j = items.Count - 1; j >= 0; j--)
{

}
```

## 2. 倒序删除元素

```c#
var html0 = $@"C:\Tmp\备份\正在使用的.txt".ReadDocument();
for (int i = Stocks.Count - 1; i >= 0; i--)
{
    if (html0.Contains(Stocks[i].Symbol) == true)
    {
        Console.WriteLine("删除元素：" + i);
        Stocks.Remove(Stocks[i]);
    }
}
```
