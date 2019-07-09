# Repair

- SQLite 有一个很严重的缺点就是不提供 Repair 命令.
- 导致死亡提示 database disk image is malformed 它的产生有很多种可能,
- 比如,磁盘空间不足,还有就是写入数据过程中突然掉电等.官

- [SQLite 数据库错误：The database disk image is malformed 解决(修复)方法 - 林鹤霄 - ITeye 博客](https://linhexiao.iteye.com/blog/2342808)
- [使用 SQLite 的感想 - 猴健居士 - 博客园](https://www.cnblogs.com/HopeGi/archive/2013/05/28/3102922.html)
- [sqlite 错误 database disk image is malformed 可解决 - wolfking0608 的博客 - CSDN 博客](https://blog.csdn.net/wolfking0608/article/details/71076588)
- [讨论 SQLite 数据库损坏与修复 - 飞龙在天 - CSDN 博客](https://blog.csdn.net/dragonpeng2008/article/details/52094269)

## 大型文件修复

```txt
最后这个问题还是解决了，我的解决方法是：
下载SQLite Expert Professional，一定要Professional版(收费)的，Personal版(免费)的没有修复功能。
```

### sqlite3 下载

```txt
sqlite-tools-win32-x86-3280000.zip
(1.70 MiB) A bundle of command-line tools for managing SQLite database files, including the command-line shell program, the sqldiff.exe program, and the sqlite3_analyzer.exe program.
(sha1: 4063fe326243ab775a86c104fa77ac178f03976b)
```
