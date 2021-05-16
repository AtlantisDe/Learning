# Certbot

- [Get Certbot &mdash; Certbot 1.10.0.dev0 documentation](https://certbot.eff.org/docs/install.html)

## 0. 介绍

```c#
// Certbot是EFF加密整个Internet的工作的一部分。Web上的安全通信依赖于HTTPS，HTTPS需要使用数字证书，该数字证书允许浏览器验证Web服务器的身份（例如，这真的是google.com吗？）。Web服务器从称为证书颁发机构（CA）的受信任第三方获取证书。Certbot是一个易于使用的客户端，可从Let's Encrypt（由EFF，Mozilla和其他公司发起的开放式证书颁发机构）中获取证书，并将其部署到Web服务器。

// 任何在设置安全网站上遇到麻烦的人都知道获得和维护证书的麻烦。Certbot和Let's Encrypt可以自动消除麻烦，并让您使用简单的命令打开和管理HTTPS。免费使用Certbot和Let's Encrypt，因此无需安排付款。

// 使用Certbot的方式取决于Web服务器的配置。最好的入门方法是使用我们的互动指南。它会根据您的配置设置生成说明。在大多数情况下，您需要具有Web服务器的root或管理员访问权限才能运行Certbot。

// Certbot旨在直接在您的Web服务器上运行，而不是在您的个人计算机上运行。如果您使用的是托管服务，但没有直接访问Web服务器的权限，则可能无法使用Certbot。请与您的托管服务提供商联系，以获取有关上载证书或使用Let's Encrypt颁发的证书的文档。

// Certbot是Let's Encrypt CA（或使用ACME 协议的任何其他CA ）的功能齐全的可扩展客户端，可以自动执行获取证书和配置Web服务器以使用证书的任务。该客户端在基于Unix的操作系统上运行。

// 要查看不同版本之间对Certbot所做的更改，请参阅我们的 更改日志。

// 在2016年5月之前，根据安装方法的不同，Certbot的名称简称为letsencrypt或letsencrypt-auto。Internet上的说明以及某些软件仍可能使用该旧名称。
```

## 1. 安装 Certbot

```shell
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y python-certbot-nginx
sudo certbot --nginx
# Certbot 会询问有关该网站的信息。
# 在执行 sudo apt-get install -y python-certbot-nginx 的时候会询问位置信息，我们选择 亚洲（也就是 6. Asia），时区选择 69. Shanghai 即可。
# 在执行 sudo certbot --nginx 的时候会询问你的邮箱，填写和你注册域名时相同的邮箱，其他询问同意即可。
```
