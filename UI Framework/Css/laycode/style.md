# style

## 常用的 style 代码库

```html
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

### 1. div 隐藏

```html
<div
  style="display: none; padding: 20px; background-color: #F2F2F2;"
  id="Div_sites_batchbuilding"
></div>
```

#### 2. css 隐藏

```css
style="display: none"
```

#### 3. 图片自适应宽度

- [div 或 img 图片高度随宽度自适应](https://blog.csdn.net/chelen_jak/article/details/82781849)

```css
<p><img style="width: 100%;" src="http://dingyue.ws.126.net/2019/06/27/5c95f1d5b37a4a40b7084ca5a9d5ab6e.jpeg"></p>

<img style="width:auto;height:auto;" src="http://5a9d5ab6e.jpeg">


```

#### 4. 圆形图片

```css
<img src="/App/images/loading2.gif" style="width: 21px; height: 19px; margin-right:19px;border-radius:50%;" />
```

#### 5. 定义长度

```html
<div class="layui-input-inline" style="width: 500px;"></div>
```

#### 6. 定义高度

```html
<div class="layui-input-inline" style="height: 500px;"></div>
```

#### 7. 固定头部 不移动

```js
<div  class="header"  style="position: fixed;z-index: 1000;left: 0;top: 0;width: 100%;width: 100%;"></div>
<div style="position: fixed;z-index: 1000;left: 0;top: 0;width: 100%;width: 100%;"></div>

<div style="position: fixed;z-index: 10000;left: 0;top: 0;width: 100%;width: 100%;">
<div style="width: 480px;float: left;margin-left: 10px;margin-top: 10px;"></div>
</div>

```

#### 8. 居中显示

```css
.elapsedTime {
  text-align: center;
  margin: 0 auto;
}
```

```html
<div class="elapsedTime">耗时:0</div></body>
```

#### 9. CSS 浮动

- [CSS 浮动](https://www.w3school.com.cn/css/css_positioning_floating.asp)

```css
<div style="float: left;"></div>


<div style="width: 400px;float: left;"></div>
<div style="width: 400px;float: left;"></div>

```

```html

```
