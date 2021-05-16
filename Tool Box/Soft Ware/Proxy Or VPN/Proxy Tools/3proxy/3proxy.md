# 3proxy

- [3proxy tiny free proxy server for Windows, Linux, Unix: SOCKS, HTTP, FTP proxy](https://3proxy.ru/)
- [3proxy :: download](https://3proxy.ru/download/)
- [z3APA3A/3proxy](https://github.com/z3APA3A/3proxy/)
- [Linux Documentation](https://linux.die.net/)
- [Soft:3proxy:FAQ](https://3proxy.ru/faqe.asp)
- [Soft:3proxy:HowTo](https://3proxy.ru/howtoe.asp)

## 3proxy windows

- [3proxy 使用方法 - 云+社区 - 腾讯云](https://cloud.tencent.com/developer/article/1567809)

```c#
// 1.tor本身是socks4a的代理，在设置文件中应该表示为socks4+,但由于192.168.0.1不支持域名解析，所以标为socks4,否则会代理链出错
//  2.代理链是这样的，由权重值（即1000）来分组，每组权重值相加必须为1000，一组即为一层
//  　使用手册中的例子：
//  　parent 1000 socks5 192.168.10.1 1080
//  　parent 1000 connect 192.168.20.1 3128
//  　parent 300 socks4 192.168.30.1 1080
//  　parent 700 socks5 192.168.40.1 1080
//  以上的代理链共分为三组，分别是第一层：192.168.10.1,第二层：192.168.20.1,第三层：30.1和40.1
//  当一个请求到达后，第一层和第二层是必须要经过的，在第三层中，有30%的机会通过30.1,70%的机会通过40.1
//  使用权重的时候注意保证每组权重和为1000

netsh advfirewall firewall add rule name="3proxy Server for Inbound TCP/1235" protocol=TCP dir=in localport=1235 action=allow
netsh advfirewall firewall delete rule name="3proxy Server for Inbound TCP/1235"

3proxy --install
net stop 3proxy
3proxy --remove

log /var/log/3proxy.log D
rotate 30
internal 127.0.0.1
external 192.168.1.1
proxy
socks -p3129
pop3p
```

## linux

```c#
// Git方式
git clone https://github.com/z3apa3a/3proxy
cd 3proxy
ln -s Makefile.Linux Makefile
make
sudo make install

use /etc/3proxy/add3proxyuser.sh script to add users.

// 下载源码方式
wget https://github.com/z3APA3A/3proxy/archive/0.8.13.tar.gz -O 3proxy.tar.gz

mkdir 3proxy
tar -xzvf 3proxy.tar.gz -C 3proxy

cd 3proxy
cd 3proxy-0.8.13
ln -s Makefile.Linux Makefile
make
sudo make install
```
