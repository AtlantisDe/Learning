# GitLab

- [清华大学开源软件镜像站 Gitlab Community Edition 镜像使用帮助](https://mirror.tuna.tsinghua.edu.cn/help/gitlab-ce/)
- [官方安装教程](https://about.gitlab.com/install/#ubuntu)
- [阿里云 GitLab 的安装及使用](https://blog.csdn.net/anaitudou/article/details/80388161)
- [在 Ubuntu18.04 安装 gitlab 国内镜像加速](http://ccimage.cn/2018-05/ubuntu18-04-install-gitlab-chinese-mirror.html#comment-115)
- [ubuntu18.04 下安装 gitlab](https://blog.csdn.net/u012838045/article/details/80881243)

```shell
官方文档里的ee改成ce。收费版和免费版的区别。gitlab-ee属于企业版

sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix

# 首先信任 GitLab 的 GPG 公钥:
curl https://packages.gitlab.com/gpg.key 2> /dev/null | sudo apt-key add - &>/dev/null

# 添加GitLab软件包存储库(下载安装脚本)
# curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

# 修改安装脚本
# vim /etc/apt/sources.list.d/gitlab_gitlab-ee.list
vim /etc/apt/sources.list.d/gitlab_gitlab-ce.list

# 把原来的两行删除或者注释（#是行注释），然后增加
# ee版本镜像
deb https://XX bionic main
deb-src https://mirrors.XX bionic main
# ce版本镜像
# deb https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu bionic main
# deb-src https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu bionic main

deb https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu trusty main
deb-src https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu trusty main

# 再次执行
sudo apt-get update

# 执行安装脚本
# sudo EXTERNAL_URL="http://aaa.com" apt-get install gitlab-ee
sudo EXTERNAL_URL="http://aaa.com" apt-get install gitlab-ce

# 常用命令:
cat /opt/gitlab/embedded/service/gitlab-rails/VERSION
```

## Gitlab 默认端口修改

```shell
修改 /etc/gitlab/gitlab.rb 文件如下，然后执行重新配置，重启命令后完成

nginx['listen_port'] = 9091
unicorn['port'] = 9092

gitlab-ctl reconfigure  //让配置生效，重新执行此命令时间也比较长
gitlab-ctl restart

reboot

Gitlab 服务器url修改后，项目path的修改

cd /opt/gitlab/embedded/service/gitlab-rails/config
修改 gitlab.yml
host: www.aaa.com
    port: 9091
    https: true

gitlab启用https ;修改配置文件  生成秘钥与证书 参考上面文章链接
./ssl_genKey.sh
openssl req -nodes -newkey rsa:2048 -keyout gitlab.domain.com.key -out gitlab.domain.com.csr


```