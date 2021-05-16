# Combinatorics

- [eoincampbell/combinatorics](https://github.com/eoincampbell/combinatorics)
- [【原创】开源.NET 排列组合组件 KwCombinatorics 使用(一)—组合生成](https://my.oschina.net/asxinyu/blog/474133)
- [【原创】开源.NET 排列组合组件 KwCombinatorics 使用(一)—组合生成 - 数据之巅 - 博客园](https://www.cnblogs.com/asxinyu/p/4257026.html)
- [CodePlex Archive](https://archive.codeplex.com/?p=kwcombinatorics)

## 安装

- [Combinatorics 1.1.0.19](https://www.nuget.org/packages/Combinatorics)

```c#
Install-Package Combinatorics -Version 1.1.0.19
```

## 使用

- [eoincampbell/combinatorics](https://github.com/eoincampbell/combinatorics/blob/deployment/Combinatorics.NugetTests/CombinatoricTests.cs)
- [CombinatoricTests.cs](https://github.com/eoincampbell/combinatorics/blob/deployment/Combinatorics.LocalTests/CombinatoricTests.cs)

```c#
/*
测试内容:{A B C}的重复变化选择2：{A A}，{A B}，{A C}，{BA}，{BB}，{BC}，{CA}，{CA}，{CC}
测试结果:
备注信息:
*/

var integers = new List<int> { 1, 2, 3, 4, 5, 6 };

var v = new Combinatorics.Collections.Variations<int>(integers, 3, Combinatorics.Collections.GenerateOption.WithRepetition);

foreach (var vv in v)
{
    System.Diagnostics.Debug.WriteLine(string.Join(",", vv));
}

// 测试2
var integers = "ABCDEF0123456789".ToArray().ToList();
var v = new Combinatorics.Collections.Variations<char>(integers, 3, Combinatorics.Collections.GenerateOption.WithRepetition);
var items = new List<string>();
foreach (var vv in v)
{
//var v0 = string.Join(",", vv);
var v0 = string.Join("", vv);
items.Add(v0);
//System.Diagnostics.Debug.WriteLine(v0);
}

```
