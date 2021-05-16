# Vue

- [vuejs](https://github.com/vuejs)
- [vuejs/vue](https://github.com/vuejs/vue)
- Vue.js（读音 /vjuː/, 类似于 view） 是一套构建用户界面的渐进式框架。
- Vue 只关注视图层， 采用自底向上增量开发的设计。
- Vue 的目标是通过尽可能简单的 API 实现响应的数据绑定和组合的视图组件。
- Vue 学习起来非常简单，本教程基于 Vue 2.1.8 版本测试。

## 1. Vue.js 教程

- [介绍 — Vue.js](https://cn.vuejs.org/v2/guide/index.html)
- [Vue.js 教程](https://learning.dcloud.io/)
- [Vue.js 教程 | 菜鸟教程](http://www.runoob.com/vue2/vue-tutorial.html)

## 2. Vue CLI

- [CLI 服务 | Vue CLI](https://cli.vuejs.org/zh/guide/cli-service.html#%E4%BD%BF%E7%94%A8%E5%91%BD%E4%BB%A4)

## 3. 安装 vue 脚手架 3.0 以上版本

```c#
npm install -g @vue/cli
vue -V
// 执行：
vue create my-project

```

## 4. 插件

```c#
Vetur

```

## 5. uniapp 中 nvue 与 vue 的区别

- [uniapp中nvue与vue的区别](https://www.jianshu.com/p/6705eeb8eb3a)

```c#
// uni-app是逻辑和渲染分离的，渲染层在app端提供了两套排版引擎。
// 小程序方式的webview渲染，和weex方式的原生渲染，两种渲染引擎可以自己根据需要选。
// vue文件走的webview渲染
// nvue走weex方式的原生渲染

// 组件和js写法是一样的，css不一样，原生排版的能用的css必须是flex布局

// uni-app的App端内置了一个基于weex改进的原生渲染引擎，提供了原生渲染能力。
// 在App端，如果使用vue页面，则使用webview渲染；如果使用nvue页面(native vue的缩写)，则使用原生渲染。一个App中可以同时使用两种页面，比如首页使用nvue，二级页使用vue页面，hello uni-app示例就是如此。

// 虽然nvue也可以多端编译，输出H5和小程序，但nvue的css写法受限，所以如果你不开发App，那么不需要使用nvue。

// nvue 和 vue 相互通讯
// 在 uni-app 中，nvue 和 vue 页面可以混搭使用。

```
