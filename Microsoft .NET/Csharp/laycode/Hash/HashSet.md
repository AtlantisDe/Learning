# HashSet

## 常用

### 1. List 去重

```c#
HashSet<string> hs = new HashSet<string>(list);

HashSet<string> hs = new HashSet<string>(root.Domains);
root.Domains = new List<string>();
foreach (var item in hs)
{
    root.Domains.Add(item);
}
```
