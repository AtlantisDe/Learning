# sources.list

- [【转】关于 Ubuntu 的 sources.list 的总结](https://www.cnblogs.com/joey-zhou/p/5269736.html)
- [使用sudo apt-get install出现404 not found问题的原因和解决](https://www.cnblogs.com/joey-zhou/p/5269736.html)

## apt-get update时错误

- [linux系统 ubuntu14 apt-get update时错误 0% [Connecting to security.ubuntu.com (2001:67c:1560:8001::14)]](https://blog.csdn.net/fengying2016/article/details/70145976)
- [Ubuntu虚拟机可以上网，可以ping网络，但是无法update和install，报连接不上服务器的错误解决方案](https://www.cnblogs.com/zhengshuangliang/p/6612019.html)

## 源服务器

```shell
ping archive.ubuntu.com
ping mirrors.aliyun.com
ping opsx.alibaba.com
apt-get -o Acquire::ForceIPv4=true update
```

## 这是由ubuntu系统ipv6引起，可以强制apt使用ipv4就可以解决。

```shell
apt-get -o Acquire::ForceIPv4=true update
```
