# Domain

- [.net(C#)输入域名获取主域名小工具-木庄网络博客](http://www.muzhuangnet.com/show/365.html)
- [C#通过 URL 获取顶级域名的方法 - KevinYao - 博客园](https://www.cnblogs.com/mic86/archive/2013/05/04/3059662.html)

```c#


string oldUrl = this.Request.Url.Host.Trim();//输入域名
string reg =
"[^.]+\\.(com.cn|com|net.cn|net|org.cn|org|gov.cn|gov|cn|mobi|me|info|name|biz|cc|tv|asia|hk|网络|公司|中国)";
string domain = System.Text.RegularExpressions.Regex.Match(oldUrl, reg).ToString();//输出主域名


Match match = Regex.Match(host, "([^.]+\\.[^.]{1,3}(\\.[^.]{1,3})?)$");
string domain = match.Groups[1].Success ? match.Groups[1].Value : null;
host.com => return host.com
s.host.com => return host.com

host.co.uk => return host.co.uk
www.host.co.uk => return host.co.uk
s1.www.host.co.uk => return host.co.uk





```

## 常用

```c#
string baseDomain = GetBaseDomain((new Uri(url)).Host);

public static string GetBaseDomain(string host)
{
    List<string> DomainSuffixs = new List<string>(".com|.co|.info|.net|.org|.me|.mobi|.us|.biz|.xxx|.ca|.co.jp|.com.cn|.net.cn|.org.cn|.mx|.tv|.ws|.ag|.com.ag|.net.ag|.org.ag|.am|.asia|.at|.be|.com.br|.net.br|.bz|.com.bz|.net.bz|.cc|.com.co|.net.co|.nom.co|.de|.es|.com.es|.nom.es|.org.es|.eu|.fm|.fr|.gs|.in|.co.in|.firm.in|.gen.in|.ind.in|.net.in|.org.in|.it|.jobs|.jp|.ms|.com.mx|.nl|.nu|.co.nz|.net.nz|.org.nz|.se|.tc|.tk|.tw|.com.tw|.idv.tw|.org.tw|.hk|.co.uk|.me.uk|.org.uk|.vg".Split('|'));
    string[] hs = host.Split(".".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

    if (hs.Length > 2)
    {
        //传入的host地址至少有三段
        int p2 = host.LastIndexOf('.');                 //最后一次“.”出现的位置
        int p1 = host.Substring(0, p2).LastIndexOf('.');//倒数第二个“.”出现的位置
        string s1 = host.Substring(p1);
        if (!DomainSuffixs.Contains(s1))
            return s1.TrimStart('.');

        //域名后缀为两段（有用“.”分隔）
        if (hs.Length > 3)
            return host.Substring(host.Substring(0, p1).LastIndexOf('.'));
        else
            return host.TrimStart('.');
    }
    else if (hs.Length == 2)
    {
        return host.TrimStart('.');
    }
    else
    {
        return string.Empty;
    }
}


```
