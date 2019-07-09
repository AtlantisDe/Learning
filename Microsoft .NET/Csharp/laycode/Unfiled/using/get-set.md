# get set

- [C#中 set 与 get 语句](https://zhidao.baidu.com/question/490736754188972092.html)
- [c# 造一个事件，监测一个 string 类的对象的值，当值发生改变时触发事件。](https://zhidao.baidu.com/question/1669968280264798347.html)

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

### c# 造一个事件，监测一个 string 类的对象的值，当值发生改变时触发事件

```c#
public class AClass
{
    protect string _a="旧值";
    public string A{
        get{
            return _a;
        }
        set{
            _a=value;
            OnStringChange();
        }
    }
    public event Eventhandle OnStringChangeEvent;
    public void OnStringChange()
    {
        if(OnStringChangeEvent!=null)
        {
            OnStringChangeEvent(this,null);
        }
    }
}

//比如在main函数中 如果这样用就会引发一个事件
static void main()
{
    var aa=new AClass();

    aa.OnStringChangeEvent+=(oo,ee)=>{
        Console.WriteLine("值变了，新值是："+(oo as AClass).A);
    };

    aa.A="新值";
}
```

### set

```c#
[Language("am")]
public static Language Amharic { get; internal set; }
```
