# HMAC-SHA1

- HMACSHA1 是从 SHA1 哈希函数构造的一种键控哈希算法，被用作 HMAC（基于哈希的消息验证代码）。此 HMAC
  进程将密钥与消息数据混合，使用哈希函数对混合结果进行哈希计算，将所得哈希值与该密钥混合，然后再次应用哈希函数。输出的哈希值长度为 160
  位，可以转换为指定位数。

## C#代码

- [C# HMAC Sha1 生成签字 - 闪电编码](https://blog.csdn.net/wenw50/article/details/81903088)
- [HMACSHA1 几种写法算法代码](https://blog.csdn.net/lixiaoer757/article/details/8016542)

## 生成签名串

## 具体代码如下，以 PHP 语言为例

```php
$secretKey = 'Gu5t9xGARNpq86cd98joQYCN3EXAMPLE';
$srcStr = 'GETcvm.tencentcloudapi.com/?Action=DescribeInstances&InstanceIds.0=ins-09dx96dg&Limit=20&Nonce=11886&Offset=0&Region=ap-guangzhou&SecretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3EXAMPLE&Timestamp=1465185768&Version=2017-03-12';
$signStr = base64_encode(hash_hmac('sha1', $srcStr, $secretKey, true));
echo $signStr;
```

## 方法返回的结果是用 Base64 进行编码后的结果，这也是腾讯云要求的方式。

```C#
public static string ToHMACSHA1(string encryptText, string encryptKey)
{
    //HMACSHA1加密
    HMACSHA1 hmacsha1 = new HMACSHA1();
    hmacsha1.Key = System.Text.Encoding.UTF8.GetBytes(encryptKey);
    byte[] dataBuffer = System.Text.Encoding.UTF8.GetBytes(encryptText);
    byte[] hashBytes = hmacsha1.ComputeHash(dataBuffer);
    return Convert.ToBase64String(hashBytes);
}
```
