# form.render

- [常见问题 - layui](https://www.layui.com/doc/base/faq.html#form)

## 常见问题

- 当你使用表单时，layui 会对 select、checkbox、radio 等原始元素隐藏，从而进行美化修饰处理。但这需要依赖于 form 组件，所以你必须加载 form，并且执行一个实例。

```js
layui.form.render();
```
