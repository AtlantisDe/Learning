# jQuery.getJSON()

- [Getting Title at 43:28](https://api.jquery.com/jQuery.getJSON/#jQuery-getJSON-url-data-success)

## 常用

### 0. 常用

```c#

// 测试请求
layui.$.getJSON("/api/MAUIStyleItems", function (responseJSON) {
  console.log(responseJSON);
  console.log("success");
}).fail(function () {
  console.log("error");
});


// 跨域请求和dataType：“ jsonp”请求不支持同步操作。请注意，同步请求可能会暂时锁定浏览器，从而在请求处于活动状态时禁用任何操作。

layui.$.getJSON(url, function (responseJSON) {
  console.log("success");
}).fail(function () {
  console.log("error");
});
```

### 1. 官方比较全面的用法

```c#
// Assign handlers immediately after making the request,
// and remember the jqxhr object for this request
var jqxhr = $.getJSON("example.json", function () {
  console.log("success");
})
  .done(function () {
    console.log("second success");
  })
  .fail(function () {
    console.log("error");
  })
  .always(function () {
    console.log("complete");
  });

// Perform other work here ...

// Set another completion function for the request above
jqxhr.always(function () {
  console.log("second complete");
});
```

### 2. 提交数据

```c#
layui.$.getJSON(url, Data, function (responseJSON) {
  console.log("success");
}).fail(function () {
  console.log("error");
});
```
