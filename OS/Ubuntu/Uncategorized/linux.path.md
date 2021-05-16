# Path 路径说明

- [如系统启动配置]/lib/systemd/system
- [网站存放路径]/var/www
- [Caddy 配置文件路径]/etc/caddy
- [usr] 指 Unix System Resource，/usr 目录包含所有的命令、程序库、文档和其它文件，我们可以命令到这个目录下，ls -al 看下，都是系统预装的可执行程序，会随着系统的升级而改变
- [/usr/local/bin] 目录是给用户放置自己的可执行程序，所以我们一般把我们可执行的脚本文件放到这个目录，这样我们在 linux 系统里面任何目录都可以运行了，
- 比如我们 Android 开发的时候把 pidcat.py 文件放到这个目录下面，我们从其它地方拷贝到这个目录的时候，要记得加上 sudo,需要管理员权限。
- bin 程序目录
- src 源代码目录

## ubuntu 如何进入 local、bin 目录

```shell
# 回到home目录，输入命令：
cd /usr/local

# 若要进入bin目录，输入命令：
cd /usr/local/bin
```

## 全民分享

- [linux 之/usr/local/bin 和/usr/bin 区别](https://blog.csdn.net/u011068702/article/details/80294806)
- [ubuntu 如何进入 local、bin 目录 - shrimp_929 - 博客园](https://www.cnblogs.com/shrimp-can/p/5253642.html)
