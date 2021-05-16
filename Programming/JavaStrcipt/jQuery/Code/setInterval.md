# setInterval

- Jquery 延迟函数
- [Jquery 延迟函数 - 浪客是剑心 - 博客园](https://www.cnblogs.com/simonjinx/p/3800595.html)
- [JS 实现几秒后跳转 | 菜鸟工具](https://c.runoob.com/codedemo/5448)

```c#
定义和用法
setInterval() 方法可按照指定的周期（以毫秒计）来调用函数或计算表达式。
setInterval() 方法会不停地调用函数，直到 clearInterval() 被调用或窗口被关闭。由 setInterval() 返回的 ID 值可用作 clearInterval() 方法的参数。
提示： 1000 毫秒= 1 秒。
提示： 如果你只想执行一次可以使用 setTimeout() 方法。
```

## Wiki

- [Window setInterval() 方法 | 菜鸟教程](http://www.runoob.com/jsref/met-win-setinterval.html)

## 每三秒（3000 毫秒）弹出 "Hello"

```c#
setInterval(function() {
  alert("Hello");
}, 3000);
```

```c#
setInterval('alert("Hello");', 3000);
```

## 3 秒（3000 毫秒）后弹出 "Hello"

## 如果你只想执行一次可以使用 setTimeout() 方法

```c#
setTimeout(function() {
  alert("Hello");
}, 3000);
```

## 语法

```c#
setInterval(function() {}, [time]);
```

## 常用 JQ 延迟代码

```c#
setInterval(function() {}, [time]);
```

## 定时执行和延迟执行

- [jQuery 的定时执行和延迟执行 - big2cat - 博客园](http://www.cnblogs.com/big2cat/p/9849515.html)

```c#
setInterval(function() {}, [time]);
```

## 1. console 定时刷新页面，且不会因刷新页面导致 js 失效

- [console 定时刷新页面，且不会因刷新页面导致 js 失效\_Jiangdoc-CSDN 博客](https://blog.csdn.net/jiang18238032891/article/details/103917553)
- [刷新页面后，让控制台的 js 代码继续执行\_ainu2919 的博客-CSDN 博客](https://blog.csdn.net/ainu2919/article/details/102037343?utm_medium=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.control&dist_request_id=&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.control)

```c#
timeout=prompt("Set timeout (Second):");
count=0
current=location.href;
if(timeout>0)
setTimeout('reload()',1000*timeout);
else
location.replace(current);
function reload(){
setTimeout('reload()',1000*timeout);
count++;
console.log('每（'+timeout+'）秒自动刷新,刷新次数：'+count);
fr4me='<frameset cols=\'*\'>\n<frame src=\''+current+'\'/>';
fr4me+='</frameset>';
with(document){write(fr4me);void(close())};
}


// 简单操作实例
timeout=prompt("Set timeout (Second):");
count=0
current=location.href;
if(timeout>0)
setTimeout('reload()',1000*timeout);
else
location.replace(current);
function reload(){
setTimeout('reload()',1000*timeout);
count++;
console.log('每（'+timeout+'）秒自动刷新,刷新次数：'+count);
fr4me='<frameset cols=\'*\'>\n<frame src=\''+current+'\'/>';
fr4me+='</frameset>';
with(document){write(fr4me);void(close())};

    setTimeout(function () {
      
      try {
          (this.frames[0].document.querySelector("#vote > div > div > div")).click();
          } catch (e) {
            console.log(e.message); //sojson is undefined
          }


    }, 3000);

}




```
