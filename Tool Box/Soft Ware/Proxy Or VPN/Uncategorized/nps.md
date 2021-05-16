# nps

```c#
一款轻量级、高性能、功能强大的内网穿透代理服务器

几乎支持所有协议
支持内网http代理、内网socks5代理、p2p等
简洁但功能强大的WEB管理界面
支持服务端、客户端同时控制
扩展功能强大
全平台兼容，一键注册为服务。
```

- [ehang-io/nps](https://github.com/ehang-io/nps)
- [Document](https://ehang-io.github.io/nps/#/)

## 常用

```c#
wget https://github.com/ehang-io/nps/releases/download/v0.26.6/linux_amd64_server.tar.gz

// 新建目录并解压
mkdir nps
tar -xzvf linux_amd64_server.tar.gz -C nps
// 进入文件夹
cd nps
// 安装
sudo ./nps install
// 启动
sudo nps start

// 停止
nps stop

// 版本检查
nps -version
// 或
./nps -version

npc -version
// 或
./npc -version

```
