# NFS

- 文件共享(NFS)
- [文件共享第三方插件---- 让你的文件无所不在 - 第三方应用 - 宝塔面板论坛](https://www.bt.cn/bbs/thread-21265-1-1.html)

= 需要开启的端口： 8001 2049 892 662 32803 32769（安全组开放这些端口）

- 防火墙已经自动开启了，只需要开启安全组的端口

## 开启安全组的端口

- 文件共享(NFS)

```port
8001
2049
892
662
32803
2769

sudo ufw allow 8001
sudo ufw allow 2049
sudo ufw allow 892
sudo ufw allow 32803
sudo ufw allow 2769

```

## RPC: 远程系统错误 RPC: 端口映射器故障 - RPC: 已超时。
