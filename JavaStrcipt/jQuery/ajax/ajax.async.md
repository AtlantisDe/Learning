# async

- [Ajax 请求中 async 属性](https://blog.csdn.net/weixin_40877388/article/details/80483258)
- [jquery ajax 属性 async(同步异步)示例 - 浅苍蓝 - 博客园](https://www.cnblogs.com/ldyblogs/p/ajax.html)

```c#
$.ajax({
 async: false,
  type : "post",
  url : "haha",
  datatype : 'json'，
  success : function(data) {

  }
});
alert("执行");

// 当async属性的值为false时是同步的，Ajax请求将整个浏览器锁死，只有ajax请求返回结果后，才执行ajax后面的alert语句。

// 当async属性的值为true时是异步的，即不会等待ajax请求返回的结果，会直接执行ajax后面的alert语句。
```
