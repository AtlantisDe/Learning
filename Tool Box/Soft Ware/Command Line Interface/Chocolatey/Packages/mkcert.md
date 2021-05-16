# mkcert

- [FiloSottile/mkcert](https://github.com/FiloSottile/mkcert)
- [本地 https 快速解决方案——mkcert](https://www.jianshu.com/p/7cb5c2cffaaa)
- [Gooogle 发布生成 https 加密证书工具 mkcert\_开发](https://www.sohu.com/a/288518162_355122)

## 0. install

```c#
Windows
// On Windows, use Chocolatey
choco install mkcert

// or use Scoop

scoop bucket add extras
scoop install mkcert
// or build from source (requires Go 1.10+), opr use the pre-built binaries.

// If you're running into permission problems try running mkcert as an Administrator.

```

## 0. 常用

```c#
cd /d D:\Tmp\mkcert

D:\Tmp\mkcert

changeit

// 命令可以列出CA证书的存放路径 将 rootCA.pem 拷贝一个副本，并命名为 rootCA.crt
mkcert -CAROOT
mkcert -client

mkcert -client 192.168.3.158
mkcert -pkcs12 -client 192.168.3.158

mkcert example.com localhost 127.0.0.1 ::1
mkcert example.com "*.example.com" example.test localhost 127.0.0.1 ::1

where mkcert
C:\ProgramData\chocolatey\bin\mkcert.exe

// 生成自签名的CA文件（根证书）
mkcert -install

// 生成新的证书，可指定多域名，支持一级通配符
mkcert example.com "*.example.org" myapp.dev localhost 127.0.0.1 ::1

// mkcert is a simple tool for making locally-trusted development certificates. It requires no configuration.

$ mkcert -install
Created a new local CA 💥
The local CA is now installed in the system trust store! ⚡️
The local CA is now installed in the Firefox trust store (requires browser restart)! 🦊

$ mkcert example.com "*.example.com" example.test localhost 127.0.0.1 ::1

Created a new certificate valid for the following names 📜
 - "example.com"
 - "*.example.com"
 - "example.test"
 - "localhost"
 - "127.0.0.1"
 - "::1"

The certificate is at "./example.com+5.pem" and the key at "./example.com+5-key.pem" ✅

Usage of mkcert:

        $ mkcert -install
        Install the local CA in the system trust store.

        $ mkcert example.org
        Generate "example.org.pem" and "example.org-key.pem".

        $ mkcert example.com myapp.dev localhost 127.0.0.1 ::1
        Generate "example.com+4.pem" and "example.com+4-key.pem".

        $ mkcert "*.example.it"
        Generate "_wildcard.example.it.pem" and "_wildcard.example.it-key.pem".

        $ mkcert -uninstall
        Uninstall the local CA (but do not delete it).

For more options, run "mkcert -help".

Advanced options
        -cert-file FILE, -key-file FILE, -p12-file FILE
            Customize the output paths.

        -client
            Generate a certificate for client authentication.

        -ecdsa
            Generate a certificate with an ECDSA key.

        -pkcs12
            Generate a ".p12" PKCS #12 file, also know as a ".pfx" file,
            containing certificate and key for legacy applications.

        -csr CSR
            Generate a certificate based on the supplied CSR. Conflicts with
            all other flags and arguments except -install and -cert-file.
```

## 1. 操作

- [mkcert 制作信任的本地 SSL 证书\_肖坤超-CSDN 博客](https://blog.csdn.net/kentrl/article/details/109159451)

```c#
mkcert -install

mkcert example.com "*.example.com" example.test localhost 127.0.0.1 ::1

// 生成证书

mkcert 127.0.0.1 localhost //后面还可以继续空格添加其他域名或IP地址，默认是pem格式
mkcert -pkcs12 192.168.10.123 //生成p12格式的正式iis可以用，默认密码为：“changeit”
mkcert -client 192.168.10.123 //客户端证书，默认是pem格式
mkcert -pkcs12 -client 192.168.10.123 //生成p12格式客户端证书，win用户可以直接导入，默认密码为：“changeit”


mkcert -pkcs12 127.0.0.1
mkcert -pkcs12 -client 127.0.0.1

```

## 2. IIS

- [Setting up local https with IIS in 10 minutes](https://himynameistim.com/2019/06/05/setting-up-local-https-with-iis-in-10-minutes/)
- [本地 https 快速解决方案——mkcert](https://springboot.io/t/topic/1408)
- [Using mkcert for ASP.NET Core Development](https://www.scottbrady91.com/ASPNET/Using-mkcert-for-ASPNET-Core-Development)

```c#
changeit

mkcert -pkcs12 localhost

mkcert -pkcs12 127.0.0.1




// CREATE A LOCAL CERT STEP BY STEP
// 1. If you haven’t already. Install chocolatey ( https://chocolatey.org/install ). Chocolatey is a package manager for windows which makes it super simple to install applications. The name is inspired from NuGet. i.e. Chocolatey Nuget

// 2. Install mkcert, to do this from a admin command window run
choco install mkcert

// 3. Create a local certificate authority (ca)
mkcert -install

// 4. Create a certificate
mkcert -pkcs12 example.com

// Remember to change example.com to the domain you would like to create a certificate for.

// 5. Rename the .p12 file that was created to .pfx (this is what IIS requires). The certificate will now be created in the folder you have the command window open at.

// You can now import the certificate into IIS as normal. When asked for a password this have been set to changeit
changeit
```

### 1. IIS DEMO

- [服务器名字指示 SNI(Server Name Indication)](https://zhidao.baidu.com/question/1499539580114749859.html)
- [服务器名字指示 SNI(Server Name Indication) | 李小波](https://www.xiaobo.li/?p=502)

```c#

勾选:需要服务器名称指示

// 可以看到CA路径下有两个文件 rootCA-key.pem 和 rootCA.pem 两个文件，用户需要信任 rootCA.pem 这个文件。将 rootCA.pem 拷贝一个副本，并命名为 rootCA.crt (因为windows并不识别 pem 扩展名，并且Ubuntu也不会将 pem 扩展名作为CA证书文件对待)，将 rootCA.crt 文件分发给其他用户，手工导入。
// windows导入证书的方法是双击这个文件，在证书导入向导中将证书导入 受信任的根证书颁发机构 :

changeit

mkcert -pkcs12 "*.demo.com" localhost 127.0.0.1 ::1
mkcert -pkcs12 "*.demo.com" localhost 127.0.0.1 ::1


mkcert -pkcs12 127.0.0.1
mkcert -pkcs12 -client 127.0.0.1

mkcert -client 192.168.3.158
mkcert -pkcs12 -client 192.168.3.158




mkcert -pkcs12 www.google.com
mkcert -pkcs12 -client www.google.com



mkcert -pkcs12 cdn.tupian.com
```

### 2. 配置中间证书

- [在 IIS 中配置中间证书 - Internet Information Services](https://docs.microsoft.com/zh-cn/troubleshoot/iis/configure-intermediate-certificates)

```c#
打开 "证书" "Microsoft 管理控制台" （MMC）管理单元。 若要执行此操作，请执行以下步骤：
在命令提示符处，键入Mmc.exe。
如果没有以内置管理员身份运行该程序，则系统将提示您提供运行该程序的权限。 在 " Windows 安全性" 对话框中，单击 "允许"。
在 "文件" 菜单上，选择 "添加/删除管理单元"。
在 "添加或删除管理单元" 对话框中，在 "可用的管理单元" 列表中选择 "证书" 管理单元，选择 "添加"，然后选择 "确定"。
在 "证书管理单元" 对话框中，选择 "计算机帐户"，然后选择 "下一步"。
在 "选择计算机" 对话框中，选择 "完成"。
在 "添加或删除管理单元" 对话框中，选择 "确定"。
若要添加中间证书，请按照以下步骤操作：
在 "证书" MMC 管理单元中，展开 "证书"，右键单击 "中级证书颁发机构"，指向 "所有任务"，然后选择 "导入"。
在 "证书导入向导" 中，选择 "下一步"。
在 "要导入的文件" 页上，在 "文件名" 框中键入要导入的证书的文件名，然后选择 "下一步"。
选择 "下一步"，然后完成证书导入向导。

// 证书存储区域指定，具体操作如下：

1、国家根证书(ROOTCA)，指定的存储区如下：

     显示物理存储区 -->受信任的根证书颁发机构 -->本地计算机Local  Computer


2、省根证书（中级根），指定的存储区域如下：

      显示物理存储区 -->中级证书颁发机构 -->本地计算机Local  Computer

```

### 3. 尚未创建默认 SSL 站点 若要支持不带 SNI 功能的浏览器 建议创建一个默认 SSL 站点

- [尚未创建默认 SSL 站点 若要支持不带 SNI 功能的浏览器 建议创建一个默认 SSL 站点\_常见问题\_Gworg](https://www.gworg.com/problems/976.html)
