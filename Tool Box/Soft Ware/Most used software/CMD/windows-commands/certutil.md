# certutil

- [certutil](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/certutil)
- [Windows 系统中通过命令查看文件的 MD5,SHA1,SHA256 校验值](https://blog.csdn.net/ternence_hsu/article/details/79461305)
- [Import pfx file into particular certificate store from command line](https://stackoverflow.com/questions/5171117/import-pfx-file-into-particular-certificate-store-from-command-line)
- [certutil 命令详解](https://www.jianshu.com/p/b1cdd594c67a)
- [Importing a certificate and granting permissions on Windows Server 2012 R2](https://serverfault.com/questions/620013/importing-a-certificate-and-granting-permissions-on-windows-server-2012-r2)

```c#
Certutil.exe is a command-line program, installed as part of Certificate Services. You can use certutil.exe to dump and display certification authority (CA) configuration information, configure Certificate Services, backup and restore CA components, and verify certificates, key pairs, and certificate chains.

If certutil is run on a certification authority without additional parameters, it displays the current certification authority configuration. If certutil is run on a non-certification authority, the command defaults to running the certutil [-dump] command.


```

## 0. Usage

```c#

Certutil.exe -f -p changeit -importpfx "D:\Tmp\mkcert\127.0.0.1-client.p12"
Certutil.exe -f -p ThanksSoMuch -importpfx "D:\Tmp\mkcert\001.pfx"
Certutil.exe -f -p "" -importpfx "D:\Tmp\mkcert\002.pfx"



// -dump
certutil [options] [-dump]
certutil [options] [-dump] file

[-f] [-silent] [-split] [-p password] [-t timeout]

// -asn
certutil [options] -asn file [type]
// [type]: numeric CRYPT_STRING_* decoding type



// 命令格式如下：

certutil -hashfile yourfilename MD5
certutil -hashfile yourfilename SHA1
certutil -hashfile yourfilename SHA256
certutil -hashfile "C:\WINDOWS\system32\cmd.exe" MD5
certutil -hashfile "C:\WINDOWS\system32\cmd.exe" MD5 >>c:\test.txt
certutil.exe -addstore root c:\capublickey.cer


// Anchoring my findings here for future readers.
// Import certificate to Trusted Root Certification Authorities on Local Machine:

CERTUTIL -addstore -enterprise -f -v root "somCertificat.cer"

// Import pfx to Personal on local machine

CERTUTIL -f -p somePassword -importpfx "somePfx.pfx"

// Import pfx to Trusted People on local machine - Link to importpfx.exe

importpfx.exe -f "somePfx.pfx" -p "somePassword" -t MACHINE -s "TRUSTEDPEOPLE"

// Import certificat to Trusted People on local machine

Certutil -addstore -f "TRUSTEDPEOPLE" "someCertificate.cer"

```
