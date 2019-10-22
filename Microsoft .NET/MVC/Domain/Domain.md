# Domain

- [.net(C#)输入域名获取主域名小工具-木庄网络博客](http://www.muzhuangnet.com/show/365.html)

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
    public static string GetCurrentDomain(this Uri uri)
    {

        var host = uri.Host;

        string Get_Suffix(string ext)
        {
            if (host.Length > ext.Length)
            {
                var Value1 = host.Substring(host.Length - ext.Length, ext.Length);
                return Value1;
            }

            return "";
        }

        string Get_Prefix(string ext)
        {
            if (host.Length > ext.Length)
            {
                var Value1 = host.Substring(0, host.Length - ext.Length);
                Value1 = string.Format(".{0}#", Value1);
                Value1 = Value1.GetStringMidFromEnd(".", "#");
                if (Value1.IsNullOrEmpty() == false)
                {
                    return string.Format("{0}{1}", Value1, ext); ;
                }

            }

            return "";
        }

        string DomainExt = ".com";
        string Domain = "";
        if (Get_Suffix(DomainExt) == DomainExt)
        {
            Domain = Get_Prefix(DomainExt);
            DomainExt = ".com.cn";
        }
        else if (Get_Suffix(DomainExt) == DomainExt)
        {
            Domain = Get_Prefix(DomainExt);
            DomainExt = ".net.cn";
        }
        else if (Get_Suffix(DomainExt) == DomainExt)
        {
            Domain = Get_Prefix(DomainExt);
            DomainExt = ".net";
        }
        else if (Get_Suffix(DomainExt) == DomainExt)
        {
            Domain = Get_Prefix(DomainExt);
            DomainExt = ".cn";
        }

        else if (Get_Suffix(DomainExt) == DomainExt)
        {
            Domain = Get_Prefix(DomainExt);
            DomainExt = ".org.cn";
        }
        else if (Get_Suffix(DomainExt) == DomainExt)
        {
            Domain = Get_Prefix(DomainExt);
            DomainExt = ".gov";
        }

        return Domain;
    }

```
