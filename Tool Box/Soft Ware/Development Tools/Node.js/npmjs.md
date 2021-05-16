# NPM

- npm 全拼为 Node Package Manager，是 JavaScript 软件包管理器。
- [npm | build amazing things](https://www.npmjs.com/)
- [Node.js 安装配置 | 菜鸟教程](https://www.runoob.com/nodejs/nodejs-install-setup.html)

## 1. Window 系统 命令升级

```shell
npm install npm -g
# 使用淘宝镜像的命令
cnpm install npm -g
```

## 2. Ubuntu apt-get 命令安装

```c#
sudo apt update
sudo apt-get install nodejs
sudo apt-get install npm
node -v
npm -v
```

## 3. 设置 npm 的淘宝镜像仓库 [国内用户可以选择使用]

- 设置 npm 的淘宝镜像仓库：由于 npm 的国外仓储会很慢，所以最好把 npm 仓库地址指定国内镜像，推荐淘宝镜像

```shell
npm config set registry https://registry.npm.taobao.org
```
