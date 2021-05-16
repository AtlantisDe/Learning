# OpenSSH Server

- [Ubuntu Linux 下 openssh-server 配置及基本使用方法（root 下）](https://blog.csdn.net/qq_42773814/article/details/81213620)

## openssh-server

```shell

netstat -ntlp|grep 22


# 安装和启动
apt install openssh-server #安装openssh-server
service ssh start #启动openssh-server
ps -e |grep sshd #查看ssh服务是否启动  -e查看全部进程
service ssh status #查看ssh运行状态

# 设置开机启动，进入/etc/rc.local编辑配置
vi /etc/rc.local
# 在最后插入两行

service ssh start
exit 0

# 保存退出
# 这样即可在Ubuntu开机时自动启动ssh-server服务

# 允许root登陆

# 这里可以先装宝塔从宝塔面板上去搜索文件修改更快捷
# 进入/etc/ssh/sshd_config查找PermitRootLogin选项（可以利用:/PermitRootLogin的方法进行查找）

# 将这个选项后面的值（一般为prohibit-password）修改为yes

# 修改完成后保存退出，需要重启ssh服务：

service ssh restart


```
