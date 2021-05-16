# AppNode

- [AppNode - Linux 服务器集群管理面板](https://www.appnode.com/)

```c#

```

## 0. Installation

- [302 Found](https://www.appnode.com/install)

```c#
INSTALL_AGENT=1 INSTALL_APPS=sitemgr INIT_SWAPFILE=1 INSTALL_PKGS='nginx-stable,php74,mysql56' bash -c "$(curl -sS http://dl.appnode.com/install.sh)"
```

### 1. IP 反向代理测试

```c#
// 第1步:创建运行环境

运行环境名称: 太平洋电脑网IP--运行环境

// 第2步:创建运反向代理网站

1. 创建运行环境--->反向代理--->nginx
2. 创建网站--->主域名:whois.pconline.com.cn
        勾选够多域名,输入IP地址: 127.0.0.1

    后端设置:
    后端协议:HTTP
    后端IP:不指定IP（根据后端域名解析出IP）
    后端域名:whois.pconline.com.cn
    后端端口:其它端口 (80)
    后端路径:/

    监听端口:6699 (随意)


3. 网站设置--->反代--->代理请求设置 (可配置是否转发IP)
```

### 2. 纯 IP 端口不同 反向代理测试

```c#
// 第1步:创建运行环境

运行环境名称: API--运行环境

// 第2步:创建运反向代理网站

1. 创建运行环境--->反向代理--->nginx
2. 创建网站--->主域名:abc.google.com
        勾选够多域名,输入IP地址: 127.0.0.1

    后端设置:
    后端协议:HTTP
    后端IP:单IP (127.0.0.2)
    后端域名:自定义域名(127.0.0.2)
    后端端口:其它端口 (8899)
    后端路径:/


    监听端口:6699 (随意)

3. 网站设置--->反代--->代理请求设置 (可配置是否转发IP)
```
