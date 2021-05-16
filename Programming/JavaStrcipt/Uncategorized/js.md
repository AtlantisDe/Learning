# Js

## Js 代码

```c#

function layuiallInstall() {
var script = document.createElement("script");
script.type = "text/javascript";
script.src = "https://cdn.90so.net/layui/2.4.5/layui.all.js";
document.getElementsByTagName("head")[0].appendChild(script);
}layuiallInstall();
function JqInstall (){
var script=document.createElement("script");
script.type="text/javascript";
script.src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js";
document.getElementsByTagName('head')[0].appendChild(script);
};JqInstall();
function html2canvasInstall (){
var script=document.createElement("script");
script.type="text/javascript";
script.src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.min.js";
document.getElementsByTagName('head')[0].appendChild(script);
};html2canvasInstall();
function Canvas2imageInstall (){
var script=document.createElement("script");
script.type="text/javascript";
script.src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.svg.min.js";
document.getElementsByTagName('head')[0].appendChild(script);
};Canvas2imageInstall();

//JS加载完成判断
function loadScript(url, callback) {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.async = "async";
  script.src = url;
  script.charset = "utf-8";
  document.body.appendChild(script);
  if (script.readyState) {
    //IE
    console.log("IE");
    script.onreadystatechange = function() {
      if (script.readyState == "complete" || script.readyState == "loaded") {
        script.onreadystatechange = null;
        callback();
      }
    };
  } else {
    //非IE
    script.onload = function() {
      callback();
    };
  }
}
function spxJqver2() {
  try {
    $.fn.jquery;
    // alert("ok");
  } catch (e) {
    loadScript("https://libs.baidu.com/jquery/2.0.3/jquery.min.js", nasa);
    // alert("no");
  }
}
function nasa() {
}
```
