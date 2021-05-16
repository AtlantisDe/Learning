# Domain

- [http://data.iana.org/TLD/tlds-alpha-by-domain.txt](http://data.iana.org/TLD/tlds-alpha-by-domain.txt)
- [Getting a &#39;base&#39; Domain from a Domain](https://weblog.west-wind.com/posts/2012/Apr/24/Getting-a-base-Domain-from-a-Domain)
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

/*域名扩展*/
static readonly List<string> DomainSuffixs = new List<string>(".com|.co|.info|.net|.org|.me|.mobi|.us|.biz|.xxx|.ca|.co.jp|.com.cn|.net.cn|.org.cn|.mx|.tv|.ws|.ag|.com.ag|.net.ag|.org.ag|.am|.asia|.at|.be|.com.br|.net.br|.bz|.com.bz|.net.bz|.cc|.com.co|.net.co|.nom.co|.de|.es|.com.es|.nom.es|.org.es|.eu|.fm|.fr|.gs|.in|.co.in|.firm.in|.gen.in|.ind.in|.net.in|.org.in|.it|.jobs|.jp|.ms|.com.mx|.nl|.nu|.co.nz|.net.nz|.org.nz|.se|.tc|.tk|.tw|.com.tw|.idv.tw|.org.tw|.hk|.co.uk|.me.uk|.org.uk|.vg".Split('|'));


/// <summary>获取域名基本域</summary>
public static string GetBaseDomain(this Uri uri)
{
    for (int i = 0; i < DomainSuffixs.Count; i++)
    {
        if (uri.Host.EndsWith(DomainSuffixs[i]))
        {
            int dot = uri.Host.Substring(0, uri.Host.Length - DomainSuffixs[i].Length).LastIndexOf('.');
            //if dot equals -1 (when '.' is not found) +1 will bump to 0 (for example if host equals test.com)
            //if dot greater than or equal 0 (when '.' is found) +1 will exclude the '.' (for eaxmple if host equals www.test.com)
            return uri.Host.Substring(dot + 1);
        }
    }
    return uri.Host;

}

```
