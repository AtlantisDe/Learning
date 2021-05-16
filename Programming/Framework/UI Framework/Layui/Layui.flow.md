# layui.flow

- [流加载文档 - Layui](https://www.layui.com/doc/modules/flow.html)

## 常用

```c#
// 1
layui.flow.lazyimg({
            elem: '#LAY_demo3 img',
            scrollElem: '#LAY_demo3' //一般不用设置，此处只是演示需要。
        });
// 2
layui.table.render({
    elem: '#imgItems',
    toolbar: false,
    title: '图片',
    totalRow: false,
    cols: [
        [{
                field: "id",
                width: 66,
                title: "编号",
                sort: false,
                templet: function (d) {
                    return d.LAY_TABLE_INDEX + 1;
                }
            },
            {
                field: "Url",
                title: "图片地址",
                width: 200
            },
            {
                field: "Alt",
                title: "图片描述",
                width: 400
            }
        ]
    ],
    page: false,
    page: true,
    data: articleItem.ImgItems
});

// 3
if (responseJSON.Data.Imgs != null) {
    var text = "";
    for (i = 0; i < responseJSON.Data.Imgs.length; i++) {
        var imgitem = responseJSON.Data.Imgs[i];
        text += '<img lay-src="' + imgitem + '">';
    }
    layui.$("#LAY_demo3").append(text);
}

```
