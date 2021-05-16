# onclick

- [JS 事件添加 onclick 写法注意。 - enmeen - 博客园](https://www.cnblogs.com/enmeen/p/5185588.html)

## 1. JS 事件添加 onclick 写法注意

```c#
// 自定义函数添加onclick事件写法注意。

错误写法：element.onclick = addclass(className);

正确写法：element.onclick = function(){ addclass(className); }

document.querySelector("#api_btn_action").onclick=function(){ alert('Hello'); }
```

## 2. JS 监控页面所有的 onclick

- [js 监控页面所有的 onclick 方法](https://blog.csdn.net/rj0511/article/details/84002528)

```c#





document.ontouchstart = onClick;
document.ontouchend = onClick;
document.onscroll = onClick;
document.onclick = onClick;//当用户在文档中点击是调用onClick function（）
function onClick(ev){
ev = ev || window.event; // 事件
var target = ev.target || ev.srcElement; // 获得事件源
if(target.getAttribute('id') != "update_button" && target.getAttribute('id') != "wait_button"){
hiddenlayout();
}
}
// 监控页面的onclick方法


// 利用window.history.length==1可以判断用户浏览器中历史记录...
// 在特定条件下可使用:如:
// Android手机端,嵌套浏览器,...
// AppStore升级提示:用户第一次进入页
```

## 3. 监控双击事件

```c#
var targetObj = null;

function ondblclick(ev) {
  try {
    ev = ev || window.event; // 事件
    var target = ev.target || ev.srcElement; // 获得事件源
    targetObj = ev.srcElement;
    // console.log(ev);
    console.log(target.nodeName);

    if (target.nodeName == "TEXTAREA" || target.nodeName == "INPUT") {
      console.log(target.nodeName);
    }
  } catch (e) {
    console.log(e.message); //sojson is undefined
  }
}

document.ondblclick = ondblclick;

```
