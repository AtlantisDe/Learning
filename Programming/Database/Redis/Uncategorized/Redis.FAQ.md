# Redis.FAQ

- [请检查 Redis 日志，了解有关错误的详细信息。 - Mr_Yun - 博客园](https://www.cnblogs.com/yunwangjun-python-520/p/11300715.html)

## 常见错误

### 1. 解决---MISCONF Redis 被配置为保存 RDB 快照，但目前无法在磁盘上存留。可能修改数据集的命令被禁用。请检查 Redis 日志，了解有关错误的详细信息

```c#
// 在启动redis服务后，输入下面命令就可以了，在启动就好了
config set stop-writes-on-bgsave-error no
```
