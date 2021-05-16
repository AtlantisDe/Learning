# jQuery-contextMenu

- [swisnl/jQuery-contextMenu](https://github.com/swisnl/jQuery-contextMenu)
- [jQuery contextMenu (2.x)](https://swisnl.github.io/jQuery-contextMenu/demo.html#example-html-simple-context-menu)
- [jQuery 右键菜单插件 contextMenu 详细使用说明](https://www.itcto.cn/js/contextMenu/)
- [jQuery - 右键菜单插件 contextMenu 使用详解 3（菜单触发方式、菜单事件）](https://www.hangge.com/blog/cache/detail_1831.html)
- [Font Awesome](https://fontawesome.com/download)

## 0. 安装与使用(Usage)

- [支持 FontAwesome icons 图标](https://swisnl.github.io/jQuery-contextMenu/demo/fontawesome-icons.html)

```c#
jQuery >=1.8.2
jQuery UI position (optional but recommended)

jQuery contextMenu v2.9.2

$.contextMenu.menus

// 常用于执行单击左键操作
/**弹出菜单 */
function FunContextMenuSiteBatchOperation() {
    $("button[contextMenu='C_SiteBatchOperation']").contextMenu();
}


$.contextMenu({
    // define which elements trigger this menu
    selector: ".with-cool-menu",
    // define the elements of the menu
    items: {
        foo: {name: "Foo", callback: function(key, opt){ alert("Foo!"); }},
        bar: {name: "Bar", callback: function(key, opt){ alert("Bar!") }}
    }
    // there's more, have a look at the demos and docs...
});

// 特别注意 如果使用FA图标注意看官方最新版本样式使用说明即可现在最新版为:
// 示例
// fas fa-跟着名称
// 可以到官方筛选免费版本的图片名称
<i class="fas fa-check-circle"></i>
<i class="fas fa-camera"></i>
fas fa-camera
```

## 1. Demo[官方 Demo]

- [Demo: Simple Context Menu](http://swisnl.github.io/jQuery-contextMenu/demo.html)

### 1. Contextmenu plugin & polyfill

- [jQuery contextMenu (2.x)](https://swisnl.github.io/jQuery-contextMenu/)

```c#
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>
```

### 2. Demo: Left-Click Trigger

- [jQuery contextMenu (2.x)](https://swisnl.github.io/jQuery-contextMenu/demo/trigger-left-click.html)

```c#

```

### 3. trigger

- [jQuery contextMenu (2.x)](https://swisnl.github.io/jQuery-contextMenu/docs.html#trigger)

```c#
trigger: 'left',
trigger: 'right',
trigger: 'hover',
trigger: 'touchstart',
trigger: 'none',
```

### 4. FontAwesome icons 自定义按钮图标

```c#
// 图标可以使用FontAwesome图标库，只需要引入样式文件font-awesome.min.css，然后在官网上选择图标。FontAwesome官网

// 要点:fa-图标 (FontAwesome)

- [Font Awesome](https://fontawesome.com/icons?d=gallery)
- [FortAwesome/Font-Awesome](https://github.com/FortAwesome/Font-Awesome)

// 各路节点CDN
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" />

<link rel="stylesheet" href="https://libs.baidu.com/fontawesome/4.0.3/css/font-awesome.css" />


// 本地
<link rel="stylesheet" href="/Static/font-awesome/5.14.0/css/fontawesome.min.css" />
<link rel="stylesheet" href="/Static/font-awesome/5.14.0/css/all.min.css" />


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

```c#
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

```c#
$(function () {
  $.contextMenu({
    selector: ".context-menu-one",
    callback: function (key, options) {
      var m = "clicked: " + key;
      (window.console && console.log(m)) || alert(m);
    },
    items: {
      edit: {
        name: "Closing on Click",
        icon: "edit",
        callback: function () {
          return true;
        },
      },
      cut: {
        name: "Open after Click",
        icon: "cut",
        callback: function () {
          return false;
        },
      },
    },
  });
});
```

### 6. LayUI 表格行 应用[更多] 需要 FontAwesome icons 支持

```c#
// RowbarSites
<script type="text/html" id="RowbarSites">
    <a class="layui-btn layui-btn-xs  layui-btn-normal" lay-event="" onclick="FunSubSiteConfigAction('{{d.Guid}}','{{d.Nodes.Hostitem.Name}}');">站点配置</a>
    <a class="layui-btn layui-btn-xs" lay-event="siteitem_contextMenu_a" contextMenu="C_SiteControl">更多</a>
</script>

// ContextMenu.Site.js
$(document).ready(function() {
  $.contextMenu({
    selector: "a[contextMenu='C_SiteControl']", //右键选择器
    zIndex: 892,
    trigger: "left",
    // delay: 600,
    // autoHide: true,
    callback: function(key, options) {
      //点击回调处理
      switch (key) {
        case "SiteMange":
          open_C_SiteControl(tmpvalues.HostsiteItem.Host);
          break;
        case "SiteConfig":
          open_SiteConfigitem("hosteditsave", tmpvalues.HostsiteItem.Host);

          break;
        case "SiteXiongzhangConfig":
          open_siteitem_HostBaiduUrlsPushConfig(tmpvalues.HostsiteItem.Host);
          break;

        case "SiteLinkConfig":
          open_siteitem_HostLinks(tmpvalues.HostsiteItem.Host);
          break;
        case "SiteItems":
          open_C_SiteControl(tmpvalues.HostsiteItem.Host);
          break;
        case "FunOpenJs1":
          open_FunOpenJs1(tmpvalues.HostsiteItem.Host);
          break;
        case "FunHostRobotsTxt":
          open_FunHostRobotsTxt(tmpvalues.HostsiteItem.Host);
          break;
        case "FunHostBinding":
          open_FunHostBinding(tmpvalues.HostsiteItem.Host);
          break;
      }
      },

    items: {
      //菜单列表配置
      SiteMange: {
        name: "1. 控制台 (弃用保留)",
        icon: "fa-windows"
      },
      SiteConfig: {
        name: "2. 站点配置 (弃用保留)",
        icon: "fa-futbol-o"
      },
      sep1: "---------",
      SiteXiongzhangConfig: {
        name: "3. 熊掌号配置 (弃用保留)",
        icon: "fa-user-circle"
      },
      SiteLinkConfig: {
        name: "4. 友情链接",
        icon: "fa-link"
      },
      sep2: "---------",
      SiteItems: {
        name: "5. 网站JS.API扩展(接口)",
        icon: "fa-jsfiddle"
      },
      FunOpenJs1: {
        name: "6. 打开 | 流量劫持 | 第三方JS统计 | 自定义JS脚本",
        icon: "fa-jsfiddle"
      },
      FunHostRobotsTxt: {
        name: "7. Robots.txt [默认配置]",
        icon: "fa-jsfiddle"
      },
      FunHostBinding: {
        name: "8. 域名绑定",
        icon: "fa-jsfiddle"
      },
      sep3: "---------",
      quit: {
        name: "10. 关闭菜单",
        icon: "fa-window-close"
      }
    }
  });
});

```
