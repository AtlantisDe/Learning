# ajax

- [一个简单的 ajax 获取 json 的例子](https://www.cnblogs.com/liangxiaoli/p/7183607.html)

```js
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

## ajax 文档类型

```js
context: document.body,
dataType: "json"
dataType : "jsonp",
dataType: "text",
cache: false,//缓存true/false
async:false,//默认是true：异步        false：同步。
```

## ajax POST

```js
data:  'username='+username+'&password='+password,
data: 'JSON=' + JSON.stringify(json),
```

## ajax Data

```js
var json = {
  path: path,
  id: 0
};
```

## ajax layui async: true

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
