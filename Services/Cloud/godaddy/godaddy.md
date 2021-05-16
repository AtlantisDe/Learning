# godaddy

- [godaddy](https://account.godaddy.com/)
- [bulk-domain-search](https://sg.godaddy.com/zh/domains/bulk-domain-search.aspx)
- [GoDaddy 批量修改域名 DNS 方法 批量使用第三方 CloudFlare DNS | 老董优惠码](http://www.laodong.me/bulk-change-dns/)

## 1. 常用入口

- [dns](https://dcc.godaddy.com/manage/baidu.com/dns)
- [管理全部域名](https://dcc.godaddy.com/domains/)
- [https://developer.godaddy.com/keys](https://developer.godaddy.com/keys)
- [https://developer.godaddy.com/doc](https://developer.godaddy.com/doc)
- [https://developer.godaddy.com/doc/endpoint/domains](https://developer.godaddy.com/doc/endpoint/domains)

## 2. 解析

```c#
// 根记录
A 记录 @ 或 abc.com 指向 123.123.123.123

// 泛解析
// 假如你注册了一个域名abc.com，现在做一个泛解析“*.abc.com”指向IP地址：1.1.1.1，那么解析生效后，无论访客输入的是“1.abc.com”，“2.abc.com”，“1.2.abc.com”还是“1.2.3.abc.com”都可以指向1.1.1.1这个IP地址。

```

## 3. 转入

- [转入教程](http://www.vipbeian.com/post/2662)

## 4. 域名交易

- [域名交易 | 买卖特色域名 — GoDaddy](https://sg.auctions.godaddy.com/zh/)
- [Sell Domains | Buy Domains | Park Domains - Afternic](https://www.afternic.com/)

```c#

```

## 5. 便捷操作

```c#
var Text = "";
document.querySelectorAll('.name.domain-name').forEach(function (element, index) {
    Text = Text+element.innerText+"\r\n";
});
console.log(Text); 



var domains = document.querySelectorAll('.name.domain-name');

document.querySelectorAll('.name.domain-name').forEach(function (element, index) {
  console.log(element.innerText); 
});


var domains= document.querySelector(".name.domain-name");
```
