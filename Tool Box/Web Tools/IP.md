# IP

- [IPIP.NET 专业的 IP 地址库 IPIP.NET](https://www.ipip.net/)
- [IP 相关数据信息](https://www.ipip.net/ip.html)
- [获取用户真正的 ip 地址](https://new.qq.com/omn/20180708/20180708G0DOLV.html)
- [获取用户的真正 IP 地址 网络 bailaoshi666](https://blog.csdn.net/bailaoshi666/article/details/105198517/)
- [X-Forwarded-For](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-For)
- [老调重谈：获取用户 IP，ip138 能够获取到真实的 IP-CSDN 论坛](https://bbs.csdn.net/topics/390727207)
- [Getting the original client IP with X-Forwarded-For in your code | Total Uptime®](https://totaluptime.com/kb/getting-the-original-client-ip-with-x-forwarded-for-in-your-code/)
- [IP.cn - IP 地址查询 | 地理位置 | 手机归属地](https://www.ip.cn/)
- [http://pv.sohu.com/cityjson?ie=utf-8](http://pv.sohu.com/cityjson?ie=utf-8)
- [iP 查询](http://www.ip138.com/)
- [查看自己的 IP 地址](https://whoer.net/zh)
- [根据 IP 与返回语言类型显示](http://ip-api.com/json/115.191.200.34?lang=zh-CN)
- [My IP Address](https://whatismyipaddress.com/)
- [whatismyip](https://www.whatismyip.com/)
- [🔍 IP Address Lookup - Find IP Address Location - WhatIsMyIP.com](https://www.whatismyip.com/ip-address-lookup/)
- [https://www.iplocation.net/](https://www.iplocation.net/)
- [Update Your Geolocation](https://whatismyipaddress.com/location-feedback)
- [User Agent: Learn Your Web Browser’s User Agent Now](https://www.whoishostingthis.com/tools/user-agent/)

## 0. php 获取用户 地区 、ip 地址

- [php 获取用户 地区 、ip 地址 - MasterC - 博客园](https://www.cnblogs.com/masterccc/p/6096156.html)

```php
header("Content-type: text/html; charset=utf-8");

function getCity($ip = '')//获取地区
{
    if($ip == ''){
        $url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json";//新浪借口获取访问者地区
        $ip=json_decode(file_get_contents($url),true);
        $data = $ip;
    }else{
        $url="http://ip.taobao.com/service/getIpInfo.php?ip=".$ip;//淘宝借口需要填写ip
        $ip=json_decode(file_get_contents($url));
        if((string)$ip->code=='1'){
           return false;
        }
        $data = (array)$ip->data;
    }

    return $data;
}

print_r($city);


//获取访问者ip地址

if ($_SERVER['REMOTE_ADDR']) {//判断SERVER里面有没有ip，因为用户访问的时候会自动给你网这里面存入一个ip
$cip = $_SERVER['REMOTE_ADDR'];
} elseif (getenv("REMOTE_ADDR")) {//如果没有去系统变量里面取一次 getenv()取系统变量的方法名字
$cip = getenv("REMOTE_ADDR");
} elseif (getenv("HTTP_CLIENT_IP")) {//如果还没有在去系统变量里取下客户端的ip
$cip = getenv("HTTP_CLIENT_IP");
} else {
$cip = "unknown";
}
echo $cip;
```

## 1. 国际化显示：归属地可切换展示

```c#
// 国际化显示：归属地可切换展示
http://ip-api.com/json/　　# 国际化英文显示
http://ip-api.com/json/?lang=zh-CN　　# 中文显示
http://ip-api.com/json/115.191.200.34?lang=zh-CN　　# 查询某个ip的信息
```

## 2. 搜狐 IP 地址查询接口

```c#
搜狐IP地址查询接口（默认GBK）：http://pv.sohu.com/cityjson
搜狐IP地址查询接口（可设置编码）：http://pv.sohu.com/cityjson?ie=utf-8
搜狐另外的IP地址查询接口：http://txt.go.sohu.com/ip/soip

// 利用JS获取用户当前ip地址
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript">  
    console.log(returnCitySN["cip"]+','+returnCitySN["cname"])  
</script>
```

## 3. 126 IP API

- [http://ip.ws.126.net/ipquery?ip=](http://ip.ws.126.net/ipquery?ip=)
- [网易 IP 查询 API 接口](https://mr-z.me/2018/11/netease-ip-query-api.html)

```c#
<script src="https://ip.ws.126.net/ipquery?ip="></script>
<script type="text/javascript">
    try {
        var add = "";
        if (lc != "") {
            add = lc;
        } else {
            add = lo;
        }
        document.getElementById("city").innerText = add;
        document.cookie = "username=John Doe";
        console.log(lo)

    } catch (e) {
        console.log(e.message); //sojson is undefined
    }
</script>


// 或者通过ajax调用(将以下代码复制到html文件即可预览效果。)
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<title>测试</title>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<input type="textarea" id="ip" />
<br />
<br />
<input type="textarea" id="result" />
<br />
<br />
<input type="button" value="查询" id="query" />
<script>
$(document).ready(function(){
$('#query').click(function(){
$.getScript('http://ip.ws.126.net/ipquery?ip='+$('#ip').val(),
function(){
$('#result').val(lo + " "+ lc);
}
);
})
});
</script>
</body>
</html>
```

## 4. 太平洋电脑网(查询似乎准确些)

- [IP 信息](http://whois.pconline.com.cn/)
- [您查询的 IP](http://whois.pconline.com.cn/whois/index.jsp)

## 5. 获取 IP 地址详细地理位置信息

- [获取 IP 地址详细地理位置信息*懒得勤快的博客*互联网分享精神](https://masuit.com/tools/ip)

## 6. Curl 域名

- [IP Address Lookup / IPv4 / IPv6 - IP.SB](https://ip.sb/)
- [API - IP.SB](https://ip.sb/api/)

```C#
curl ip.sb
curl -L tool.lu/ip
```

## 7. Powershell

- [如何使用 PowerShell 实时获取自己的公网 IP 地址-Just Make it happen-51CTO 博客](https://blog.51cto.com/mxyit/1761385)
- [Using Regular Expressions with PowerShell To Locate Data -- Microsoft Certified Professional Magazine Online](https://mcpmag.com/articles/2016/06/02/regular-expressions-with-powershell.aspx)
- [Getting Title at 0:21](https://stackoverflow.com/questions/46305027/powershell-regular-expression-match-ip-not-proceeded-and-not-followed-by-ip)

```c#
// 匹配IP
'The IP address is 192.168.1.58 on computer SERVER1'  -match '(?:\d{1,3}\.){3}\d{1,3}'
$Matches



$IPs = $line.Split().Where({$_ -as [IPAddress]})
if ($IPs.Count -eq 1) {
    $match = $IPs[0]
}


$body = Invoke-WebRequest -Uri "http://pv.sohu.com/cityjson?ie=utf-8"
$str = $null
if ($body.StatusCode -eq 200) {
    [string]$str = $body.ParsedHtml.body.innerHTML

    $str =$str.Replace(' ', '')
    $str =$str.Replace('"', '')
    $StartIndex = $str.IndexOf(":")
    $EndIndex = $str.IndexOf(",")
    $length = $EndIndex - $StartIndex - 1
    $ip = $str.Substring($StartIndex + 1, $length)
    $server_addr = $ip
    $server_addr

}
else {
    Write-Warning "Bad Request"
}

```

## 8.IPIP.NET\_专业的 IP 地址库\_IPIP.NET

- [IPIP.NET\_专业的 IP 地址库\_IPIP.NET](https://www.ipip.net/)

```c#

```
