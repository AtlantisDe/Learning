# samba

- [Samba - opening windows to a wider world](https://www.samba.org/)
- [Samba (简体中文) - ArchWiki](<https://wiki.archlinux.org/index.php/Samba_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>)
- [Ubuntu 中创建共享文件夹并支持 Windows 访问和修改](https://t.cj.sina.com.cn/articles/view/6426825676/17f1193cc0010042hv?cre=tianyi&mod=pcpager_fintoutiao&loc=36&r=9&doct=0&rfunc=100&tj=none&tr=9)
- [增加 samba 用户提示 Failed to add entry for user - minenamewj 的专栏 - CSDN 博客](https://blog.csdn.net/minenamewj/article/details/17356703)

## samba 安装

```shell
sudo apt-get install samba-common samba
```

## samba 修改配置文件

```shell
sudo gedit /etc/samba/smb.conf
```

## 添加共享文件夹 (smb.conf 文件末尾) 保存后重新启动 samba，sudo /etc/init.d/samba restart

```shell
[ShareFiles]
comment = Shared Folder require password
path = /home/magic/share
public = yes
writable = yes
valid users = magic
create mask = 0777
directory mask = 0777
force user = nobody
force group = nogroup
available = yes
browseable = yes
```

## samba 设置用户和密码

```shell
sudo smbpasswd -a magic

# # 最后windows下网上邻居->右键->映射网络驱动器
# # 输入 文件夹框 \\ip地址\ShareFiles,按提示输入用户名密码即可。
\\192.168.1.6\ShareFiles
```

## 首先在 Ubuntu 安装好 samba 具体步骤为：(该方案未测试)

```shell
# # 1、首先在Ubuntu安装好samba，具体步骤为：
# # 安装samba：
sudo apt-get install samba
# # 安装smbclient：
sudo apt-get install
# # 安装smbfs：
sudo apt-get smbfs
```

## samba 命令

```shell
samba -?
samba -V
```

## Samba 服务器的启动、关闭和重启

```shell
# # 启动Samba服务器只需执行如下命令：
sudo /etc/init.d/samba start

# # 关闭Samba服务器：
sudo /etc/init.d/samba stop

# # 重新启动Samba服务器：
sudo /etc/init.d/samba restart
```
