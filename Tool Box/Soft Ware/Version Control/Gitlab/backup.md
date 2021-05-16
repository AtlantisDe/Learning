# backup

- [Gitlab 进行备份恢复与迁移](https://www.jianshu.com/p/51f9bacac155)

## 1. Gitlab 创建备份

### 1. 创建备份文件

```c#
gitlab-rake gitlab:backup:create
// 使用以上命令会在/var/opt/gitlab/backups目录下
/var/opt/gitlab/backups
```

#### 1. 更改 Gitlab 备份目录

```c#
// 当然你也可以通过/etc/gitlab/gitlab.rb配置文件来修改默认存放备份文件的目录
gitlab_rails['backup_path'] = "/var/opt/gitlab/backups"

// /var/opt/gitlab/backups修改为你想存放备份的目录即可，例如下面代码将备份路径修改为/mnt/backups
gitlab_rails['backup_path'] = '/mnt/backups'

```

### 2. Gitlab 自动备份

```c#

```

#### 1. 定时自动备份

```c#


```

### 3. Gitlab 备份数据恢复

```c#

```

#### 1. 数据恢复

```c#


```

### 4. Gitlab 卸载

```c#

```

#### 1. 卸载

```shell
# 前提：必须在Gitlab运行状态下才能卸载
# Stop gitlab and remove its supervision process
sudo gitlab-ctl uninstall
# Debian/Ubuntu
sudo dpkg -r gitlab-ce
# Redhat/Centos
sudo rpm -e gitlab-ce

```
