# util.fixbar

- [工具集文档 - Layui](https://www.layui.com/doc/modules/util.html)

## 常用

### 0. 常用

```c#
layui.util.fixbar();
```

### 1. bar

<!-- 看到页面右下角的那个包含top的bar了吗？对，就是她。她通常会出现在那个固定位置，由两个可选的bar和一个默认必选的TopBar组成。 -->

```c#
layui.use('util', function(){
  var util = layui.util;

  //执行
  util.fixbar({
    bar1: true
    ,click: function(type){
      console.log(type);
      if(type === 'bar1'){
        alert('点击了bar1')
      }
    }
  });
});
```

### 2. Top

```c#
layui.use("util", function() {
  var util = layui.util;

  //执行
  util.fixbar( );
});

```
