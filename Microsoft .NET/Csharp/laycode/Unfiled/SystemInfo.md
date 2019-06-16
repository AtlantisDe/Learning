# SystemInfo

## 无法加载计数器名称数据，因为从注册表读取的索引“”无效 解决方法

- [无法加载计数器名称数据，因为从注册表读取的索引“”无效 解决方法 - 高山老王 - 博客园](https://www.cnblogs.com/wdkshy/p/3613110.html)

```c#
“不能添加这些计数器”
\memorry\Available Mbytes
\memorry\%committed bytes in use
\memorry\cache faults/sec
\memorry\cache faults/sec
\physicalDisk（*）\% idle time
\physicalDisk（*）\avg.disk queue length
\network interface（*）\bytes total/sec

解决方法：

cmd（管理员身份打开），输入 ”lodctr /r”
```
