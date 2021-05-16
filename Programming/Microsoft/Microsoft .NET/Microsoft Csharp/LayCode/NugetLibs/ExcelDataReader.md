# ExcelDataReader

- [Getting Title at 15:54](https://github.com/ExcelDataReader/ExcelDataReader)

## 安装

- [Getting Title at 14:50](https://www.nuget.org/packages/ExcelDataReader)
- [ExcelDataReader.DataSet 3.6.0](https://www.nuget.org/packages/ExcelDataReader.DataSet)

```c#
Install-Package ExcelDataReader -Version 3.6.0
Install-Package ExcelDataReader.DataSet -Version 3.6.0
```

## 常用

### 0. Demo 0

```c#
var filePath = $@"C:\Tmp\备份\自定义版本.xlsx";
using (var stream = File.Open(filePath, FileMode.Open, FileAccess.Read))
{
    using (var reader = ExcelReaderFactory.CreateReader(stream))
    {
        do { while (reader.Read()) { } } while (reader.NextResult());
        var result = reader.AsDataSet();

        for (int i = 0; i < result.Tables.Count; i++)
        {
            var tb = result.Tables[i];
            for (int j = 0; j < tb.Rows.Count; j++)
            {
                var row = tb.Rows[i];
                var v0 = row.ItemArray[0].ToString();
            }
        }
    }
}
```

### 1. Demo 1

```c#
var filePath = $@"C:\Tmp\备份\自定义版本.xlsx";
using (var stream = File.Open(filePath, FileMode.Open, FileAccess.Read))
{
    // Auto-detect format, supports:
    //  - Binary Excel files (2.0-2003 format; *.xls)
    //  - OpenXml Excel files (2007 format; *.xlsx, *.xlsb)
    using (var reader = ExcelReaderFactory.CreateReader(stream))
    {
        // Choose one of either 1 or 2:

        // 1. Use the reader methods
        do
        {
            while (reader.Read())
            {
                // reader.GetDouble(0);
            }
        } while (reader.NextResult());

        // 2. Use the AsDataSet extension method
        var result = reader.AsDataSet();

        // The result of each spreadsheet is in result.Tables

        var tb1 = result.Tables[0];
        for (int i = 0; i < tb1.Rows.Count; i++)
        {
            var row = tb1.Rows[i];
            var v0 = row.ItemArray[0].ToString();
        }

    }
}
```
