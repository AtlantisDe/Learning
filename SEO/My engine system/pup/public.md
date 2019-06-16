# public

## 全局模板标签

- 全局模板标签,能使用在模板任何地方

## 全部全局标签 与 使用方法

| 内容页标签           | 内部函数 | 说明 |
| :------------------- | :------: | :--- |
| <固定本网站名称>     |  title   | 无   |
| <随机网站名称>       |   url    | 无   |
| <本站网址>           |   body   | 无   |
| <随机栏目(数字)链接> |   body   | 无   |
| <随机栏目(数字)名称> |   body   | 无   |
| <固定栏目(数字)链接> |   body   | 无   |
| <固定栏目(数字)名称> |   body   | 无   |

### 标签 1 : <本站网址> <固定网站名称> <随机网站名称>

```html
<a href="<本站网址>" title="<随机网站名称>">首页</a>
<a href="<本站网址>" title="<固定网站名称>">首页</a>
<a href="<本站网址>" title="<随机网站名称>"><固定网站名称></a>
```

### 标签 2 : 固定栏目 随机栏目 链接

- 栏目相关
- 固定调取:<随机栏目 1 链接> <随机栏目 1 名称> 其中数字可以模板重定义
- 随机调取:<固定栏目 1 链接> <固定栏目 1 名称> 其中数字可以模板重定义

```html
<!-- 当前栏目标题 -->
<!-- 这里取栏目1栏目标题 -->
<a href="" title="{当前栏目标题}"> <随机栏目7名称></a>
<!-- 随机类型示例 -->
<li class="">
  <a
    href="<随机栏目1链接>"
    data-type="mip"
    data-title="<随机栏目1名称>"
    title="首页"
    ><随机栏目1名称></a
  >
</li>
<li>
  <a
    href="<随机栏目2链接>"
    data-type="mip"
    data-title="<随机栏目2名称>"
    title="<随机栏目2名称>"
    ><随机栏目2名称></a
  >
</li>
<!-- 固定类型示例 -->
<li class="">
  <a
    href="<固定栏目1链接>"
    data-type="mip"
    data-title="<固定栏目1名称>"
    title="首页"
    ><随机栏目1名称></a
  >
</li>
<li>
  <a
    href="<固定栏目2链接>"
    data-type="mip"
    data-title="<固定栏目2名称>"
    title="<固定栏目2名称>"
    ><随机栏目2名称></a
  >
</li>
```

### 标签 3 : <随机日期时间> 用法

```html
<h1 class="detail-title"><随机日期时间></h1>
```

### 标签 3 : <随机栏目 1 链接> <随机栏目 1 名称> 其中数字可以模板重定义

- 循环随机栏目标签 写法与用法 格式:

```html
<li class="">
  <a
    href="<随机栏目1链接>"
    data-type="mip"
    data-title="<随机栏目1名称>"
    title="首页"
    ><随机栏目1名称></a
  >
</li>
<li>
  <a
    href="<随机栏目2链接>"
    data-type="mip"
    data-title="<随机栏目2名称>"
    title="<随机栏目2名称>"
    ><随机栏目2名称></a
  >
</li>
<li>
  <a
    href="<随机栏目3链接>"
    data-type="mip"
    data-title="<随机栏目3名称>"
    title="<随机栏目3名称>"
    ><随机栏目3名称></a
  >
</li>
```

### 标签 4 : <固定栏目 1 链接> <固定栏目 1 名称> 其中数字可以模板重定义 [废弃]

- 固定栏目标签 写法与用法 格式

```html
<ul class="mipmb-menu list-unstyled d-lg-flex">
  <li class="">
    <a
      href="<固定栏目1链接>"
      data-type="mip"
      data-title="<固定栏目1名称>"
      title="首页"
    >
      <固定栏目1名称>
    </a>
  </li>
  <li>
    <a
      href="<固定栏目2链接>"
      data-type="mip"
      data-title="<固定栏目2名称>"
      title="<固定栏目2名称>"
    >
      <固定栏目2名称>
    </a>
  </li>
  <li>
    <a
      href="<固定栏目3链接>"
      data-type="mip"
      data-title="<固定栏目3名称>"
      title="<固定栏目3名称>"
    >
      <固定栏目3名称>
    </a>
  </li>
  <li>
    <a
      href="<固定栏目4链接>"
      data-type="mip"
      data-title="<固定栏目4名称>"
      title="<固定栏目4名称>"
    >
      <固定栏目4名称>
    </a>
  </li>
  <li>
    <a
      href="<固定栏目5链接>"
      data-type="mip"
      data-title="<固定栏目5名称>"
      title="<固定栏目5名称>"
    >
      <固定栏目5名称>
    </a>
  </li>
  <li>
    <a
      href="<固定栏目6链接>"
      data-type="mip"
      data-title="<固定栏目6名称>"
      title="<固定栏目6名称>"
    >
      <固定栏目6名称>
    </a>
  </li>
</ul>
```
