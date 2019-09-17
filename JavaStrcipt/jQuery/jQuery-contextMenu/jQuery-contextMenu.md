# jQuery-contextMenu

- [swisnl/jQuery-contextMenu](https://github.com/swisnl/jQuery-contextMenu)
- [jQuery contextMenu (2.x)](https://swisnl.github.io/jQuery-contextMenu/demo.html#example-html-simple-context-menu)
- [jQuery 右键菜单插件 contextMenu 详细使用说明](https://www.itcto.cn/js/contextMenu/)
- [jQuery - 右键菜单插件 contextMenu 使用详解 3（菜单触发方式、菜单事件）](https://www.hangge.com/blog/cache/detail_1831.html)
- [Font Awesome](https://fontawesome.com/download)

## Demo

### 1. Contextmenu plugin & polyfill

- [jQuery contextMenu (2.x)](https://swisnl.github.io/jQuery-contextMenu/)

```js
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>
```

### 2. Demo: Left-Click Trigger

- [jQuery contextMenu (2.x)](https://swisnl.github.io/jQuery-contextMenu/demo/trigger-left-click.html)

```js
```

### 3. trigger

- [jQuery contextMenu (2.x)](https://swisnl.github.io/jQuery-contextMenu/docs.html#trigger)

```js
trigger: 'left',
trigger: 'right',
trigger: 'hover',
trigger: 'touchstart',
trigger: 'none',
```

### 4. FontAwesome icons 自定义按钮图标

```js
// 图标可以使用FontAwesome图标库，只需要引入样式文件font-awesome.min.css，然后在官网上选择图标。FontAwesome官网
- 要点:fa-图标
- [301 Moved Permanently](http://fontawesome.io/icons/)
- [FortAwesome/Font-Awesome](https://github.com/FortAwesome/Font-Awesome)

<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" />

$(document).ready(function() {
  $.contextMenu({
    selector: '#test', //右键选择器
    callback: function(key, options) {//点击回调处理
      var m = "clicked: " + key;
      window.console && console.log(m) || alert(m);
    },
    items: {//菜单列表配置
      "download": {name: "下载", icon: "fa-download"},
      "fa-lock": {name: "lock", icon: "fa-lock"}
    }
  });
});


```

```js
// 图标自定义函数返回
"quit": {
            name: "10. 关闭菜单",
            icon: function () {
                return 'context-menu-icon context-menu-icon-quit';
            }
        }
```

### 5. Keeping the Menu visible

- [jQuery contextMenu (2.x)](https://swisnl.github.io/jQuery-contextMenu/demo/keeping-contextmenu-open.html)

```js
$(function() {
  $.contextMenu({
    selector: ".context-menu-one",
    callback: function(key, options) {
      var m = "clicked: " + key;
      (window.console && console.log(m)) || alert(m);
    },
    items: {
      edit: {
        name: "Closing on Click",
        icon: "edit",
        callback: function() {
          return true;
        }
      },
      cut: {
        name: "Open after Click",
        icon: "cut",
        callback: function() {
          return false;
        }
      }
    }
  });
});
```
