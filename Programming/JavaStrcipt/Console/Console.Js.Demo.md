# Console.Js.Demo

```c#

```

## 0. 循环获取文本内容示例代码

### 1. link114 获取域名

```c#
var Text = "";
document.querySelectorAll('.websites').forEach(function (element, index) {
    Text = Text+'https://'+element.innerText+"\r\n";
});
console.log(Text);
```

### 2. similarweb 获取域名

```c#
var Text = "";
document.querySelectorAll('.websites').forEach(function (element, index) {
    Text = Text+''+element.innerText+"\r\n";
});
console.log(Text);
```

### 3. for 获取数据

```c#
var Text = "";
var TextList = "";

var array = layui.table.cache.Sites;
for (var i = 0; i < array.length; i++) {
  var site = array[i];

  Text += site.Nodes.Hostitem.Name + " " + site.Guid + "\r\n";
  TextList += 'siteGuids.Add("' + site.Guid + '");' + "\r\n";
}
console.log(Text);
console.log(TextList);


```

### 3. split [枚举类型] 两次分割先以行分割,再以制表符分割

```c#
var str =  "";
var Text = "";
var arrLines = str.split("\r\n");
for (var i = 0; i < arrLines.length; i++) {
  var item = arrLines[i];
  var arr = item.split("\t");
  if (arr.length >= 2) {
     Text += '/// <summary>' + arr[0] + '</summary>\r\n        [Description(\"' + arr[0] + '\")]\r\n        ' + arr[1] + ' = ' + i + ',' + "\r\n";
  }
}

```
