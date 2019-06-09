# List

## wiki

- [C# List 集合 where 的用法 - Fly_bokeyuan - 博客园](https://www.cnblogs.com/-Fly/p/7765517.html)

## 用法

### List 集合 where 的用法

- 1、单个条件

```c#
//Name是传入的参数值
   List<Test> list = new List<Test>();
   list = list.Where(a => a.testName.Contains(Name)).ToList();
```

- 2、多个条件合并查询

```c#
//Number_Name是传入的参数值
  List<Test> list = new List<Test>();
  list = list.Where(a => a.testNumber.Contains(Number_Name) || a.testName.Contains(Number_Name)).ToList();
  //
  List<Test> list = new List<Test>();
  list = list.Where(a => a.testNumber.Contains(Number_Name) && a.testName.Contains(Number_Name)).ToList();
```
