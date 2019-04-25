# newsite

## 测试 Demo 网站配置信息

```shell
192.168.1.6 www.nginx.com
```

```shell
www.nginx.com/phpinfo.php
```

```shell
/var/www/sites/www.phpmyadmin.com
```

## 默认站点配置文件

```shell
/etc/nginx/sites-available
```

### www.phpmyadmin.com.conf

```shell
# # listen —— 网站监听端口，这里设置为80，即浏览器默认的HTTP端口号。
# # root —— 网站根目录。
# # index —— 默认访问页。
# # server_name —— 网站访问域名，若是其他域名访问时，则不会响应，这里设置为localhost用于本地调试。
# # location / —— 该区块有一个try_files命令，当客户端请求找不到对应文件时，将会返回404页面。
# # location ~\.php$ —— 该区块匹配.php后缀的文件并传给php-fpm进行处理。
# # location ~ /\.ht —— 该区块禁止.htaccess的访问。
```

```shell
server {
        listen 80;
        root /var/www/sites/www.phpmyadmin.com;
        index index.php index.html index.htm index.nginx-debian.html;
        server_name www.phpmyadmin.com;

        location / {
                try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        }

        location ~ /\.ht {
                deny all;
        }
}
```

## 保存以上配置后，通过创建软连接的方式，使配置文件能够被Nginx加载

```shell
## 注意配置文件名
sudo ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/www.phpmyadmin.com.conf /etc/nginx/sites-enabled/
```

## 然后测试配置文件是否正常

```shell
sudo nginx -t
```

## 站点文件存放目录

```shell
root /var/www/html;
```

## 重启nginx

```shell
/etc/init.d/nginx restart
sudo /etc/init.d/nginx restart
systemctl restart nginx.service
sudo systemctl enable nginx
```
