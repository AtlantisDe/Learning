# Redis Ubuntu

- [Redis](https://redis.io/)
- [Try Redis](http://try.redis.io/)
- [Redis 教程](http://www.runoob.com/redis/redis-tutorial.html)

## APT 安装

```shell
sudo apt-get update
sudo apt-get install redis-server
```

## 启动 Redis

```shell
Redis version=4.0.11
```

## 查看 redis 是否启动

```shell
redis-cli

# 以上命令将打开以下终端：

redis 127.0.0.1:6379>
# 127.0.0.1 是本机 IP ，6379 是 redis 服务端口。现在我们输入 PING 命令。

redis 127.0.0.1:6379> ping
PONG

# 以上说明我们已经成功安装了redis。
```

## 执行 quit 命令退出，现在可以通过下面的命令查看到该进程

```shell
ps -ef|grep redis
```

## 如何停止服务器

```shell
# 在客户端里面输入shutdown命令即可，退出客户端用exit
redis 127.0.0.1:6379> shutdown

```

## 方式二：编译安装

- [ubuntu 16.04 安装 redis 的两种方式（apt 和编译方式）和卸载](https://blog.csdn.net/Mikeoperfect/article/details/79468944)

## 检查 Redis 服务器系统进程

```shell
ps -aux|grep redis
```

## 通过启动命令检查 Redis 服务器状态

```shell
netstat -nlt|grep 6379
```

## 通过启动命令检查 Redis 服务器状态 2

```shell
sudo /etc/init.d/redis-server status
```

## 通过命令行客户端访问 Redis

```shell
# 安装Redis服务器，会自动地一起安装Redis命令行客户端程序。
# 在本机输入redis-cli命令就可以启动，客户端程序访问Redis服务器。
~ redis-cli
redis 127.0.0.1:6379>

# 命令行的帮助

redis 127.0.0.1:6379> help
redis-cli 2.2.12
Type: "help @" to get a list of commands in
      "help " for help on
      "help " to get a list of possible help topics
      "quit" to exit


# 查看所有的key列表

redis 127.0.0.1:6379> keys *
(empty list or set)
```

## 基本的 Redis 客户端命令操作

- [拉到最低](https://www.cnblogs.com/zongfa/p/7808807.html)
