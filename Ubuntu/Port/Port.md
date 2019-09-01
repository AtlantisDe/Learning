# Port

- 端口号的理论值范围是从 0 到 65535，公认的是 0-1023 ，注册端口是 1024-49152，还有随机动态端口是 49152-65535，共是 65536 个端口。
- 查看服务端口查看已经连接的服务端口（ESTABLISHED）：
- netstat -a
- 查看所有的服务端口（LISTEN，ESTABLISHED）：
- netstat -ap

- 查看指定端口 查看指定端口，可以结合 grep 命令：

```c#
netstat -ap | grep 8080
netstat -ap | grep 80
```

- 也可以使用 lsof 命令：
- lsof -i:8080

## 关闭端口使用

```text
若要关闭使用这个端口的程序，使用kill + 对应的pid:：   kill -9 PID号
ps：kill就是给某个进程id发送了一个信号。默认发送的信号是SIGTERM，而kill -9发送的信号是SIGKILL，即exit。exit信号不会被系统阻塞，所以kill -9能顺利杀掉进程。
```

## 常用查看端口列表

```shell
netstat -ap | grep 80
netstat -ap | grep 8080
netstat -ap | grep 8080
netstat -ap | grep 800

```
