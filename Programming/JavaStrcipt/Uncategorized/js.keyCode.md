# keyCode

- [KeyboardEvent keyCode Property](https://www.w3schools.com/jsref/event_key_keycode.asp)
- [使用 JS 监听键盘两个组合键触发的事件 JavaScript_qiyun5656](https://blog.csdn.net/qiyun5656/article/details/52230573)
- [功能 电脑软件教程  系统粉](http://www.win7999.com/jiaocheng/375471448.html)
- [Uncaught ReferenceError: ActiveXObject is not defined Error in Chrome](https://stackoverflow.com/questions/17927038/uncaught-referenceerror-activexobject-is-not-defined-error-in-chrome)
- [How to take keyboard input in JavaScript?](https://stackoverflow.com/questions/4416505/how-to-take-keyboard-input-in-javascript)
- [Getting Title at 14:13](https://stackoverflow.com/questions/4158847/how-to-simulate-key-presses-or-a-click-with-javascript/4176116#4176116)
- [How to send a key to an input text field using Javascript?](https://stackoverflow.com/questions/7062367/how-to-send-a-key-to-an-input-text-field-using-javascript)

## 常用

```c#
document.addEventListener('keydown', function(event) {
    if(event.keyCode == 37) {
        alert('Left was pressed');
    }
    else if(event.keyCode == 39) {
        alert('Right was pressed');
    }
});
```
