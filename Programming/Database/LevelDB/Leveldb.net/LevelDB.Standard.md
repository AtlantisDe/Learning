# LevelDB.Standard / Leveldb.net

- [oodrive/leveldb.net](https://github.com/oodrive/leveldb.net)
- [C#中使用多款 LevelDB.Net 封装测试性能 - 宋兴柱 - 博客园](https://www.cnblogs.com/songxingzhu/p/6009556.html)

## NuGet package

```c#
PM> Install-Package LevelDB.Standard
```

## 常用

```c#
// Open a connection to a new DB and create if not found
var options = new LevelDB.Options { CreateIfMissing = true };
var db = new LevelDB.DB(options, @"C:\temp\tempdb");

static LevelDB.DB db = new LevelDB.DB(new LevelDB.Options { CreateIfMissing = true }, @"C:\temp\tempdb");

// Closing a Database
db.Close();
```

### 1. Reads and Writes

```c#
const string key = "New York";

// Put in the key value
keyValue.Put(key, "blue");

// Print out the value
var keyValue = db.Get(key);
Console.WriteLine(keyValue);

// Delete the key
db.Delete(key);
```

### 2. Atomic Updates

```c#
ar options = new Options { CreateIfMissing = true };
using (var db = new DB(options, path))
{
    db.Put("NA", "Na");

    using(var batch = new WriteBatch())
    {
        batch.Delete("NA")
             .Put("Tampa", "Green")
             .Put("London", "red")
             .Put("New York", "blue");
        db.Write(batch);
    }
}
```

### 3. Iteration

```c#
var keys =
    from kv in db as IEnumerable<KeyValuePair<string, string>>
    select kv.Key;

foreach (var key in keys)
{
    Console.WriteLine("Key: {0}", key);
}


 var keys = from kv in db as IEnumerable<KeyValuePair<string, string>> select kv.Key;
            foreach (var key in keys)
            {
                //Console.WriteLine("Key: {0}", key);
            }
```
