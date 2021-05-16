# Serilog.Sinks.SQLite

- [Serilog.Sinks.SQLite 5.0.0](https://www.nuget.org/packages/Serilog.Sinks.SQLite/)
- [saleem-mirza/serilog-sinks-sqlite](https://github.com/saleem-mirza/serilog-sinks-sqlite)

## 常用

```c#
var logger = new LoggerConfiguration()
    .WriteTo.SQLite(@"Logs\log.db")
    .CreateLogger();

var logger = new LoggerConfiguration().WriteTo.SQLite(@"D:\Tmp\Serilog\SQLite\log.db").CreateLogger();

logger.Information("This informational message will be written to SQLite database");
```
