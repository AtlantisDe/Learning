# ajax

## official

### wiki url

- [jQuery.ajax() | jQuery API Documentation](http://api.jquery.com/jquery.ajax/)

### search url

- [一个简单的 ajax 获取 json 的例子](https://www.cnblogs.com/liangxiaoli/p/7183607.html)

### Shorthand Methods

- [Shorthand Methods | jQuery API Documentation](https://api.jquery.com/category/ajax/shorthand-methods/)
- [jQuery.post() | jQuery API Documentation](https://api.jquery.com/jQuery.post/)

```text
jQuery.getJSON()
jQuery.get()
jQuery.getScript()
jQuery.post()
.load()
```

## ajax 经常遇到的问题与解决方案

### Wiki

- [JQ-AJAX 执行成功不执行 success 方法解决 - wang704987562 的博客 - CSDN 博客](https://blog.csdn.net/wang704987562/article/details/82559467)
- [ajax()不执行 success 也不执行 error 的分析和解决 - qq_42118231 的博客 - CSDN 博客](https://blog.csdn.net/qq_42118231/article/details/82851167)
- [jquery ajax 后台响应成功，返回正确 json 但不执行 success 方法，执行 error 的问题](https://www.cnblogs.com/lijinwen/p/6066842.html)
- [ajax 中 dataType="json"，执行后却进入 error 函数中，无法解析 json - zwk199024 的专栏 - CSDN 博客](https://blog.csdn.net/zwk199024/article/details/53032621)

### 解决方案

```shell
# 解决方案：
# 1、服务端设置response.setContentType("application/json;charset=utf-8")；
# 2、或者页面端ajax设置dataType为“json”，指定服务器返回的数据类型。

# jquery 1.4以后对json格式变严格了,也就是说必须要这种格式的{"键":"值","键":"值"};像原来的{键:值，键:值}和{'键':'值','键':'值'}这种都是错误的，不合标准，所以jquery返回error。

# 我的问题是 发送的 POST数据包导致这个报错,不走success 走error 不知道为什么
```

## ajax 常用

### 代码示例 1

```js
$.ajax({
  type: "get",
  url: "http://localhost:8080/test/ok",
  //期望服务端返回的数据类型
  dataType: "json",
  success: function(data) {
    console.log("success");
  },
  error: function(e) {
    console.log("error");
  }
});

function myFunction() {
  alert("Hello World!");
}

$.ajax({
  url: "test.html",
  context: document.body,
  success: function() {
    $(this).addClass("done");
  }
});

$.ajax({
  type: "POST",
  url: "../../demo",
  dataType: "json",
  data: {
    txtname: txtname,
    txttel: txttel,
    txtOrderDepartment: txtOrderDepartment,
    txtOrderTime: txtOrderTime,
    txtOrderDescription: txtOrderDescription
  },
  success: function(data) {
    if (data.status == 1) {
      alert(data.msg);
    } else {
      alert(data.msg);
    }
  }
});

$.ajax({
  type: "POST",
  url: ctxRoot + "FolderAction!saveInformSetting.action",
  data: "jsonStr=" + inform_settingListStr,
  dataType: "json",
  complete: function(data) {
    //在这里做些事情，假设返回的json数据里有name这个属性
    //有时候可以直接data.name或者data['name']去访问
    //但有时候，却要通过var jsonData = eval("("+data.responseText+")");才可以通过jsonData.name访问，而且这种情况下，需要是complete而不是success
  }
});

// $.ajax(options)

// 语法如下：

// $.ajax({options});
// url：(string)发送请求的地址，可以是服务器页面也可以是WebService动作。
// type：(string)请求方式，POST或GET
// data：(object)向服务器发送请求时带去的数据。是key:value对形式，如：{name:"grayworm",sex:"male"}，如果是数组{works:["work1","work2"]}
// dataType：(string)预期返回的数据类型。xml,html,json,text等
// beforeSend：（Function）发送ajax请求前被触发，如果返回false则取消本次请求。如果异步请求需要显示gif动画，那应当在这里设置相应<img>的可见。
```

### ajax 文档类型

```js
context: document.body,
dataType: "json"
dataType : "jsonp",
dataType: "text",
cache: false,//缓存true/false
async:false,//默认是true：异步        false：同步。
```

### ajax POST

```js
data:  "username="+username+"&password="+password,
data: "JSON=" + JSON.stringify(json),
data:  'username='+username+'&password='+password,
data: 'JSON=' + JSON.stringify(json),
```

### ajax Data

```js
var json = {
  path: path,
  id: 0
};
```

### 用户定义的 callback 函数

```js
$.ajax({
  async: false,
  url: "",
  type: "post",
  dataType: "jsonp",
  jsonp: "callbackparam",
  jsonpClaaback: "success_jsonpCallback", //用户定义的callback函数，没有定义的话会jQuery会自动生成以jQuery开头的函数
  data: {},
  error: function(XMLHttpReuqest, textStautus, errothrown) {
    console.log(XMLHttpRequest.status);
    console.log(XMLHttpReuqest.readyState);
    console.log(XMLHttpRequest.responseText);
    console.log(textStautus);
    console.log(errothrown);
  },
  success: function(json) {
    alert(json);
  }
});
```

### ajax layui async: true 同步请求

```js
function RefreshCdnUrlphp(obj) {
  layer.load();
  logincheck();

  layui.$.ajax({
    type: "POST",
    url: "/demoui.php",
    dataType: "Json",
    data: "url=" + obj.data.url,
    cache: false,
    async: true,
    success: function(data) {
      if (data.codeDesc == "Success") {
        layer.alert(
          "提交成功!正常5分钟内生效!请勿频繁提交,修改一次,提交一次即可",
          { icon: 6 }
        );
      } else {
        layer.alert(data.message, { icon: 6 });
      }
      //{"code":0,"message":"","codeDesc":"Success","data":{"count":1,"task_id":"1557144469900757406"}}
    },
    complete: function(data) {
      layer.closeAll("loading");
      console.log("close");
    }
  });
}
```
