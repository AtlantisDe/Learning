# Certbot

## 安装 Certbot

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
