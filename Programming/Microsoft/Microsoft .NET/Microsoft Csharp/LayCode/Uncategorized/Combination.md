# Combination 组合算法

- [Unique combinations of list](https://stackoverflow.com/questions/12249051/unique-combinations-of-list/57248447#57248447)
- [c# C(m,n) 排列组合算法\_ajianchina 的博客-CSDN 博客](https://blog.csdn.net/ajianchina/article/details/46369321)
- [C# 如何组合成的。是排列还是组合](https://zhidao.baidu.com/question/1834395990619658460.html)
- [What is the best way to find all combinations of items in an array?](https://stackoverflow.com/questions/1952153/what-is-the-best-way-to-find-all-combinations-of-items-in-an-array)
- [n k combinations in C# | technical-recipes.com](https://www.technical-recipes.com/2017/obtaining-combinations-of-k-elements-from-n-in-c/)
- [CHINA - 中文开源技术交流社区](https://my.oschina.net/asxinyu/blog/474133)

## 常用

### 0. 常用

- [C#实现排列、组合 - 大师兄丶 - 博客园](https://www.cnblogs.com/zhao-yi/p/8533035.html)

```c#
//排列组合的概念
//排列：从n个不同元素中取出m（m≤n）个元素，按照一定的顺序排成一列，叫做从n个元素中取出m个元素的一个排列(Arrangement)。
//组合：从m个不同的元素中，任取n（n≤m）个元素为一组，叫作从m个不同元素中取出n个元素的一个组合。

void Main()
{
    var list = new List<string> { "a", "b", "c", "d", "e" };
    var result = GetPermutations(list, 3);
}

IEnumerable<IEnumerable<T>> GetPermutations<T>(IEnumerable<T> items, int count)
{
    int i = 0;
    foreach(var item in items)
    {
        if(count == 1)
            yield return new T[] { item };
        else
        {
            foreach(var result in GetPermutations(items.Skip(i + 1), count - 1))
                yield return new T[] { item }.Concat(result);
        }

        ++i;
    }
}
```

### 1. 无法运行 Long 版本

```c#
Combo("一二三四五六七八九十").Where(x => x.Length >= 2 && x.Length <= 7).ToList().ForEach(x => Console.WriteLine(x));
Combo("0123456789").Where(x => x.Length >= 2 && x.Length <= 3).ToList().ForEach(x => Console.WriteLine(x));

 public static IEnumerable<string> Combo(string s)
        {
            foreach (var x in (Enumerable.Range(1, Convert.ToInt32(Math.Pow((double)2, (double)s.Length)) - 1)))
            {
                string r = "";
                var x1 = x;
                for (int i = 0; i < s.Length; i++)
                {
                    r += x1 % 2 == 0 ? "" : s[i].ToString();
                    x1 /= 2;
                }
                yield return r;
            }
        }

```

### 2. C(m,n) 排列组合算法

- [c# C(m,n) 排列组合算法\_ajianchina 的博客-CSDN 博客](https://blog.csdn.net/ajianchina/article/details/46369321)

```c#
// n从1到m的所有组合：
static void Main()
{
    string[] arr = new string[] { "a", "b", "c", "d", "e" };
    List<string[]> list = new List<string[]>();
    foreach (string s in arr)
    {
        List<string[]> lst = list.GetRange(0, list.Count);
        string[] nArr = { s };
        list.Add(nArr);
        foreach (string[] ss in lst)
        {
            list.Add(ss.Concat(nArr).ToArray());
        }
    }
    List<string[]> outList = list.OrderByDescending(p => p.Length).ToList();
    outList.ForEach(p => Console.WriteLine(string.Join(",", p)));
}
// n以内的所有组合：
static void Main()
{
    string[] arr = new string[] { "a", "b", "c", "d", "e" };
    int n = 2;//长度为2以内的所有组合
    List<string[]> list = new List<string[]>();
    foreach (string s in arr)
    {
        List<string[]> lst = list.Where(p => p.Length < n).ToList();
        string[] nArr = { s };
        list.Add(nArr);
        foreach (string[] ss in lst)
        {
            list.Add(ss.Concat(nArr).ToArray());
        }
    }
    List<string[]> outList = list.OrderByDescending(p => p.Length).ToList();
    outList.ForEach(p => Console.WriteLine(string.Join(",", p)));
}
```

### 3. 排列组合 ExtenionsTechniques 版本

```c#
        /// <summary>排列组合 ExtenionsTechniques  版本</summary>
        public static bool DebugDemo6ExtenionsTechniques(bool IsDebugging = false)
        {
            if (IsDebugging == false) { return false; }


            int k = 3;
            var n = new[] { "1", "2", "3", "4", "5" };

            Console.Write("n: ");
            foreach (var item in n)
            {
                Console.Write("{0} ", item);
            }
            Console.WriteLine();
            Console.WriteLine("k: {0}", k);
            Console.WriteLine();

            foreach (IEnumerable<string> i in ExtenionsTechniques.Combinations(n, k))
            {
                Console.WriteLine(string.Join(" ", i));
            }

            //1 2 3
            //1 2 4
            //1 2 5
            //1 3 4
            //1 3 5
            //1 4 5
            //2 3 4
            //2 3 5
            //2 4 5
            //3 4 5

            return true;
        }

```
