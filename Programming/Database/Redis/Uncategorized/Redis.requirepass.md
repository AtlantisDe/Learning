# Redis 安全

- [Redis 密码设置和查看密码 - aspsea - 博客园](https://www.cnblogs.com/aspsea/articles/10964606.html)
- [知此事要躬行-CSDN博客](https://blog.csdn.net/boonya/article/details/95189534)

## 常用

```c#
redis-cli.exe -h 127.0.0.1 -p 6379

CONFIG get requirepass
CONFIG set requirepass "google"

// AUTH 命令基本语法格式如下：
AUTH password
AUTH google

redis-cli -p 6379 -a google
```
