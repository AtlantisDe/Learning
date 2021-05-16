# iframe

## 常用

### Wiki

-[layer iframe 层的使用，传参 - TBHacker - 博客园](https://www.cnblogs.com/jiqing9006/p/5135697.html)

### 打开子页例子

```c#
```

### 子页父页互通性

```c#
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

```c#
parent.selectsiteconfig(JSON.stringify(obj.data));
```

```c#
parent.selectsiteconfig(JSON.stringify(obj.data));
layer.close(index);
parent.layer.close(parent.layer.getFrameIndex(window.name));

//JSON原始对象 如
var data = {
  name: data.name,
  classname: data.classname,
  beizhu: data.beizhu
};

//传入示例
valText(JSON.stringify(data));
parent.valText(JSON.stringify(data));

//表单赋值 传入JSON字符串
function valText(jsontexts) {
  layui.form.val("Div_itemsdemo_form", JSON.parse(jsontexts));
  return true;
}
```

### 关闭弹出

```c#
parent.selectsiteconfig(JSON.stringify(obj.data));
layer.close(index);
var parentindex = parent.layer.getFrameIndex(window.name);
parent.layer.close(parentindex);

parent.layer.close(parent.layer.getFrameIndex(window.name));
```
