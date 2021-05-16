# CSS

- [CSS](https://www.quackit.com/css/)
- [CSS 参考手册 | 菜鸟教程](https://www.runoob.com/cssref/css-reference.html)
- [CSS 选择器参考手册](http://www.w3school.com.cn/cssref/css_selectors.asp)
- [CSS 颜色十六进制值 ֵ](http://www.w3school.com.cn/cssref/css_colorsfull.asp)
- [CSS current work &amp; how to participate](https://www.w3.org/Style/CSS/current-work)
- [CSS\_入门 精通 教程\_w3cplus](https://www.w3cplus.com/CSS3)

## 0. color.tool

- [https://htmlcolorcodes.com/](https://htmlcolorcodes.com/)

## 0. word-break

- [HTML 长文本换行 - Ryan_zheng - 博客园](https://www.cnblogs.com/ryanzheng/p/9976926.html)
- [Getting Title at 16:48](https://blog.csdn.net/fly821760648/article/details/82969244)
- [html 转义字符换行以及回车等的使用 - 王志超 II - 博客园](https://www.cnblogs.com/wangzhichao/p/10251317.html)

```C#
<!-- html换行回车转义字符  -->
&#10;
<!-- 换行Line feed  -->
&#13;
<!-- 回车Carriage Return -->
```

## 1. style

### 1. 常用的 style 代码库

```C#
<style mip-custom>
  .mipmb-header-default .logo-text {
    padding-top: 15px;
  }
</style>
<style type="text/css">
  .mipmb-header-default .logo-text {
    padding-top: 15px;
  }
</style>
```

### 2. div 隐藏

```C#
<div style="display: none; padding: 20px; background-color: #F2F2F2;"  id="Div_sites_batchbuilding"></div>
```

#### 1. css 隐藏

```css
style="display: none"
```

#### 2. 图片自适应宽度

- [div 或 img 图片高度随宽度自适应](https://blog.csdn.net/chelen_jak/article/details/82781849)

```css
<p><img style="width: 100%;" src="http://dingyue.ws.126.net/2019/06/27/5c95f1d5b37a4a40b7084ca5a9d5ab6e.jpeg"></p>

<img style="width:auto;height:auto;" src="http://5a9d5ab6e.jpeg">


```

#### 3. 圆形图片

```css
<img src="/App/images/loading2.gif" style="width: 21px; height: 19px; margin-right:19px;border-radius:50%;" />
```

#### 4. 定义长度

```C#
<div class="layui-input-inline" style="width: 500px;"></div>
```

#### 5. 定义高度

```C#
<div class="layui-input-inline" style="height: 500px;"></div>
```

#### 6. 固定头部 不移动

```c#
<div  class="header"  style="position: fixed;z-index: 1000;left: 0;top: 0;width: 100%;width: 100%;"></div>
<div style="position: fixed;z-index: 1000;left: 0;top: 0;width: 100%;width: 100%;"></div>

<div style="position: fixed;z-index: 10000;left: 0;top: 0;width: 100%;width: 100%;">
<div style="width: 480px;float: left;margin-left: 10px;margin-top: 10px;"></div>
</div>

```

#### 7. 居中显示

```css
.elapsedTime {
  text-align: center;
  margin: 0 auto;
}
```

```C#
<div class="elapsedTime">耗时:0</div></body>



<div align="center">
    <img src="/FinanceApp001.jpg" />
</div>

```

#### 8. CSS 浮动

- [CSS 浮动](https://www.w3school.com.cn/css/css_positioning_floating.asp)

```css
<div style="float: left;"></div>


<div style="width: 400px;float: left;"></div>
<div style="width: 400px;float: left;"></div>

```

```C#

```

#### 9. 一行自动缩进

```css
<div id="id" style="display:inline-block;"></div>
```

## 2. font

- [https://htmlcolorcodes.com/](https://htmlcolorcodes.com/)

```C#

<font color="#0000ff"></font>

<font style="color:#008cd2"></font>

<font color="#008cd2"></font>

<font color="#1E9FFF"></font>

<font color="#FFB800">Hello</font>

<font color="#FF0000"></font>

<font color=\"#FF0000\"></font>

<font color="#E437EC"></font>

<font color="#ffffff"></font>

<font color="#0000ff"></font>

<font color="#FF0000"></font>

<div style="background-color: #009688!important;"></div>

<div style="color:#FF0000"></div>

```

## 3. CSS float

- [CSS float 属性](http://www.w3school.com.cn/cssref/pr_class_float.asp)

## 4. class

- margin 是指从自身边框到另一个容器边框之间的距离，就是容器外距离。（外边距
- padding 是指自身边框到自身内部另一个容器边框之间的距离，就是容器内距离。（内边距

```css
.demo {
  font-family: "MS Serif", "New York", serif;
  font-size: 12px;
  font-style: normal;
  line-height: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  color: #f00;
  text-decoration: underline;
  background-color: #ccc;
  clear: none;
  float: none;
  height: 10px;
  width: 100px;
  margin-top: 10px;
  margin-right: 10px;
  margin-bottom: 10px;
  margin-left: 10px;
  padding-top: 10px;
  padding-right: 10px;
  padding-bottom: 10px;
  padding-left: 10px;
  min-height: 10px;
}
```

## 5. CSS margin 和 padding 的区别

- [CSS 中 margin 和 padding 属性的区别](https://www.cnblogs.com/iwwenbo/p/3515400.html)
- [用 Margin 还是用 Padding](http://www.hicss.net/use-margin-or-padding/)

```css

/* margin是指从自身边框到另一个容器边框之间的距离，就是容器外距离。（外边距
padding是指自身边框到自身内部另一个容器边框之间的距离，就是容器内距离。（内边距 */


/* 例子 1 */
padding:10px 5px 15px 20px;
上内边距是 10px
右内边距是 5px
下内边距是 15px
左内边距是 20px
```

### 1. 设置 p 元素的 4 个内边距

```css
p {
  padding: 2cm 4cm 3cm 4cm;
}
```

### 2. 例子 1

```css
padding:10px 5px 15px 20px;
<div style="padding:10px 5px 15px 90px;">
/* 上内边距是 10px
右内边距是 5px
下内边距是 15px
左内边距是 20px */

/* padding 设置元素的填充 (可设置四个值)
padding-Bottom 设置元素的下填充
padding-Left 设置元素的左填充
padding-Right 设置元素的右填充
padding-Top 设置元素的顶填充 */


```

### 3. CSS 外边距属性（Margin）

```css
/* margin 设置元素的边距 (可设置四个值)
margin-Bottom 设置元素的底边距
margin-Left 设置元素的左边距
margin-Right 设置元素的右边据
margin-Top 设置元素的顶边距 */


margin:10px 5px 15px 20px;
<div style="margin:100px 15px 15px 20px;">

```
