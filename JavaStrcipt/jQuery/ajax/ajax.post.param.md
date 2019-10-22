# ajax post 参数变化情况

## 例子讲解

### 1. 参数与方法变化

```c#
function fun_subSiteconfigSet() {
  layer.load();

  layui.$.ajax({
    type: "POST",
    url: "http://" + host + "/api/demo/set",
    dataType: "json",
    data: "Token=" + localStorage.getItem("Token"),
    cache: false,
    async: true,
    success: function(data) {
      layer.closeAll("loading");
      if (data.code == 200) {

        layer.msg(data.message, function() {});
      } else {
        layer.alert(data.message, { icon: 6 });
      }
    }
  });
}

```

```c#
// 第一种:data 参数字符拼接的时候 Request Method: POST
data: "Token=" + localStorage.getItem("Token")

// 第二种:data 参数字符拼接的时候 Request Method: POST
data: "Token=" + localStorage.getItem("Token")


```
