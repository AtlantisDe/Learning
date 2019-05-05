# layer

## 常用信息框

```js
layer.alert(data.apimsg.message, { icon: 6 });
layer.msg(data.apimsg.message);
layer.close(layer.index);
```

## 层类型

```shell
# layer提供了5种层类型。
# 可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
# 若你采用layer.open({type: 1})方式调用，则type为必填项（信息框除外）
```

## area - 宽高

```shell
area: "500px",
area: ['500px', '300px'],
```

## 页面层

```js
// 如果是页面层
layer.open({
  type: 1,
  content: "传入任意的文本或html" //这里content是一个普通的String
});
layer.open({
  type: 1,
  content: $("#id") //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
});
//Ajax获取
$.post("url", {}, function(str) {
  layer.open({
    type: 1,
    content: str //注意，如果str是object，那么需要字符拼接。
  });
});
```

````js
    layer.prompt({ title: '输入任何口令，并确认', formType: 1 }, function (pass, index) {
        layer.close(index);
        layer.prompt({ title: '随便写点啥，并确认', formType: 2 }, function (text, index) {
            layer.close(index);
            layer.msg('演示完毕！您的口令：' + pass + '<br>您最后写下了：' + text);
        });
    });
    ```
````
