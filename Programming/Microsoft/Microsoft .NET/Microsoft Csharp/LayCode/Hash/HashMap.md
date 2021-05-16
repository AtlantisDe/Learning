# HashMap

- [C#中 Hashtable 和 HashMap 的区别--很详细; - 诗悦个人精品 - 博客园](https://www.cnblogs.com/qiliping/archive/2011/07/29/2121158.html)
- [C#中 Hashtable 和 HashMap 的區別](https://iter01.com/158503.html)

## 常用

```c#
在.Net 模仿java 的過程中拋棄了 HashMap ，所以以後再去面試.Net的時候當別人問你HashTable 和HashMap 的區別的時候，請告訴他，C#.Net 中 沒有HashMap

這裡簡單分析他們的區別。

1.HashTable的方法是同步的，HashMap未經同步，所以在多執行緒場合要手動同步HashMap這個區別就像Vector和ArrayList一樣。

2.HashTable不允許null值(key和value都不可以),HashMap允許null值(key和value都可以)。

3.HashTable有一個contains(Object value)，功能和containsValue(Object value)功能一樣。

4.HashTable使用Enumeration，HashMap使用Iterator。 以上只是表面的不同，它們的實現也有很大的不同。

5.HashTable中hash陣列預設大小是11，增加的方式是 old*2+1。HashMap中hash陣列的預設大小是16，而且一定是2的指數。

6.雜湊值的使用不同，HashTable直接使用物件的hashCode，程式碼是這樣的：
```
