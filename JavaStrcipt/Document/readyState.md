# readyState

- [document.readyState](https://developer.mozilla.org/zh-CN/docs/Web/API/Document/readyState)
- [判断 JS 是否加载完成 - xixi_xixi - 博客园](https://www.cnblogs.com/telnetzhang/p/5827791.html)

## readyState-值

```shell
loading / 加载 document 仍在加载。
interactive / 互动 文档已经完成加载，文档已被解析，但是诸如图像，样式表和框架之类的子资源仍在加载。
complete / 完成 文档和所有子资源已完成加载。状态表示 load 事件即将被触发。这个属性的值变化时，document 对象上的readystatechange 事件将被触发。
我们使用document的readyState属性：document.readyState
readyState 属性返回当前文档的状态。
该属性返回以下值:
uninitialized - 还未开始载入
loading - 载入中
interactive - 已加载，文档与用户可以开始交互
complete - 载入完成  (loaded)
```

## 语法

```shell
let string = document.readyState;
// "complete"
```

## 原生 JS

```shell
function loadScript(url,callback){
　　var script=document.createElement('script');
　　　　script.type='text/javascript';
　　　　script.async='async';
　　　　script.src=url;
　　　　document.body.appendChild(script);
　　　　if(script.readyState){   //IE
　　　　　　script.onreadystatechange=function(){
　　　　　　　　if(script.readyState=='complete'||script.readyState=='loaded'){
　　　　　　　　　　script.onreadystatechange=null;
　　　　　　　　　　callback();
　　　　　　　　}
　　　　　　}
　　　　}else{    //非IE
　　　　　　script.onload=function(){callback();}
　　　　}
}
```

## Jquery：使用 $.holdReady(true);  $.getScript(); \$.holdReady(false) 3 个函数实现

```js
// Jquery：使用 3个函数实现
$.holdReady(true);
$.getScript();
$.holdReady(false);
// $.holdReady()函数表示 延迟加载。
```
