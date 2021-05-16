# Docker

- [Ubuntu Docker 安装](http://www.runoob.com/docker/ubuntu-docker-install.html)
- [Docker 新手入门之二：Docker 的安装](https://baijiahao.baidu.com/s?id=1592846051245987256&wfr=spider&for=pc)
- [Docker 第一篇 认识 Docker 的作用好处](https://www.cnblogs.com/szlblog/p/8963903.html)
- [据说 90%的人看完这篇文章不用百度什么是 Docker 了](https://www.sohu.com/a/133009553_629429)
- [想理解、会用 Docker，这篇文章就够了！](http://baijiahao.baidu.com/s?id=1586633082072582334&wfr=spider&for=pc)

## 安装

```shell
# Docker 要求 Ubuntu 系统的内核版本高于 3.10 ，查看本页面的前提条件来验证你的 Ubuntu 版本是否支持 Docker。
# 通过 uname -r 命令查看你当前的内核版本
uname -r
```

## 使用脚本安装 Docker

```shell
# 1、获取最新版本的 Docker 安装包
wget -qO- https://get.docker.com/ | sh
```
