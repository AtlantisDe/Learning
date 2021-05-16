# RocksDbSharp

- [RocksDbSharp 6.2.2](https://www.nuget.org/packages/RocksDbSharp/)
- [warrenfalk/rocksdb-sharp](https://github.com/warrenfalk/rocksdb-sharp)
- [RocksDbNative 6.2.2](https://www.nuget.org/packages/RocksDbNative/)

## 0. 安装

```c#
Install-Package RocksDbSharp -Version 6.2.2

// This will install the managed library which will use the unmanaged library installed on the machine at runtime. If you do not want to install the managed library, you can include it by additionally installing the "RocksDbNative" package.

Install-Package RocksDbNative -Version 6.2.2


// Requirements
// On Linux and Mac, the snappy library (libsnappy) must be installed.
要求
在Linux和Mac上，必须安装snappy库（libsnappy）。

// 注意事项和警告：(Caveats and Warnings:)
// 仅64位（特别是在Windows上）
// 仅在64位模式下支持RocksDb。尽管我提供了一个修复程序，使其可以在32位模式下进行编译，但此程序未经测试且不受支持，可能根本无法工作，并且几乎可以肯定会至少存在一些主要问题，因此不应在生产中进行尝试。

// 64-bit only (Especially on Windows)
// RocksDb is supported only in 64-bit mode. Although I contributed a fix that allows it to compile in 32-bit mode, this is untested and unsupported, may not work at all, and almost certainly will have at least some major issues and should not be attempted in production.

```

## 1. 常用

- [RocksDbSharpTest/FunctionalTests.cs](https://github.com/warrenfalk/rocksdb-sharp/blob/master/tests/RocksDbSharpTest/FunctionalTests.cs)
- [SimpleExampleHighLevel](https://github.com/warrenfalk/rocksdb-sharp/blob/master/examples/SimpleExampleHighLevel/Program.cs)
- [列族示例 ColumnFamilyExample](https://github.com/warrenfalk/rocksdb-sharp/blob/master/examples/ColumnFamilyExample/Program.cs)

```c#

var db = RocksDbSharp.RocksDb.Open(new RocksDbSharp.DbOptions().SetCreateIfMissing(true), path);



/*列族*/
var columnFamilies = new RocksDbSharp.ColumnFamilies{
    { "default", new ColumnFamilyOptions().OptimizeForPointLookup(256) },{ "test", new ColumnFamilyOptions()
        //.SetWriteBufferSize(writeBufferSize)
        //.SetMaxWriteBufferNumber(maxWriteBufferNumber)
        //.SetMinWriteBufferNumberToMerge(minWriteBufferNumberToMerge)
        .SetMemtableHugePageSize(2 * 1024 * 1024)
        .SetPrefixExtractor(SliceTransform.CreateFixedPrefix((ulong)8))
        .SetBlockBasedTableFactory(bbto)
    },
};
/*获取列族*/
var cf = db.GetColumnFamily("test");

var path = $@"D:\Tmp\RocksDbSharp\TestDB001";
var options = new RocksDbSharp.DbOptions().SetCreateIfMissing(true);
using (var db = RocksDbSharp.RocksDb.Open(options, path))
{
    // Using strings below, but can also use byte arrays for both keys and values
    // much care has been taken to minimize buffer copying
    //使用以下字符串，但也可以将字节数组用于键和值
    //已采取了很多措施以尽量减少缓冲区复制

    db.Put("key", "value");
    string value = db.Get("key");
    db.Remove("key");

    var item1 = db.Get("item1");
}
```

## 2. ColumnFamilyExample

```c#
string temp = Path.GetTempPath();
string path = Environment.ExpandEnvironmentVariables(Path.Combine(temp, "rocksdb_cf_example"));

var options = new DbOptions()
    .SetCreateIfMissing(true)
    .SetCreateMissingColumnFamilies(true);

var columnFamilies = new ColumnFamilies
{
    { "reverse", new ColumnFamilyOptions() },
};

using (var db = RocksDb.Open(options, path, columnFamilies))
{
    var reverse = db.GetColumnFamily("reverse");

    db.Put("one", "uno");
    db.Put("two", "dos");
    db.Put("three", "tres");

    db.Put("uno", "one", cf: reverse);
    db.Put("dos", "two", cf: reverse);
    db.Put("tres", "three", cf: reverse);
}

using (var db = RocksDb.Open(options, path, columnFamilies))
{
    var reverse = db.GetColumnFamily("reverse");

    string uno = db.Get("one");
    string one = db.Get("uno", cf: reverse);
    string nada;
    nada = db.Get("uno");
    nada = db.Get("one", cf: reverse);
}

using (var db = RocksDb.Open(options, path, columnFamilies))
{
    db.DropColumnFamily("reverse");
    var reverse = db.CreateColumnFamily(new ColumnFamilyOptions(), "reverse");
    var nada = db.Get("uno", cf: reverse);
    db.Put("red", "rouge", cf: reverse);
}

using (var db = RocksDb.Open(options, path, columnFamilies))
{
    var reverse = db.GetColumnFamily("reverse");
    var nada = db.Get("uno", cf: reverse);
    var rouge = db.Get("red", cf: reverse);
}

using (var db = RocksDb.OpenReadOnly(options, path, columnFamilies, false))
{
    string uno = db.Get("one");
}
```

## 3. Prefix Example

```c#
// 前缀示例
string temp = Path.GetTempPath();
string path = Environment.ExpandEnvironmentVariables(Path.Combine(temp, "rocksdb_prefix_example"));
var bbto = new BlockBasedTableOptions()
    .SetFilterPolicy(BloomFilterPolicy.Create(10, false))
    .SetWholeKeyFiltering(false)
    ;
var options = new DbOptions()
    .SetCreateIfMissing(true)
    .SetCreateMissingColumnFamilies(true)
    ;
var columnFamilies = new ColumnFamilies
{
    { "default", new ColumnFamilyOptions().OptimizeForPointLookup(256) },
    { "test", new ColumnFamilyOptions()
        //.SetWriteBufferSize(writeBufferSize)
        //.SetMaxWriteBufferNumber(maxWriteBufferNumber)
        //.SetMinWriteBufferNumberToMerge(minWriteBufferNumberToMerge)
        .SetMemtableHugePageSize(2 * 1024 * 1024)
        .SetPrefixExtractor(SliceTransform.CreateFixedPrefix((ulong)8))
        .SetBlockBasedTableFactory(bbto)
    },
};
using (var db = RocksDb.Open(options, path, columnFamilies))
{
    var cf = db.GetColumnFamily("test");

    db.Put("00000000Zero", "", cf: cf);
    db.Put("00000000One", "", cf: cf);
    db.Put("00000000Two", "", cf: cf);
    db.Put("00000000Three", "", cf: cf);
    db.Put("00000001Red", "", cf: cf);
    db.Put("00000001Green", "", cf: cf);
    db.Put("00000001Black", "", cf: cf);
    db.Put("00000002Apple", "", cf: cf);
    db.Put("00000002Cranberry", "", cf: cf);
    db.Put("00000002Banana", "", cf: cf);

    var readOptions = new ReadOptions();
    using (var iter = db.NewIterator(readOptions: readOptions, cf: cf))
    {
        GC.Collect();
        GC.WaitForPendingFinalizers();
        var b = Encoding.UTF8.GetBytes("00000001");
        iter.Seek(b);
        while (iter.Valid())
        {
            Console.WriteLine(iter.StringKey());
            iter.Next();
        }
    }
}
Console.WriteLine("Done...");
```

## 4. SimpleExampleHighLevel

```c#
string temp = Path.GetTempPath();
string path = Environment.ExpandEnvironmentVariables(Path.Combine(temp, "rocksdb_simple_hl_example"));
// the Options class contains a set of configurable DB options
// that determines the behavior of a database
// Why is the syntax, SetXXX(), not very C#-like? See Options for an explanation
var options = new DbOptions()
    .SetCreateIfMissing(true)
    .EnableStatistics();
using (var db = RocksDb.Open(options, path))
{
    try
    {
        {
            // With strings
            string value = db.Get("key");
            db.Put("key", "value");
            value = db.Get("key");
            string iWillBeNull = db.Get("non-existent-key");
            db.Remove("key");
        }

        {
            // With bytes
            var key = Encoding.UTF8.GetBytes("key");
            byte[] value = Encoding.UTF8.GetBytes("value");
            db.Put(key, value);
            value = db.Get(key);
            byte[] iWillBeNull = db.Get(new byte[] { 0, 1, 2 });
            db.Remove(key);

            db.Put(key, new byte[] { 0, 1, 2, 3, 4, 5, 6, 7 });
        }

        {
            // With buffers
            var key = Encoding.UTF8.GetBytes("key");
            var buffer = new byte[100];
            long length = db.Get(key, buffer, 0, buffer.Length);
        }

        {
            // Removal of non-existent keys
            db.Remove("I don't exist");
        }

        {
            // Write batches
            // With strings
            using (WriteBatch batch = new WriteBatch()
                .Put("one", "uno")
                .Put("two", "deuce")
                .Put("two", "dos")
                .Put("three", "tres"))
            {
                db.Write(batch);
            }

            // With bytes
            var utf8 = Encoding.UTF8;
            using (WriteBatch batch = new WriteBatch()
                .Put(utf8.GetBytes("four"), new byte[] { 4, 4, 4 } )
                .Put(utf8.GetBytes("five"), new byte[] { 5, 5, 5 } ))
            {
                db.Write(batch);
            }
        }

        {
            // Snapshots
            using (var snapshot = db.CreateSnapshot())
            {
                var before = db.Get("one");
                db.Put("one", "1");

                var useSnapshot = new ReadOptions()
                    .SetSnapshot(snapshot);

                // the database value was written
                Debug.Assert(db.Get("one") == "1");
                // but the snapshot still sees the old version
                var after = db.Get("one", readOptions: useSnapshot);
                Debug.Assert(after == before);
            }
        }

        var two = db.Get("two");
        Debug.Assert(two == "dos");

        {
            // Iterators
            using (var iterator = db.NewIterator(
                readOptions: new ReadOptions()
                    .SetIterateUpperBound("t")
                    ))
            {
                iterator.Seek("k");
                Debug.Assert(iterator.Valid());
                Debug.Assert(iterator.StringKey() == "key");
                iterator.Next();
                Debug.Assert(iterator.Valid());
                Debug.Assert(iterator.StringKey() == "one");
                Debug.Assert(iterator.StringValue() == "1");
                iterator.Next();
                Debug.Assert(!iterator.Valid());
            }
        }

    }
    catch (RocksDbException)
    {

    }
}
```

## 5. SimpleExampleLowLevel

```c#
        static string temp = Path.GetTempPath();
        static string DBPath = Environment.ExpandEnvironmentVariables(Path.Combine(temp, "rocksdb_simple_example"));
        static string DBBackupPath = Environment.ExpandEnvironmentVariables(Path.Combine(temp, "rocksdb_simple_example_backup"));

        static void Main(string[] args)
        {
            IntPtr db;
            IntPtr be;
            IntPtr options = Native.Instance.rocksdb_options_create();
            // Optimize RocksDB. This is the easiest way to
            // get RocksDB to perform well
            int cpus = Environment.ProcessorCount;
            Native.Instance.rocksdb_options_increase_parallelism(options, cpus);
            Native.Instance.rocksdb_options_optimize_level_style_compaction(options, 0);
            // create the DB if it's not already present
            Native.Instance.rocksdb_options_set_create_if_missing(options, true);

            // open DB
            IntPtr err = IntPtr.Zero;
            db = Native.Instance.rocksdb_open(options, DBPath, out err);
            Debug.Assert(err == IntPtr.Zero);

            // open Backup Engine that we will use for backing up our database
            be = Native.Instance.rocksdb_backup_engine_open(options, DBBackupPath, out err);
            Debug.Assert(err == IntPtr.Zero);

            // Put key-value
            IntPtr writeoptions = Native.Instance.rocksdb_writeoptions_create();
            string key = "key";
            string value = "value";
            Native.Instance.rocksdb_put(db, writeoptions, key, value,
                        out err);
            Debug.Assert(err == IntPtr.Zero);
            // Get value
            IntPtr readoptions = Native.Instance.rocksdb_readoptions_create();
            string returned_value =
                Native.Instance.rocksdb_get(db, readoptions, key, out err);
            Debug.Assert(err == IntPtr.Zero);
            Debug.Assert(returned_value == "value");

            // create new backup in a directory specified by DBBackupPath
            Native.Instance.rocksdb_backup_engine_create_new_backup(be, db, out err);
            Debug.Assert(err == IntPtr.Zero);

            Native.Instance.rocksdb_close(db);

            // If something is wrong, you might want to restore data from last backup
            IntPtr restore_options = Native.Instance.rocksdb_restore_options_create();
            Native.Instance.rocksdb_backup_engine_restore_db_from_latest_backup(be, DBPath, DBPath,
                                                                restore_options, out err);
            Debug.Assert(err == IntPtr.Zero);
            Native.Instance.rocksdb_restore_options_destroy(restore_options);

            db = Native.Instance.rocksdb_open(options, DBPath, out err);
            Debug.Assert(err == IntPtr.Zero);

            // cleanup
            Native.Instance.rocksdb_writeoptions_destroy(writeoptions);
            Native.Instance.rocksdb_readoptions_destroy(readoptions);
            Native.Instance.rocksdb_options_destroy(options);
            Native.Instance.rocksdb_backup_engine_close(be);
            Native.Instance.rocksdb_close(db);

            OtherExamples();
        }

        static void OtherExamples()
        {
            MultiGetExample();
        }

        static void MultiGetExample()
        {
            // Multiget
            IntPtr db;
            IntPtr options = Native.Instance.rocksdb_options_create();
            int cpus = Environment.ProcessorCount;
            Native.Instance.rocksdb_options_increase_parallelism(options, cpus);
            Native.Instance.rocksdb_options_optimize_level_style_compaction(options, 0);
            // create the DB if it's not already present
            Native.Instance.rocksdb_options_set_create_if_missing(options, true);

            // open DB
            IntPtr err = IntPtr.Zero;
            db = Native.Instance.rocksdb_open(options, DBPath, out err);
            Debug.Assert(err == IntPtr.Zero);

            // Put key-value
            IntPtr writeoptions = Native.Instance.rocksdb_writeoptions_create();
            Native.Instance.rocksdb_put(db, writeoptions, "one", "uno", out err);
            Debug.Assert(err == IntPtr.Zero);
            Native.Instance.rocksdb_put(db, writeoptions, "two", "dos", out err);
            Debug.Assert(err == IntPtr.Zero);
            Native.Instance.rocksdb_put(db, writeoptions, "three", "tres", out err);
            Debug.Assert(err == IntPtr.Zero);
            Native.Instance.rocksdb_put(db, writeoptions, "five", "五", out err);
            Debug.Assert(err == IntPtr.Zero);

            // Get value
            IntPtr readoptions = Native.Instance.rocksdb_readoptions_create();
            var values = Native.Instance.rocksdb_multi_get(db, readoptions, new[] { "two", "four", "five" });

            Debug.Assert(values[2].Value == "五");

            string returned_value =
                Native.Instance.rocksdb_get(db, readoptions, "one", out err);
            Debug.Assert(err == IntPtr.Zero);
            Debug.Assert(returned_value == "uno");

            // cleanup
            Native.Instance.rocksdb_writeoptions_destroy(writeoptions);
            Native.Instance.rocksdb_readoptions_destroy(readoptions);
            Native.Instance.rocksdb_options_destroy(options);
            Native.Instance.rocksdb_close(db);
        }
```
