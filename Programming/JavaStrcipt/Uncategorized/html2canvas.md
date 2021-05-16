# html2canvas

- [html2canvas](http://html2canvas.hertzen.com/)
- [html5 中的 SVG 和 canvas](https://www.cnblogs.com/autumn123/p/4389004.html)
- [js 实现截图并保存图片（html 转 canvas、canvas 转 image](https://blog.csdn.net/caomage/article/details/81168201)
- [html2canvas 截图如何解决跨域的问题？](https://ask.csdn.net/questions/220186)
- [niklasvh/html2canvas](https://github.com/niklasvh/html2canvas/blob/master/docs/configuration.md)

## 0. 安装

```c#

```

## 1. html2canvas Screenshots with JavaScript

```c#
<div id="capture" style="padding: 10px; background: #f5da55">
    <h4 style="color: #000; ">Hello world!</h4>
</div>
html2canvas(document.querySelector("#capture")).then(canvas => {
    document.body.appendChild(canvas)
});

```

## 2. html2canvas 代码

```c#
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


/** 把Html元素转为图片*/
function Funhtml2image(source, image) {
    html2canvas(source).then(canvas => {
        var imageData = canvas.toDataURL("image/png");
        image.src = imageData;
        // document.body.appendChild(canvas);
        //sessionStorage.setItem('imageSrc', imageData);
    });
}

/** 把Html元素转为图片*/
html2canvas($('#div'), {
  onrendered: function(canvas) {
    var img = canvas.toDataURL()
    window.open(img);
  }
});



/** window.open对我不起作用...仅呈现了一个空白页面...但是我能够通过替换作为目标创建的预先存在的img元素的src属性来使png出现在页面上。*/
function FunElement_to_png(source, image) {
    html2canvas(source).then(function (canvas) {
        var myImage = canvas.toDataURL("image/png");
        $(image).attr("src", myImage);
        console.log("html2canvas completed.");
    });
}


```
