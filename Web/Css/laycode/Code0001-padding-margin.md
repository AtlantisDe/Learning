# CSS margin padding

- [CSS 中 margin 和 padding 属性的区别](https://www.cnblogs.com/iwwenbo/p/3515400.html)
- [用 Margin 还是用 Padding](http://www.hicss.net/use-margin-or-padding/)

## margin 和 padding 的区别

```css
/* 
margin是指从自身边框到另一个容器边框之间的距离，就是容器外距离。（外边距
padding是指自身边框到自身内部另一个容器边框之间的距离，就是容器内距离。（内边距 
*/
```

## 设置 p 元素的 4 个内边距

```css
p {
  padding: 2cm 4cm 3cm 4cm;
}
```

## 例子 1

```css
padding:10px 5px 15px 20px;
<div style="padding:10px 5px 15px 90px;">
/* 上内边距是 10px
右内边距是 5px
下内边距是 15px
左内边距是 20px */
```

## CSS 外边距属性（Margin）

```css
margin:10px 5px 15px 20px;
<div style="margin:100px 15px 15px 20px;">

```
