# C# TcpClient

- [DataGridView 控件中至少有一列没有单元格模板的解决 - phcis - 博客园](https://www.cnblogs.com/phcis/archive/2009/05/22/1486902.html)
- [关于 Datagridview 控件用法的一些总结](http://www.cnblogs.com/mingjiatang/p/4968049.html)

## Columns

```c#
DataGridViewButtonColumn btn = new DataGridViewButtonColumn();

public class Columns
        {
            public static void init(DataGridView dataGridView)
            {
                dataGridView.Columns.Add(new DataGridViewTextBoxColumn() { Name = "url", HeaderText = "域名地址" });
                dataGridView.Columns.Add(new DataGridViewTextBoxColumn() { Name = "message", HeaderText = "信息" });
                dataGridView.Columns.Add(new DataGridViewTextBoxColumn() { Name = "content", HeaderText = "备注说明" });
                dataGridView.Columns.Add(new DataGridViewButtonColumn() { Name = "open", HeaderText = "打开" });

                dataGridView.
            }

        }

```

## 隐藏列

```c#
DataGridView1.Columns[0].Visible = false;
```

## 添加行数据

```c#
var LineId = dataGridView.Rows.Add();
dataGridView.Rows[LineId].Cells["aaa"].Value = a;

dataGridView.Rows.Add(a, (i + 1), a.url, a.content);
```

## 点击单元格内容事件

```c#
this.dt_domain.CellContentClick += Dt_domain_CellContentClick;
```
