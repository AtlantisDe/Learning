# foreach

## 常用

- [C# foreach 如何判断是第一项或是最后一项](http://www.zkea.net/codesnippet/detail/foreach-first-last.html)

```c#
// C# foreach 可以很方便的循环，但是跟for不一样，不能准确的知道当前项是否是第一或是最后一项，而我们在循环的时候又经常需要对第一项或者是最后一项做逻辑判断。那怎么办呢？简单，先取出第一项，或者是最后一项就好啦。

Item last = Model.Results.Last();
foreach (Item result in Model.Results)
{
    // do something with each item
    if (result.Equals(last))
    {
        // do something different with the last item
    }
    else
    {
        // do something different with every item but the last
    }
}
```
