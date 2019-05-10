# Rocket.Chat

- 火箭聊天
- [Rocket.Chat - Free, Open Source, Enterprise Team Chat](https://rocket.chat/)
- [一个强大的多功能团队聊天室：Rocket.Chat 安装教程 - Rat's Blog](https://www.moerats.com/archives/530/)
- [快速搭建流行的开源聊天系统](https://www.youtube.com/watch?v=iaAot5K2sps)

## 安装

- Ubuntu
- [Rocket.Chat in Ubuntu](https://rocket.chat/docs/installation/manual-installation/ubuntu/)

## Blog

- [部署企业内部聊天工具 Rocket.Chat 开源 IM 系统 - 云+社区 - 腾讯云](https://cloud.tencent.com/developer/article/1333782)
- [在 Ubuntu 上安装 Rocket.Chat](https://blog.biezhi.me/2018/11/installing-rocketchat-with-ubuntu.html)

## Engine versions

> Node: 8.11.4
> NPM: 6.4.1
> MongoDB: 3.2, 3.4, 3.6, 4.0

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
> <http://IP:3000>
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
