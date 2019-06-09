# get set

- [C#中 set 与 get 语句](https://zhidao.baidu.com/question/490736754188972092.html)

## 语句

### 中 set 与 get 语句怎么写

```C#
public class UserInfoData
{
    private string userid;
    private string userpwd;
    private string userlevel;

    public string UserId
    {
        get{ return this.userid;}
        set{ this.userid = value; }
    }

    public string UserPassword
    {
        get{ return this.userpwd;}
        set{ this.userpwd = value; }
    }

    public string UserLevel
    {
        get{ return this.userlevel;}
        set{ this.userlevel = value; }
    }
}
```

### Demo

```C#
public static string sitenamepath
{
    get { return Wordspath("网站名称"); }
}
```
