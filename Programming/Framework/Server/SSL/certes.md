# certes

- [fszlin/certes](https://github.com/fszlin/certes)
- [fszlin/certes](https://github.com/fszlin/certes/blob/master/docs/APIv2.md#accounts)
- [draft-ietf-acme-acme-12 - Automatic Certificate Management Environment (ACME)](https://tools.ietf.org/html/draft-ietf-acme-acme-12)

```c#

```

## 0. Installation

```c#
Install-Package Certes
```

## 1. Use

- [基于 ACME http-01 身份验证的实现方式的 XSS - 先知社区](https://xz.aliyun.com/t/2726)

```c#

Pending /*待定*/
Processing /*处理中*/
Valid /*有效*/
Invalid /*无效*/

Create the context with specific ACME server by providing the directory URI.

var context = new AcmeContext(WellKnownServers.LetsEncryptStagingV2);
Use specific key for existing account or creating new account.

var context = new AcmeContext(
    WellKnownServers.LetsEncryptStagingV2,
    KeyFactory.FromPem("account-key.pem"));
Export the account key for later use.

var pem = context.AccountKey.ToPem();
var der = context.AccountKey.ToDer();s
```

## 2. API for ACME v2

This document details the API exposed for handling ACME flows, as of [draft-12][draft].

### 0. Initialization

Create the context with specific ACME server by providing the directory URI.
通过提供目录 URI，使用特定的 ACME 服务器创建上下文。

```C#
var context = new AcmeContext(WellKnownServers.LetsEncryptStagingV2);
```

Use specific key for existing account or creating new account.
对现有帐户或创建新帐户使用特定的密钥。

```C#
var context = new AcmeContext(
    WellKnownServers.LetsEncryptStagingV2,
    KeyFactory.FromPem("account-key.pem"));
```

Export the account key for later use.
导出帐户密钥以供以后使用。

```C#
var pem = context.AccountKey.ToPem();
var der = context.AccountKey.ToDer();
```

### 0. Accounts

Get the url to `Terms of Service` for user to review.

```C#
var tos = context.TermsOfService();
```

Create new account.
建立新帐户。

```C#
var account = await context.NewAccount(
    new [] { "mailto:admin@example.com", "mailto:it@example.com" }, true);
var account = await context.NewAccount("admin@example.com", true);
```

Fetch existing account from server.
从服务器获取现有帐户。

```C#
var account = await context.Account();
```

Fetch the account info from server.
从服务器获取帐户信息。

```C#
var accountInfo = await account.Resource();
```

Update contacts, or accept `Terms of Service` again if it's updated.
更新联系人，Terms of Service 如果更新，则再次接受。

```C#
await account.UpdateUpdate(
    contact: new[] { $"mailto:support@example.com" },
    agreeTermsOfService: true);
```

Update the account key.
更新帐户密钥。

```C#
var newKey = KeyFactory.NewKey(KeyAlgorithm.ES256);
await account.ChangeKey(newKey);

File.WriteAllText("new-key.pem", newKey.ToPem());
```

Deactivate account.
关闭 帐户。停用

```C#
await account.Deactivate();
```

<!---
Navigate to related entities.
```C#
var orders = await account.Orders();
```
-->

### 0. Orders

Apply for certificate issuance.
申请证书颁发

```C#
var order = await context.NewOrder(new [] { "*.example.com" });
var orderUri = order.Location;
```

Retrieve order by URI.
通过 URI 检索订单。

```C#
var order = context.Order(orderUri);
```

Finalize the order.
完成订单。

```C#
var certKey = KeyFactory.NewKey(KeyAlgorithm.RS256);
await orderCtx.Finalize(
    new CsrInfo
    {
        CountryName = "CA",
        State = "State",
        Locality = "City",
        Organization = "Dept",
    }, certKey);
```

Send customized CSR to finalize the order.
发送定制的 CSR 以完成订单。

```C#
var csr = new CertificationRequestBuilder();
csr.AddName($"C=CA, ST=State, L=City, O=Dept, CN=*.example.com");

await orderCtx.Finalize(csr.Generate());
```

Download the certificate PEM.
下载证书 PEM。

```C#
var certChain = await order.Download();
```

Finalize and download the certificate.

```C#
var certKey = KeyFactory.NewKey(KeyAlgorithm.RS256);
var cert = await order.Generate(
    new CsrInfo
    {
        CountryName = "CA",
        State = "State",
        Locality = "City",
        Organization = "Dept",
    }, certKey);
```

### 0. Authorizations

Retrieve authorizations of the order.
检索订单的授权。

```C#
var authorizations = await order.Authorizations();
```

Search authorization by domain name.
按域名搜索授权。

```C#
var authz = await order.Authorization("*.example.com");
var authzUri = authz.Location;
```

Retrieve authorization by URI.

```C#
var authz = await context.Authorization(authzUri);
```

### 0. Challenges

Retrieve challenges of the authorzation.

```C#
var challenges = await authz.Challenges();
var dnsChallenge = await authz.Dns();
var httpChallenge = await authz.Http();
var tlsAlpnChallenge = await authz.TlsAlpn();
```

Create the respone file for provisioning to `/.well-know/acme-challenge/`.
创建用于配置到的 respone 文件

```C#
var keyAuth = httpChallenge.KeyAuthz;
File.WriteAllText(httpChallenge.Token, keyAuth);
```

Compute the value for DNS TXT record.
计算 DNS TXT 记录的值。

```C#
var dnsTxt = context.AccountKey.DnsTxt(challenge.Token);
```

Generate certificate with X509 ACME validation extension.
使用 X509 ACME 验证扩展生成证书。

```C#
var alpnCertKey = KeyFactory.NewKey(KeyAlgorithm.ES256);
var alpnCert = context.AccountKey.TlsAlpnCertificate(challenge.Token, "www.my-domain.com", alpnCertKey);
```

Let the ACME server to validate the challenge once it is ready.
准备就绪后，让 ACME 服务器验证。

```C#
await challenge.Validate();
```

### 0. Certificates

Download certificate for a pending order.
下载待处理订单的证书。

```C#
var cert = await order.Generate(
    new CsrInfo
    {
        CountryName = "CA",
        State = "State",
        Locality = "City",
        Organization = "Dept",
    });
```

Download the certifcate for a finalized order.
下载证书已完成定单。

```C#
var certChain = await order.Download();
```

Export the certificate to PEM, DER, or PFX.
将证书导出到 PEM，DER 或 PFX。

```C#
var cert = new CertificateInfo(certChain, certKey);

var pem = cert.ToPem();
var der = cert.ToDer();
var pfx = cert.ToPfx("cert-name", "abcd1234");

var keyPem = cert.Key.ToPem();
```

Revoke certificate with account key.
使用帐户密钥吊销证书。

```C#
context.RevokeCertificate(cert.ToDer(), RevocationReason.KeyCompromise);
```

Revoke certificate with certificate private key.
使用证书私钥吊销证书。

```C#
context.RevokeCertificate(cert.ToDer(), RevocationReason.KeyCompromise, certKey);
```

<!---
### 0. Not Implemented
* Account
  * External Account Binding
-->

[draft]: https://tools.ietf.org/html/draft-ietf-acme-acme-12
