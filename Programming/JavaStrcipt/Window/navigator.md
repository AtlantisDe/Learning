# navigator

- [JavaScript Window Navigator](https://www.w3school.com.cn/js/js_window_navigator.asp)

```c#
document.getElementById("demo").innerHTML = navigator.userAgent;

<script>
  if (navigator.userAgent.toLocaleLowerCase().indexOf("baidu") == -1){" "}
  {(document.title = "百度")}
</script>;

// platform 属性返回浏览器平台（操作系统）：
navigator.platform;
```
