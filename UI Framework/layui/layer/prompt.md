# prompt

## 代码

```js
//prompt层新定制的成员如下
{
  formType: 1, //输入框类型，支持0（文本）默认1（密码）2（多行文本）
  value: '', //初始时的值，默认空字符
  maxlength: 140, //可输入文本的最大长度，默认500
}

//例子1
layer.prompt(function(value, index, elem){
  alert(value); //得到value
  layer.close(index);
});

//例子2
layer.prompt({
  formType: 2,
  value: '初始值',
  title: '请输入值',
  area: ['800px', '350px'] //自定义文本域宽高
}, function(value, index, elem){
  alert(value); //得到value
  layer.close(index);
});
```
