# asp.net.session exit

- [asp.net 用户退出，也就是清空 session 并自动重定向到登陆页面，session - 黑色头发 - CSDN 博客](https://blog.csdn.net/heisetoufa/article/details/83332237)
- [asp.net 判断session是否过期 - KyrieYang - 博客园](https://www.cnblogs.com/yzenet/p/3377438.html)

## 常见配置

```C#
//Session.Abandon();//取消当前会话
//Session.Clear();//清除所有session

Session.Remove("sessionUserName");
Session.Remove("sessionGLBM");

this.Response.Redirect("../public/Login.aspx");
```
