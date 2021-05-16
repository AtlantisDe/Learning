# Rocket.Chat

- 火箭聊天
- [Rocket.Chat - Free, Open Source, Enterprise Team Chat](https://rocket.chat/)
- [一个强大的多功能团队聊天室：Rocket.Chat 安装教程 - Rat's Blog](https://www.moerats.com/archives/530/)
- [快速搭建流行的开源聊天系统](https://www.youtube.com/watch?v=iaAot5K2sps)
- [Rocket.Chat Documentation - Guides for developing and modifying Rocket.Chat’s code](https://rocket.chat/docs/)

## 安装

- Ubuntu
- [Rocket.Chat in Ubuntu](https://rocket.chat/docs/installation/manual-installation/ubuntu/)
- [rocket.chat 安装部署 -centos6.5](https://blog.csdn.net/wyl9527/article/details/79397074)

## Blog

- [部署企业内部聊天工具 Rocket.Chat 开源 IM 系统 - 云+社区 - 腾讯云](https://cloud.tencent.com/developer/article/1333782)
- [在 Ubuntu 上安装 Rocket.Chat](https://blog.biezhi.me/2018/11/installing-rocketchat-with-ubuntu.html)

## Engine versions

> Node: 8.11.4
> NPM: 6.4.1
> MongoDB: 3.2, 3.4, 3.6, 4.0
> Ubuntu 安装
> apt install nodejs
> apt install npm

## OS

1. WEB

   > [RocketChat/Rocket.Chat](https://github.com/RocketChat/Rocket.Chat)

2. Rocket.Chat.iOS

   > [RocketChat/Rocket.Chat.iOS](https://github.com/RocketChat/Rocket.Chat.iOS)

3. Rocket.Chat.iOS

   > [RocketChat/Rocket.Chat.Android](https://github.com/RocketChat/Rocket.Chat.Android)

## Ubuntu 16.04 安装

> apt-get update -y
> snap install rocketchat-server
> <http://IP:3000><http://localhost:3000>
> sudo snap refresh rocketchat-server

## WEB

> Node: 8.11.4
> NPM: 6.4.1
> MongoDB: 3.2, 3.4, 3.6, 4.0

## RocketChat/Rocket.Chat.Android

1. Make sure that you have the latest Gradle and the Android plugin versions installed.

   > gradle -v

2. Kotlin is already configured in the project.To check

   > To check, go to Tools > Kotlin > Configure Kotlin in project. A message saying kotlin is already configured in the project pops up. You can update kotlin to the latest version by going to Tools > Kotlin > Configure Kotlin updates and download the latest version of kotlin.

3. SDK Instructions

   - cd Rocket.Chat.Android/app
     > ./build-sdk.sh

4. SDK Instructions

   ```shell
   ./gradlew assembleDebug
   ```

## Snaps

- [Rocket.Chat Documentation - Snaps](https://rocket.chat/docs/installation/manual-installation/ubuntu/snaps/)

## How do I manually update to a new release

```shell
sudo snap refresh rocketchat-server
```

## How do I revert to the previous version of Rocket.Chat

```shell
sudo snap revert rocketchat-server
```

## How do I tell if Rocket.Chat is actually running

- You can check on the status of Rocket.Chat with:

```shell
sudo service snap.rocketchat-server.rocketchat-server status
```

- You can also check on the status of Mongo and Caddy:

```shell
sudo service snap.rocketchat-server.rocketchat-mongo status
sudo service snap.rocketchat-server.rocketchat-caddy status
```

## How can I view the logs

- To see the logs from Rocket.Chat:

```shell
sudo journalctl -f -u snap.rocketchat-server.rocketchat-server
```

- To see the logs from Mongo or Caddy:

```shell
sudo journalctl -f -u snap.rocketchat-server.rocketchat-mongo
sudo journalctl -f -u snap.rocketchat-server.rocketchat-caddy
```

## I need to restart Rocket.Chat, how do I do this

- To restart Rocket.Chat:

```shell
sudo service snap.rocketchat-server.rocketchat-server restart
```

- Mongo and Caddy can similarly be restarted:

```shell
sudo service snap.rocketchat-server.rocketchat-mongo restart
sudo service snap.rocketchat-server.rocketchat-caddy restart
```

## What is the restart policy

- The snap’s policy is to restart on failure.

## Auto SSL with Snaps

- [Rocket.Chat Documentation - Auto SSL with Snaps](https://rocket.chat/docs/installation/manual-installation/ubuntu/snaps/autossl/)

## Failed to start Service for snap application rocketchat-server.rocketchat-caddy

- rm -rf /root/snap/rocketchat-server/current/.caddy

## 查看端口占用

netstat -ap | grep 3000

```shell
## Steps to Reproduce
```

```shell
sudo snap run rocketchat-server.initcaddy
# Caddy is not enabled, please set caddy-url=<your_url> and caddy=enable

Configure Caddyfile
sudo systemctl restart snap.rocketchat-server.rocketchat-caddy
sudo systemctl status snap.rocketchat-server.rocketchat-caddy shows error
```

## Building Rocket.Chat for mobile apps

- [Rocket.Chat Documentation  - Building Rocket.Chat for mobile apps](https://rocket.chat/docs/developer-guides/mobile-apps/)
