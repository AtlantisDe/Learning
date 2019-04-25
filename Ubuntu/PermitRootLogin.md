# PermitRootLogin

- [Ubuntu使用root帐号,并让Xshell, Winscp以root身份登录 - EnskDeCode - CSDN博客](https://blog.csdn.net/tojohnonly/article/details/57184166)
- [快速掌握Nginx(二) —— Nginx的Location和Rewrite](https://www.cnblogs.com/wyy1234/p/10632108.html)

## 设置新root账户密码

```shell
  sudo passwd root    // 用sudo修改root帐户密码
  Password:    // 输入密码
  Enter new UNIX password:   // 输入新的root帐户密码
  Retype new UNIX password:   // 确认密码
```

### 先在要连接的Ubuntu主机下开启SSH服务 , 如果没有开启需要安装openssh-server

```shell
udo apt-get install openssh-server

# 使用ps -e | grep ssh , 如果只有ssh-agent表示还没启动 , 需要/etc/init.d/ssh start ;
# 有sshd说明已启动 , 还是不行直接reboot
```

## 使用Winscp以root身份登录

```shell
# 修改配置文件

vim /etc/ssh/sshd_config

# Authentication:
LoginGraceTime 120
PermitRootLogin without-password
StrictModes yes

# # 将 PermitRootLogin without-password 修改为 PermitRootLogin yes , 如下所示 :
## 改完reboot重启生效

# Authentication:
LoginGraceTime 120
PermitRootLogin yes
StrictModes yes
```