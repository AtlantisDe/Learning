# switch

- [switch 与 ifelse 的效率问题 - balingybj - 博客园](https://www.cnblogs.com/balingybj/p/5751707.html)

```c#
// 由此看来，switch有点以空间换时间的意思，而事实上也的确如此。


// 1.当分支较多时，当时用switch的效率是很高的。因为switch是随机访问的，就是确定了选择值之后直接跳转到那个特定的分支，但是if。。else是遍历所以得可能值，知道找到符合条件的分支。如此看来，switch的效率确实比ifelse要高的多。

// 2.由上面的汇编代码可知道，switch...case占用较多的代码空间，因为它要生成跳表，特别是当case常量分布范围很大但实际有效值又比较少的情况，switch...case的空间利用率将变得很低。

// 3.switch...case只能处理case为常量的情况，对非常量的情况是无能为力的。例如 if (a > 1 && a < 100)，是无法使用switch...case来处理的。所以，switch只能是在常量选择分支时比ifelse效率高，但是ifelse能应用于更多的场合，ifelse比较灵活。

```

## switch 快速分支
