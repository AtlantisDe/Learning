# http-server

```c#
http-server is a simple, zero-configuration command-line http server. It is powerful enough for production usage, but it's simple and hackable enough to be used for testing, local development, and learning.
```

## 常用

```c#
sudo apt update
sudo apt-get install nodejs
sudo apt-get install npm
node -v
npm -v

npm install --global http-server

http-server [path] [options]
// [path] defaults to ./public if the folder exists, and ./ otherwise.
// Now you can visit http://localhost:8080 to view your server
// Note: Caching is on by default. Add -c-1 as an option to disable caching.

// 关闭 http-server服务
按快捷键CTRL-C
// 终端显示^Chttp-server stopped.即关闭服务成功。

// 同步更新页面并且设置了ip和端口号
http-server -a 127.0.0.1 -p 8080 -c-1
http-server -p 8080 -c-1

```

## TLS/SSL

```c#
http-server -S -C cert.pem

Starting up http-server, serving ./ through https
Available on:
  https:127.0.0.1:8080
  https:192.168.1.101:8080
  https:192.168.1.104:8080
Hit CTRL-C to stop the server
```
