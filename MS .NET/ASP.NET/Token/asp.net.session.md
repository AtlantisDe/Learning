# asp.net.session

- [ASP.NET Web Configuration Guidelines](<https://docs.microsoft.com/en-us/previous-versions/ff400235(v=vs.100)>)
- [ASP.NET 中的 authentication(验证)与 authorization(授权) - 火地晋 - 博客园](https://www.cnblogs.com/yelaiju/p/3204298.html)
- [asp.net 实现匿名访问控制\_asp.net 技巧 - 甜菜波波 - 博客园](https://www.cnblogs.com/tiancai/articles/2440257.html)

## 常见配置

```C#
<authentication mode="Forms" />
<authentication mode="Windows"/>
```

## asp.net 身份验证（最简单篇）

```C#
// 第一步：修改web.config文件。
// 1、在<system.web>和</system.web>中找到<authentication>节，将其改为“<authentication mode="Forms" />”，其中Forms代表使用表单认证。
<authentication mode="Forms" />
// 2、<system.web>和</system.web>中添加“<authorization><deny users="?"/></authorization>”，其中“<deny users="?"/>”代表拒绝所有的匿名用户。
<authorization><deny users="?"/></authorization>
// 第三步：在login.aspx文件中验证身份。
```

## Web.config 配置登陆文件信息

```xml
<configuration>
  <system.web>
    <compilation debug="true" targetFramework="4.0"/>
    <pages controlRenderingCompatibilityVersion="3.5" clientIDMode="AutoID"/>
    <authentication mode="Forms"/>
    <authorization>
      <deny users="?"/>
    </authorization>
  </system.web>
</configuration>
```

## login.aspx 页面参考

```C#
        protected void Button1_Click(object sender, EventArgs e)
        {
            //身份验证方式，本例中用户名为1，密码为2
            if (TextBox1.Text == "1" && TextBox2.Text == "2")
            {
                /*
                * 为用户名创建一个身份验证票据，并将其添加到响应的Cookie中
                * SetAuthCookie的第一个参数为已验证的用户的名称。
                * SetAuthCookie的第二个参数为true时代表创建持久Cookie（跨浏览器会话保存的 Cookie），为false则关闭浏览器后要重新验证身份
                */
                FormsAuthentication.SetAuthCookie(TextBox1.Text, false);
            }

            //如果URL中没有传递ReturnUrl参数，则跳转到Default.aspx，否则跳转到ReturnUrl参数值指定的网页
            if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
            }
        }

```

## login.aspx 页面参考 2

```C#
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Appweixinuser.login" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Admin</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="https://cdn.90so.net/layui/2.4.5/css/layui.css" media="all" />
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>

<body>
    <form id="form1" runat="server" style="display: none">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>
    </form>


    <script src="https://cdn.90so.net/layui/2.4.5/layui.all.js" charset="utf-8"></script>
</body>
</html>

```
