# GitLab

- [清华大学开源软件镜像站 Gitlab Community Edition 镜像使用帮助](https://mirror.tuna.tsinghua.edu.cn/help/gitlab-ce/)
- [官方安装教程](https://about.gitlab.com/install/#ubuntu)
- [阿里云 GitLab 的安装及使用](https://blog.csdn.net/anaitudou/article/details/80388161)
- [在 Ubuntu18.04 安装 gitlab 国内镜像加速](http://ccimage.cn/2018-05/ubuntu18-04-install-gitlab-chinese-mirror.html#comment-115)
- [ubuntu18.04 下安装 gitlab](https://blog.csdn.net/u012838045/article/details/80881243)

## wiki

- [GitLab - 维基百科](https://zh.wikipedia.org/wiki/GitLab)

## 社区版

- [Gitlab 社区版的源代码](https://gitlab.com/gitlab-org/gitlab-ce/)

## Gitlab

### 1. Ubuntu-安装

- 官方文档里的 ee 改成 ce。收费版和免费版的区别。gitlab-ee 属于企业版
- 产品被拆分为：GitLab CE（社区版）和 GitLab EE（企业版），当时，GitLab CE 和 GitLab EE 的许可仍然是根据 MIT 许可分发的免费和开源软件。

1. 安装依赖包，运行命令

```shell
   > sudo apt-get update
   > sudo apt-get install -y curl openssh-server ca-certificates
   > sudo apt-get install -y postfix
```

> 执行完成后，出现邮件配置，选择 Internet 那一项（不带 Smarthost 的）

1. 2.首先信任 GitLab 的 GPG 公钥

```shell
# 首先信任 GitLab 的 GPG 公钥:
curl https://packages.gitlab.com/gpg.key 2> /dev/null | sudo apt-key add - &>/dev/null

# 添加GitLab软件包存储库(下载安装脚本)
# curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash

## 社区版
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

## 企业版
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash

# 修改安装脚本
# vim /etc/apt/sources.list.d/gitlab_gitlab-ee.list
vim /etc/apt/sources.list.d/gitlab_gitlab-ce.list

# 把原来的两行删除或者注释（#是行注释），然后增加

# CE社区版 镜像
# 0. [似乎已失效请官方拿这个地址] 清华大学的镜像
deb https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu bionic main
deb-src https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu bionic main

# 1. 官方社区版安装脚本
deb https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ cosmic main
deb-src https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ cosmic main

# ee版本镜像 企业版::
deb https://XX bionic main
deb-src https://mirrors.XX bionic main


# 清华大学的镜像文件 ce 社区版
deb https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu trusty main
deb-src https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu trusty main

# 再次执行
sudo apt-get update

# 执行安装脚本
# CE社区版
sudo EXTERNAL_URL="https://gitlab.example.com" apt-get install gitlab-ce
# EE社区版
sudo EXTERNAL_URL="https://gitlab.example.com" apt-get install gitlab-ee

sudo EXTERNAL_URL="http://aaa.com" apt-get install gitlab-ce
sudo EXTERNAL_URL="http://demo.com" apt-get install gitlab-ce

# 安装完毕访问
https://gitlab.example.com

# 初始密码
# 默认超级管理员账户:root


# 修改端口和密码

```

### 2. 查看版本

```shell
cat /opt/gitlab/embedded/service/gitlab-rails/VERSION
```

```text
11.10.4
```

### 3. Gitlab 默认端口修改

```shell
# 修改 /etc/gitlab/gitlab.rb 文件如下，然后执行重新配置，重启命令后完成
/etc/gitlab/gitlab.rb

# 修改参数
# - 访问地址端口只需要修改这句
nginx['listen_port'] = 9091

# 下面忘记是啥暂时不要改
unicorn['port'] = 9092

# 让配置生效，重新执行此命令时间也比较长
gitlab-ctl reconfigure
gitlab-ctl restart

# 重启动机器暂时不用
reboot

# Gitlab 服务器url修改后，项目path的修改

cd /opt/gitlab/embedded/service/gitlab-rails/config
修改 gitlab.yml
host: www.aaa.com
    port: 9091
    https: true

gitlab启用https ;修改配置文件  生成秘钥与证书 参考上面文章链接
./ssl_genKey.sh
openssl req -nodes -newkey rsa:2048 -keyout gitlab.domain.com.key -out gitlab.domain.com.csr
```
