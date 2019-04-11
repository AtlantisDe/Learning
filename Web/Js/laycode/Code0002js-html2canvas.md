# html2canvas

- [html2canvas](http://html2canvas.hertzen.com/)
- [html5 中的SVG 和canvas](https://www.cnblogs.com/autumn123/p/4389004.html)
- [js实现截图并保存图片（html转canvas、canvas转image](https://blog.csdn.net/caomage/article/details/81168201)
- [html2canvas截图如何解决跨域的问题？](https://ask.csdn.net/questions/220186)

## html2canvas Screenshots with JavaScript

```js
<div id="capture" style="padding: 10px; background: #f5da55">
    <h4 style="color: #000; ">Hello world!</h4>
</div>
html2canvas(document.querySelector("#capture")).then(canvas => {
    document.body.appendChild(canvas)
});

```

## html2canvas 代码

```js
html2canvas($(".mlogin").get(0)).then(function (canvas) {
var img = Canvas2Image.convertToImage(canvas, canvasWidth, canvasHeight);
$(".mlogin").after(img);
});

html2canvas(document.querySelector("#TPL_password_1")).then(canvas => {
    document.body.appendChild(canvas)
});

html2canvas(document.querySelector("#TPL_password_1")).then(canvas => {
alert (canvas);
});

html2canvas(document.querySelector("#TPL_password_1")).then(canvas => {
var canvasWidth = canvas.width;
var canvasHeight = canvas.height;
Canvas2Image.convertToImage(canvas, canvasWidth, canvasHeight);
});

/**
 * 截图
 */
function doScreenShot(){
    html2canvas(document.body, {
        onrendered: function(canvas) {
            canvas.id = "mycanvas";
            var image =canvas.toDataURL("image/png").replace("image/png","image/octet-stream");
            window.location.href=image; // it will save locally
        }
    });
}

```
