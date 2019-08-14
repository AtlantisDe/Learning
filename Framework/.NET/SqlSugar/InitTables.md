# InitTables

## Code First

- [生成表-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1149)

```c#
// 属性介绍

// 我们会根据字段的属性生成数据库字段



// IsNullable表示表字段是否可空

// IsIgnore 为true表示不会生成字段到数据库

// IsIdentity表示为自增列

// IsPrimaryKey表示为主键

// Length 表示字段长度

// DecimalDigits 表示字段的精度 4.4

// ColumnDataType  强制设置数据库字段的类型（考虑到切换数据库有些类型其它库没有最新版本支持多个以逗号隔离，比如=“number,int”）

  dbColumnInfo = new DbColumnInfo() { DbColumnName = "img1", DataType = "text", Length = 1500 }


public class CodeTable
{
        [SugarColumn(IsNullable =false ,IsPrimaryKey =true,IsIdentity =true)]
        public int Id { get; set; }
        [SugarColumn(Length = 21)]
        public string Name{ get; set; }
        [SugarColumn(IsNullable = true)]
        public bool IsOk { get; set; }
        public Guid Guid { get; set; }
        public decimal Decimal { get; set; }
        [SugarColumn(IsNullable = true)]
        public DateTime? DateTime { get; set; }
        [SugarColumn(IsNullable = true)]
        public double? Dob2 { get; set; }
        [SugarColumn(Length =10)]
        public string A { get; set; }
}


public class CodeTable2 {
        public int Id { get; set; }
        public string Name { get; set; }
        [SugarColumn(IsIgnore =true)]
        public string TestId { get; set; }
}


[SugarTable("T_logs")]
public class logitem
{
    [SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "guid")]
    public string guid { get; set; }
    public string type { get; set; }
    public string log { get; set; }
    public string addtime { get; set; }
}
```

### SugarColumn

```c#
[SugarColumn(IsIgnore = true)]
[SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "guid")]
[SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "guid", Length = 32)]
[SugarColumn(Length = 20)]
[SugarColumn(ColumnDataType = "text")]
[SugarColumn(ColumnDataType = "text", IsNullable = true)]

[SugarColumn(ColumnDataType = "text", IsNullable = true, Length = 255)]
[SugarColumn(IsNullable = true, Length = 255)]
[SugarColumn(IsNullable = false, DefaultValue = "0", Length = 2)]
[SugarColumn(ColumnDataType = "text", DefaultValue = "0", IsNullable = true)]
[SugarColumn(ColumnDataType = "text", DefaultValue = "false", IsNullable = true)]

```

### SugarColumn text

- SQLite Text 类型不支持 Length

```c#
[SugarColumn(ColumnDataType = "text", IsNullable = true)]
public string supporttag { get; set; }
```

### SugarColumn 时间

```c#
[SugarColumn(IsNullable = false)]
public DateTime? createtime { get; set; }
```

### SugarColumn INT

- 不能设置默认值否则报错

```c#
[SugarColumn(IsNullable = false, Length = 2)]
public int deployed { get; set; }


```

### SugarColumn bool / Boolean

- SQLite 没有单独的 Boolean 存储类。相反，布尔值被存储为整数 0（false）和 1（true）

```c#
[SugarColumn(IsNullable = true, Length = 1)]
public bool active { get; set; }
// 文本
[SugarColumn(IsNullable = true, Length = 5)]
public bool active { get; set; }
```
