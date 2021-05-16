# Base64

## 常用

### wiki

- [Base64 笔记 - 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2008/06/base64.html)

### .net

- [MikValSor.Base64 1.0.2](https://www.nuget.org/packages/MikValSor.Base64/#)

### cdn

- [Base64 | BootCDN - Bootstrap 中文网开源项目免费 CDN 加速服务](https://www.bootcdn.cn/Base64/)
- [Base64 - cdnjs.com - The best FOSS CDN for web related libraries to speed up your websites!](https://cdnjs.com/libraries/Base64)

### jQuery.base64.js

- [yckart/jquery.base64.js](https://github.com/yckart/jquery.base64.js)
- [jquery-base64.js 插件使用 - 杨龙飞 - 博客园](https://www.cnblogs.com/windseek/p/6433606.html)
- [jquery.base64.js 支持中文改造 - 我的笔记 - CSDN 博客](https://blog.csdn.net/qmdweb/article/details/80893456)

### jquery-base64 编码

```c#
if (!window.btoa) window.btoa = $.base64.btoa;
if (!window.atob) window.atob = $.base64.atob;

// Windows Google Chrome 测试有效
layui.$.base64.btoa("你好");

// 错误用法:乱码
layui.$.base64.atob(b);
```

### jquery-base64 解码

```c#
layui.$.base64.btoa("你好");
```

### jquery-base64 官方用法

- 官方

```c#
var dec = $("#decode"),
  enc = $("#encode");
$.base64.utf8encode = true;

dec.val($.base64.btoa(this.value));
enc.val($.base64.atob(this.value, true));
```

### jquery-base64 我改造的支持 Layui 用法

- 改造
- 先决条件:

```c#
jQuery = layui.$;
```

```c#
layui.$.base64("encode", "你好,我需要编码", true);
layui.$.base64("decode", "5L2g5aW9LOaIkemcgOimgee8lueggQ==", true);

tmpvalues.json_sconf_Seritexts = tmpvalues.json_sconf_Seritexts.replace(
  new RegExp("\\+", "g"),
  "%2B"
);
```

- 改造后 C#其它用法

```c#
var a = Convert.FromBase64String("5L2g5aW9LOaIkemcgOimgee8lueggQ==");
var b= Encoding.UTF8.GetString(a);
```

```c#
jQuery = layui.$;
document.write(
  "<script language=javascript src='/static/base64/jquery.base64.js'></script>"
);

$.base64.atob(<value>, true);
$.base64('atob', <value>, true);

var dec = layui.$("#decode"),
  enc = layui.$("#encode");
layui.$.base64.utf8encode = true;

dec.val(layui.$.base64.btoa(this.value));
enc.val(layui.$.base64.atob(this.value, true));




```

### js 适应 post 方法

```c#
function base64beforeEncode(a) {
  var basestr = "";
  basestr = layui.$.base64("encode", a, true);
  basestr = basestr.replace(new RegExp("\\+", "g"), "%2B");
  return basestr;
}
```
