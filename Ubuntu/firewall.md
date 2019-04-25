# 防火墙

```shell
开启防火墙  ufw enable
关闭防火墙  ufw disable
防火墙开启(ubuntu下执行)    sudo ufw enable
防火墙重启(ubuntu下执行)    sudo ufw reload
查看本地的端口开启情况(ubuntu下执行)    sudo ufw status

打开80端口(ubuntu下执行)
sudo ufw allow https
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 22
sudo ufw allow 21
sudo ufw allow 'Nginx Full'
sudo ufw allow 137
sudo ufw allow 139
sudo ufw allow 445
```