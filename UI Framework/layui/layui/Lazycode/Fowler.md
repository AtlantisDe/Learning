# aa

## 常用代码

### 图片懒加载

```js
var urlitem = JSON.parse(parent.ineedarticleItem());
var articleItem = JSON.parse(urlitem.body);
layui.form.val("formTest", {
  title: articleItem.title,
  url: articleItem.url,
  keywords: articleItem.keywords,
  description: articleItem.description,
  author: articleItem.author,
  content: articleItem.content,
  available: articleItem.available,
  createtime: articleItem.createtime
});

if (articleItem.imgItems != null) {
  var text = "";
  for (i = 0; i < articleItem.imgItems.length; i++) {
    var imgitem = articleItem.imgItems[i];
    text += '<img lay-src="' + imgitem.url + '">';
  }
  layui.$("#LAY_demo3").append(text);
}
```
