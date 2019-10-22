# 网页自动进入对应 PC 还是手机

## 代码

### 1. 代码 1

```js
<script>
        // PC端 移动端 跳转
        var is_mobi = navigator.userAgent.toLowerCase().match(
            /(ipod|iphone|android|coolpad|mmp|smartphone|midp|wap|xoom|symbian|j2me|blackberry|wince)/i) != null;
        if (is_mobi) {
            window.location.href = "mobile.html";
        } else {
            // window.location.href="index.html"
        }
</script>
```

### 2. 代码 2 有 BUG

```js
  <script>

    var h = document.documentElement.clientHeight || document.body.clientHeight;
    var w = document.documentElement.clientWidth || document.body.clientWidth;
    // 进入PC版
    if(w > 600){ window.location.href="./index.html"; }

    // 处理背景视频兼容

    window.onresize = function(){
    var h = document.documentElement.clientHeight || document.body.clientHeight;
    var w = document.documentElement.clientWidth || document.body.clientWidth;
    if(w > 600){
        // 进入PC版
    window.location.href="./index.html";
    }else{
        // 进入手机版
    window.location.href="./mobile.html";
    }

    }

  </script>
```
