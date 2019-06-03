# iframe

## 常用

### Wiki

-[layer iframe 层的使用，传参 - TBHacker - 博客园](https://www.cnblogs.com/jiqing9006/p/5135697.html)

### 子页父页互通性

```js
function selectsiteconfig(json) {
  var data = JSON.parse(json);

  layui.form.val("Div_sitesbatchdeploy_form", {
    configuration: JSON.stringify(data),
    name: data.name,
    classname: data.classname,
    beizhu: data.beizhu
  });

  return true;
}
```

```js
parent.selectsiteconfig(JSON.stringify(obj.data));
```

```js
parent.selectsiteconfig(JSON.stringify(obj.data));
layer.close(index);
parent.layer.close(parent.layer.getFrameIndex(window.name));
```

### 关闭弹出

```js
parent.selectsiteconfig(JSON.stringify(obj.data));
layer.close(index);
var parentindex = parent.layer.getFrameIndex(window.name);
parent.layer.close(parentindex);
```
