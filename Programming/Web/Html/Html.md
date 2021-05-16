# Html

## 1. 知识目录

### 1. 常用代码

#### 1. 属性值换行

- [设计 HTML 标签 title 属性值换行 - 专业填坑人 - CSDN 博客](https://blog.csdn.net/bigbear00007/article/details/80758241)

```C#
&nbsp;


&#10;&#13; 常用于文本框换行符
&#10;&#13;
&#10; //换行
&#13; //空行
\n
<br/>
<br />
```

#### 2. 属性值空格

```C#
&nbsp;

```

#### 3. 常用 font 代码

```C#
<font color="#FF0000"></font>
<font color="#FF0000" id="IdDemo">营业部明细名称</font>

```

#### 4. 其它样式

```c#
    <hr class="layui-bg-blue">
```

#### 5. div 左边固定宽度，右边自适应宽度

- [div 左边固定宽度，右边自适应宽度 - neo_o - 博客园](https://www.cnblogs.com/wangyunhui/p/10370764.html)

```c#
<div style="height: 100%; position: relative;">
    <div style="height:100px;width:200px;float:left;"> 左边DIV </div>
    <div style="height: 100px;overflow: hidden;">右边DIV </div>
</div>


   <style type="text/css">
　　html,body { height: 100%; padding: 0; margin: 0; }
　　.outer { height: 100%;  box-sizing: border-box ; position: relative; }
　　.A { height: 100px; background: #BBE8F2; width: 200px;float: left; }
　　.B { height: 100px; background: #D9C666; overflow: hidden;}
</style>

<div class="outer">
    <div class="A"> 左边DIV </div>
    <div class="B">右边DIV </div>
</div>
```

#### 6. icon 小图标

- [如何给网页标题添加 icon 小图标*q515656712 的博客-CSDN 博客*网页标题小图标](https://blog.csdn.net/q515656712/article/details/94449101)
- [使用 link rel=&quot;shortcut icon&quot;为网页标题加图标 - 明媚下雨天 - 博客园](https://www.cnblogs.com/GoTing/p/7494307.html)
- [favicon.ico 浏览器不显示的解决方案\_xdongll 的专栏-CSDN 博客](https://blog.csdn.net/xdongll/article/details/78252252)
- [关于网页：浏览器不请求favicon.ico的原因是什么？ | 码农家园](https://www.codenong.com/35564916/)

```c#

//  最终链接标签为：
<link href="favicon.ico?v=1.0" rel="icon" type="image/x-icon"/>


<link rel="shortcut icon" href="1.png" type="image/x-icon" />
<link rel="icon" href="1.gif" type="image/gif" >


<link rel="shortcut icon" href="http://example.com/favicon.ico" type="image/vnd.microsoft.icon">
<link rel="icon" href="http://example.com/favicon.ico" type="image/vnd.microsoft.icon">

<link href="/favicon32.png" rel="shortcut icon" type="image/x-icon" />

<link href="favicon.ico" mce_href="favicon.ico" rel="icon" type="image/x-icon">
<link href="/favicon.ico" mce_href="/favicon.ico" rel="icon" type="image/x-icon">



```

## 1. HTML a

```c#
<dd><a href="javascript:;">安全管理</a></dd>
<dd><a href="javascript:;" onclick="loginout();">安全退出</a></dd>
<a href="javascript:;">梅西点球</a>

```

## 2. meta

- [HTML meta tags cheatsheet](https://devhints.io/html-meta)
- [关于 meta 标签中的 http-equiv 属性使用介绍 - 予沫笙 - 博客园](https://www.cnblogs.com/yumo1627129/p/7198968.html)

### 1. X-UA-Compatible

- [浅析网页 meta 标签中 X-UA-Compatible 属性的使用](https://www.cnblogs.com/menyiin/p/6527339.html)

## 3. HTML Tags

- [HTML Tags](https://www.quackit.com/html/tags/)

## 4. HTML 5 Comments Tag

- [HTML 5 Comments Tag](https://www.quackit.com/html_5/tags/html_comments_tag.cfm)

## 5. HTML.iframe

- [Web 前端之 iframe 详解 - 滥好人 - 博客园](https://www.cnblogs.com/hq233/p/9849939.html)
- [Getting Title at 44:30](https://www.w3school.com.cn/tags/tag_iframe.asp)
- [layer 弹层组件开发文档 - Layui](https://www.layui.com/doc/modules/layer.html#layer.iframeAuto)

```c#

```

- [iframe 高度自适应的 6 个方法](http://caibaojian.com/iframe-adjust-content-height.html)
- [Web 开发须知：URL 编码与解码](https://www.cnblogs.com/liuhongfeng/p/5006341.html)
- [layer 官方演示与讲解（jQuery 弹出层插件）](https://layer.layui.com/)

```C#
<iframe src="backtop.html" frameborder="0" scrolling="no" id="external-frame" onload="setIframeHeight(this)"></iframe>
<iframe title="Blank" id="ad_iframe" name="ad_iframe" scrolling="no" src="about:blank" frameborder="0" width="300px" height="250px"></iframe>
```
