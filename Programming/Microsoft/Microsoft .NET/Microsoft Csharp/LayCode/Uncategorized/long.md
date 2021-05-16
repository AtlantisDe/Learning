# long

- [两个 long 类型的数值相除问题 - 树洪的博客 - CSDN 博客](https://blog.csdn.net/qq_22158021/article/details/77005418)

## 两个 long 类型的数值相除，结果会自动取整。当两个数相除结果是零点几的时候，如何避免结果自动取整为 0

```c#
解决：

在做除的操作时，被除数先乘以1.0再去除以除数，这样得到的结果就是小数而不会取整为零。

示例：

long a = 1;
long b = 2;
System.out.println(a/b);      //结果为 0
System.out.println(a*1.0/b);  //结果为  0.5

long a = 50000000000000;
long b = 11762190476226;
Console.WriteLine(b * 1.0 / a);  

var a = 50000000000000;
var b = 11762190476226;
console.log(b * 1.0 / a);


```
