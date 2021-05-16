# uni-app

- [uni-app 官网](https://uniapp.dcloud.io/README)

```c#
uni-app 是一个使用 Vue.js 开发所有前端应用的框架，开发者编写一套代码，可发布到iOS、Android、Web（响应式）、以及各种小程序（微信/支付宝/百度/头条/QQ/钉钉/淘宝）、快应用等多个平台。
```

## 0. Installation

```c#

```

## 1. 快速上手

```c#

```

### 1. 通过 HBuilderX 可视化界面

```c#
// 创建uni-app
// 运行uni-app
// 发布uni-app
// 打包为原生App
// 发布为H5
// 发布为小程序
```

### 2. 通过 vue-cli 命令行

```c#

```

## 2. serverless

- [uni-app 官网](https://uniapp.dcloud.io/uniCloud/README)

## 3. 目录结构

```c#
一个uni-app工程，默认包含如下目录及文件：
┌─uniCloud              云空间目录，阿里云为uniCloud-aliyun,腾讯云为uniCloud-tcb（详见uniCloud）
│─components            符合vue组件规范的uni-app组件目录
│  └─comp-a.vue         可复用的a组件
├─hybrid                App端存放本地html文件的目录，详见
├─platforms             存放各平台专用页面的目录，详见
├─pages                 业务页面文件存放的目录
│  ├─index
│  │  └─index.vue       index页面
│  └─list
│     └─list.vue        list页面
├─static                存放应用引用的本地静态资源（如图片、视频等）的目录，注意：静态资源只能存放于此
├─uni_modules           存放[uni_module](/uni_modules)规范的插件。
├─wxcomponents          存放小程序组件的目录，详见
├─main.js               Vue初始化入口文件
├─App.vue               应用配置，用来配置App全局样式以及监听 应用生命周期
├─manifest.json         配置应用名称、appid、logo、版本等打包信息，详见
└─pages.json            配置页面路由、导航条、选项卡等页面类信息，详见

```

## 4. 模板内引入静态资源

```c#
// template内引入静态资源，如image、video等标签的src属性时，可以使用相对路径或者绝对路径，形式如下
<!-- 绝对路径，/static指根目录下的static目录，在cli项目中/static指src目录下的static目录 -->
<image class="logo" src="/static/logo.png"></image>
<image class="logo" src="@/static/logo.png"></image>
<!-- 相对路径 -->
<image class="logo" src="../../static/logo.png"></image>


// 注意

// @开头的绝对路径以及相对路径会经过base64转换规则校验
// 引入的静态资源在非h5平台，均不转为base64。
// H5平台，小于4kb的资源会被转换成base64，其余不转。
// 自HBuilderX 2.6.6起template内支持@开头路径引入静态资源，旧版本不支持此方式
// App平台自HBuilderX 2.6.9起template节点中引用静态资源文件时（如：图片），调整查找策略为【基于当前文件的路径搜索】，与其他平台保持一致
// 支付宝小程序组件内 image 标签不可使用相对路径
```

## 5. js 文件引入

```c#
// js文件或script标签内（包括renderjs等）引入js文件时，可以使用相对路径和绝对路径，形式如下
// 绝对路径，@指向项目根目录，在cli项目中@指向src目录
import add from '@/common/add.js'
// 相对路径
import add from '../../common/add.js'

// 注意

// js文件不支持使用/开头的方式引入
```

## 6. css 引入静态资源

```c#
// css文件或style标签内引入css文件时（scss、less文件同理），可以使用相对路径或绝对路径（HBuilderX 2.6.6）

/* 绝对路径 */
@import url('/common/uni.css');
@import url('@/common/uni.css');
/* 相对路径 */
@import url('../../common/uni.css');

// 注意

// 自HBuilderX 2.6.6起支持绝对路径引入静态资源，旧版本不支持此方式
// css文件或style标签内引用的图片路径可以使用相对路径也可以使用绝对路径，需要注意的是，有些小程序端css文件不允许引用本地文件（请看注意事项）

/* 绝对路径 */
background-image: url(/static/logo.png);
background-image: url(@/static/logo.png);
/* 相对路径 */
background-image: url(../../static/logo.png);


// Tips

// 引入字体图标请参考，字体图标
// @开头的绝对路径以及相对路径会经过base64转换规则校验
// 不支持本地图片的平台，小于40kb，一定会转base64。（共四个平台mp-weixin, mp-qq, mp-toutiao, app v2）
// h5平台，小于4kb会转base64，超出4kb时不转。
// 其余平台不会转base64
// 生命周期

```

## 7. 生命周期

```c#
// 应用生命周期
// uni-app 支持 onLaunch、onShow、onHide 等应用生命周期函数，详情请参考应用生命周期
- [应用生命周期](https://uniapp.dcloud.io/collocation/frame/lifecycle?id=%e5%ba%94%e7%94%a8%e7%94%9f%e5%91%bd%e5%91%a8%e6%9c%9f)

// 页面生命周期


```

## 8. 路由

```c#
// uni-app页面路由为框架统一管理，开发者需要在pages.json里配置每个路由页面的路径及页面样式。类似小程序在app.json中配置页面路由一样。所以 uni-app 的路由用法与 Vue Router 不同，如仍希望采用 Vue Router 方式管理路由，可在插件市场搜索 Vue-Router。


// 路由跳转
// uni-app 有两种页面路由跳转方式：使用navigator组件跳转、调用API跳转。


```

## 9. 页面栈

```c#



```

## 10. Vue

```c#



```

### 1. 文件内代码架构

```c#
 <template>
        <view>
        注意必须有一个view，且只能有一个根view。所有内容写在这个view下面。
        </view>
    </template>
    <script>
        export default {
        }
    </script>
    <style>
    </style>
```

### 2. 模板语法 data 属性

- [vue 设置标签 data 值，获取 data 参数 - 文武双全的斌 - 博客园](https://www.cnblogs.com/sunday123/p/11504788.html)
- [uni-app 官网](https://uniapp.dcloud.io/vue-basics?id=data-%e5%b1%9e%e6%80%a7)
- [https://www.bilibili.com/video/BV11Z4y1K7yY?p=7](https://www.bilibili.com/video/BV11Z4y1K7yY?p=7)
- [UNIAPP - 如何初始化 data 数据 - Sunsin - 博客园](https://www.cnblogs.com/cisum/p/13739529.html)
- [uni-app picker 标签应用 date 属性的一些坑 - 韭菜包子敲代码 - 博客园](https://www.cnblogs.com/baoziqiaodaima/p/11531881.html)
- [vue 各种字符串拼接\_w_t_y_y 的博客-CSDN 博客\_vue 字符串拼接](https://blog.csdn.net/w_t_y_y/article/details/107983413)

```c#
<template>
    <view><button type="default" @click="initData">点击初始化数据</button></view>
</template>

<script>
export default {
    data() {
        return {
            hello: 0,
            show1: false,
            selectMenu2: []
        };
    },
    onLoad() {
        this.setData();
    },
    methods: {
        // 模拟修改数据
        setData() {
            this.hello = 'okok';
            this.show1 = true;
            this.selectMenu2 = ['你好', '世界'];
        },
        // 初始化数据
        initData() {
            // 把this对象放入target，最后再把初始化属性拷贝进来(source)进行合并就可以了
            Object.assign(this, { hello: 0, show1: false, selectMenu2: [] });
            console.log('这里都可以取到值：', this, this._data);
        }
    }
};
</script>

<style></style>
```

### 3. uniapp 如何获取网页地址参数

- [uniapp 如何获取网页地址参数 - songyueyue - OSCHINA - 中文开源技术交流社区](https://my.oschina.net/tshblogs/blog/5000258)

```c#


FunGetQueryString: function(name) {
    var reg = new RegExp("(^|\\?|&)" + name + "=([^&]*)(\\s|&|$)", "i");
            if (reg.test(window.location.href))
            return unescape(RegExp.$2.replace(/\+/g, " "));
            return "";
},


uniapp中要获取地址http: //xxxxxxx/#/pages/my/index?id=124 的参数

1 : 获取本页面的地址
  let local = location.href;

2：获取参数
   let payment_id = this.getParam(local, "payment_id");
    //获取url中的参数
    getParam(path, name) {
          var reg = new RegExp("(^|\\?|&)" + name + "=([^&]*)(\\s|&|$)", "i");
          if (reg.test(path))
          return unescape(RegExp.$2.replace(/\+/g, " "));
          return "";
}
```

### 4. uni-app 配置 APP 不显示顶部标题栏

- [uni-app 配置 APP 不显示顶部标题栏 - 文章教程 - 文江博客](https://www.wenjiangs.com/article/uin-app-app-titlenview.html)

```c#

```

### 5. uniapp 去掉 h5 导航（微信公众号去掉和 h5 保留）

- [uniapp 去掉 h5 导航（微信公众号去掉和 h5 保留）\_n_229397218 的博客-CSDN 博客](https://blog.csdn.net/n_229397218/article/details/112838880)

```c#

```

## 98. 微信

- [稳定版 Stable Build | 微信开放文档](https://developers.weixin.qq.com/miniprogram/dev/devtools/download.html)

```c#
D:\Soft\Tencent\微信web开发者工具
```

## 98. UI 框架

- [ThorUI 文档](https://www.thorui.cn/doc/docs/introduce.html)
- [uView - 多平台快速开发的 UI 框架 - uni-app UI 框架](https://www.uviewui.com/)

```c#

```

## 99. 前端模板市场 | 插件收集

- [教育 APP 首页 - DCloud 插件市场](https://ext.dcloud.net.cn/plugin?id=216)
- [IM 即时通讯(资源足单机可支持数十万并发连接) - DCloud 插件市场](https://ext.dcloud.net.cn/plugin?id=2712)
- [即时通讯 IM 模板 - DCloud 插件市场](https://ext.dcloud.net.cn/plugin?id=1913)
- [APP 版本更新、强制更新、漂亮弹窗、下载进度（wgt 更新） - DCloud 插件市场](https://ext.dcloud.net.cn/plugin?id=1643)
- [PopUp 弹出层 - DCloud 插件市场](https://ext.dcloud.net.cn/plugin?id=329)
- [简洁又美观的登录页面+验证+倒计时 - DCloud 插件市场](https://ext.dcloud.net.cn/plugin?id=3612)
- [百度人脸识别（双端通用） - DCloud 插件市场](https://ext.dcloud.net.cn/plugin?id=2179)
- [万岳在线教育系统 UNI-APP 开源版 - DCloud 插件市场](https://ext.dcloud.net.cn/plugin?id=3808)

```c#

```

## 100. 经典教程

- [uni-app 零基础入门到项目实战](https://www.bilibili.com/video/BV11Z4y1K7yY?p=13&spm_id_from=pageDriver)
- [设备相关](https://www.bilibili.com/video/BV11Z4y1K7yY?p=26&spm_id_from=pageDriver)

```c#

```
