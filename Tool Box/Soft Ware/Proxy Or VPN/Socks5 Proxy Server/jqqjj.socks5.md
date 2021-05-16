# jqqjj/socks5

- [socks5 proxy server builds with go/golang](https://github.com/jqqjj/socks5)

## 常用

```c#
// 评价:测试请用火狐浏览器代理

windows_x86_64.exe -p 1080
windows_x86_64.exe -p 7280

windows_x86_64.exe -p 1080 -user TestUser -pwd Password123
windows_x86_64.exe -p 7280 -user TestUser -pwd Password123

- chrome://extensions/
- 谷歌浏览器:代理插件先在中国镜像站下载个插件使用即可.

"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --proxy-server="SOCKS5://8.8.8.8:7280" --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost" http://whois.pconline.com.cn/

curl --socks5 8.8.8.8:7280 -U TestUser:Password123 http://aiezu.com/test.php


netsh advfirewall firewall add rule name="Socks5 Jqqjj Server for Inbound TCP/7280" protocol=TCP dir=in localport=7280 action=allow

```

## Install

- [windows_x86_64.zip](https://github.com/jqqjj/socks5/releases/tag/1.0)

```shell
go get github.com/jqqjj/socks5
```

## Usage

- -p
  - port on listen (default 1080)
- -user (option)
  - username
- -pwd (option)
  - password
