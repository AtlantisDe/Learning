# curl

## 安装

```shell
sudo apt-get update && apt-get -y upgrade
sudo apt-get install curl
```

## curl 查看版本

```shell
curl -V
```

````text
curl 7.61.0 (x86_64-pc-linux-gnu) libcurl/7.61.0 OpenSSL/1.1.1 zlib/1.2.11 libidn2/2.0.5 libpsl/0.20.2 (+libidn2/2.0.4) nghttp2/1.32.1 librtmp/2.3
Release-Date: 2018-07-11
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtmp rtsp smb smbs smtp smtps telnet tftp
Features: AsynchDNS IDN IPv6 Largefile GSS-API Kerberos SPNEGO NTLM NTLM_WB SSL libz TLS-SRP HTTP2 UnixSockets HTTPS-proxy PSL```
````
