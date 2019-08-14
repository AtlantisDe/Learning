# 数据表格能添加请求头

## 代码

```js
table.render({
  //其它参数在此省略
  url: "/api/data/"
  //where: {token: 'sasasas', id: 123} //如果无需传递额外参数，可不加该参数
  //method: 'post' //如果无需自定义HTTP类型，可不加该参数
  //request: {} //如果无需自定义请求参数，可不加该参数
  //response: {} //如果无需自定义数据响应名称，可不加该参数
  //headers: {token: 'sasasas'} //
});

if (tableIns.linkitems != null) {
  tableIns.linkitems.reload({ where: { host: host } });
  return;
}


    url: "/api/Links/linkitems",
    where: { host: host },
```
