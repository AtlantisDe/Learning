# Redis

- [Ubuntu16.04 安装 Redis](https://www.cnblogs.com/zongfa/p/7808807.html)

## 安装 Redis 服务器端

```shell
sudo apt-get install redis-server
```

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
