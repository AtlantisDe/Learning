# WinHttp.WinHttpRequest.5.1

- [Getting Title at 55:44](https://blog.csdn.net/huaieli1/article/details/78409124)

```c#
var url = "http://www.yourtarget.com";

var param = "name=david&age=30";

var obj = new ActiveXObject("WinHttp.WinHttpRequest.5.1");

obj.Open("POST", url, false);

obj.Option(4) = 13056;

obj.Option(6) = false; //false可以不自动跳转，截取服务端返回的302状态。

obj.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

obj.setRequestHeader("Referer", "http://www.baidu.com");

obj.Send(param);

WScript.Echo(obj.responseText);
```
