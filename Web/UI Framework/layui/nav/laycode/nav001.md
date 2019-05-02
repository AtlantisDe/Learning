# 导航 Nav

## 代码示例一

```html
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>导航带徽章和图片</legend>
</fieldset>

<ul class="layui-nav">
  <li class="layui-nav-item">
    <a href="">控制台<span class="layui-badge">9</span></a>
  </li>
  <li class="layui-nav-item">
    <a href="">个人中心<span class="layui-badge-dot"></span></a>
  </li>
  <li class="layui-nav-item" lay-unselect="">
    <a href="javascript:;"
      ><img src="//t.cn/RCzsdCq" class="layui-nav-img" />我</a
    >
    <dl class="layui-nav-child">
      <dd><a href="javascript:;">修改信息</a></dd>
      <dd><a href="javascript:;">安全管理</a></dd>
      <dd><a href="javascript:;" onclick="loginout();">安全退出</a></dd>
    </dl>
  </li>
</ul>
<div style="margin-top: 15px;"></div>
```
