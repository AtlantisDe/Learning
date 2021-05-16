# Simulating a mouse click

- [How to simulate key presses or a click with JavaScript?](https://stackoverflow.com/questions/4158847/how-to-simulate-key-presses-or-a-click-with-javascript)

## 常用

- [ie 浏览器中 dispatchEvent 报错*JavaScript*全盛-CSDN 博客](https://blog.csdn.net/weixin_40803257/article/details/89473976)

```c#
// DOM 2 Events
var dispatchMouseEvent = function(target, var_args) {
  var e = document.createEvent("MouseEvents");
  // If you need clientX, clientY, etc., you can call
  // initMouseEvent instead of initEvent
  e.initEvent.apply(e, Array.prototype.slice.call(arguments, 1));
  target.dispatchEvent(e);
};
dispatchMouseEvent(element, 'mouseover', true, true);
dispatchMouseEvent(element, 'mousedown', true, true);
dispatchMouseEvent(element, 'click', true, true);
dispatchMouseEvent(element, 'mouseup', true, true);


//Test

var dispatchMouseEvent = function(target, var_args) {
  var e = document.createEvent("MouseEvents");
  e.initEvent.apply(e, Array.prototype.slice.call(arguments, 1));
  target.dispatchEvent(e);
};

function yesgo(element) {
  dispatchMouseEvent(element, "mouseover", true, true);
  dispatchMouseEvent(element, "mousedown", true, true);
  dispatchMouseEvent(element, "click", true, true);
  dispatchMouseEvent(element, "mouseup", true, true);
}

function yesgo(element) {
  if (element) {
    dispatchMouseEvent(element, "mouseover", true, true);
    dispatchMouseEvent(element, "mousedown", true, true);
    dispatchMouseEvent(element, "click", true, true);
    dispatchMouseEvent(element, "mouseup", true, true);
  }
}


setTimeout(function() {
  var element = document.querySelector(
    "#span > span"
  );
  yesgo(element);

  setTimeout(function() {
    document.querySelector("li.semi-dropdown-item").click();
    setTimeout(function() {
      document.querySelectorAll("div.semi-tabs-tab")[1].click();
    }, 1000);
  }, 1000);
}, 2000);

```
