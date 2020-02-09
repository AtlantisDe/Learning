# Pure-FTPd

- [Pure-FTPd :: Pure-FTPd](https://www.pureftpd.org/project/pure-ftpd/)

```text
Pure-FTPd is a free (BSD), secure, production-quality and standard-conformant FTP server. It doesn’t provide useless bells and whistles, but focuses on efficiency and ease of use. It provides simple answers to common needs, plus unique useful features for personal users as well as hosting providers.
```

## Wiki

- [FTP 服务搭建（ftpd、pure-ftpd、vsftpd）](https://blog.csdn.net/frank_abagnale/article/details/79378609)
- [Too many connections (5) from this IP 怎么解决 - Powered by Discuz!](https://bbs.vpser.net/thread-13263-1-1.html)

## 重启

```shell
sudo /etc/init.d/pure-ftpd restart
```

## FAQ

### 1.Too many connections (5) from this IP 怎么解决

```c#
/usr/local/pureftpd/pure-ftpd.conf
// 修改MaxClientsPerIP 重启pureftpd

```
