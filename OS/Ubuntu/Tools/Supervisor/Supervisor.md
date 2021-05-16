# Supervisor

- [Supervisor: A Process Control System &mdash; Supervisor 4.0.4 documentation](http://supervisord.org/)
- [Supervisor 的使用 - 胡伟煌的博客 - CSDN 博客](https://blog.csdn.net/huwh_/article/details/80497790)
- [Supervisor 安装与配置（Linux/Unix 进程管理工具） - 技术改变生活 - CSDN 博客](https://blog.csdn.net/xyang81/article/details/51555473)
- [ubuntu 中 supervisor 的安装及配置](https://www.jianshu.com/p/68605ac9d06a)

## 1 Installing

- [Installing &mdash; Supervisor 4.0.4 documentation](http://supervisord.org/installing.html)
- [ubuntu 中切换 python 版本](https://www.jianshu.com/p/2a8791fcd0bc)

```c#
apt install supervisor

// ubuntu安装：
sudo apt-get install supervisor
// centos安装：
yum install -y supervisor
// 基于python库安装
pip2 install supervisor
easy_install supervisor
```

## 2. Creating a Configuration File

- [Installing &mdash; Supervisor 4.1.0 documentation](http://supervisord.org/installing.html#creating-a-configuration-file)

```c#
/etc/supervisord.conf
```

## 3. 常用

```c#
/usr/local/bin/supervisord -h
supervisord -v
// #查看supervisorctl状态
supervisorctl status

supervisorctl start nginx #启动子进程nginx
supervisorctl stop nginx  #关闭子进程nginx
supervisorctl restart nginx #重启子进程nginx

```
