# jQuery.post

- [jQuery.post() | jQuery API Documentation](https://api.jquery.com/jQuery.post/)

## 常用

```c#
layui.$.post("/api/WebConfigSave", webConfig, function (responseJSON) {
  console.log("success");
}).fail(function () {
  console.log("error");
});

// 发送样本 组装成一个实体对象
{ "GuidsText": "123" }
{ "GuidsText": GuidsText }
{ "SiteGuid": GetQueryString("guid"), "WebConfigText": JSON.stringify(webConfig) }
```
