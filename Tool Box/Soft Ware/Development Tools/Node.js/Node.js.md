# Node.js

- [Download | Node.js](https://nodejs.org/en/download/)
- [Node.js 安装配置 | 各种系统安装教程](http://www.runoob.com/nodejs/nodejs-install-setup.html)

## 1. 常用命令

```shell
node --version
npm -v
# 提示安装完Node.js就会自动默认安装好npm了
node -v
npm -v
choco -v

```

## 2. Ubuntu 安装

```shell
Ubuntu apt-get命令安装
sudo apt-get install nodejs
sudo apt-get install npm
```

## 3. Windows 安装

1. Windows Installer (.msi)/Windows Binary (.zip) And Run Binary

   > [Download | Node.js](https://nodejs.org/en/download/)

```c#
// 当前版本:
Latest LTS Version: 14.16.1 (includes npm 6.14.12)


// Windows Installer (.msi)

https://nodejs.org/dist/v14.16.1/node-v14.16.1-x64.msi





```

## 4. 使用

- [Node.js Tutorial](https://www.w3schools.com/nodejs/)

```c#
// 开启服务
var http = require('http');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World!');
}).listen(8080);

// 访问
http://127.0.0.1:8080/
```

## 5. node 版本如何升级

- [node版本如何升级_赵天铭的博客-CSDN博客_node 升级](https://blog.csdn.net/guzhao593/article/details/81712016)

```c#

// Linux
// 1. 首先，你得用npm全局安装一个管理node版本的管理模板n，对就是n，不用怀疑，github地址 https://github.com/tj/n
npm i -g n

// 原来n模块是不支持window系统，window系统升级node就只有到node官网下载window安装包来覆盖之前的node

```
