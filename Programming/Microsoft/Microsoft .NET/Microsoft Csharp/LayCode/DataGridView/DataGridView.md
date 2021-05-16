# C# TcpClient

- [DataGridView 控件中至少有一列没有单元格模板的解决 - phcis - 博客园](https://www.cnblogs.com/phcis/archive/2009/05/22/1486902.html)
- [关于 Datagridview 控件用法的一些总结](http://www.cnblogs.com/mingjiatang/p/4968049.html)

## 1. QuickStart

```c#
this.DT1.Columns[0].Visible = false;
this.DT1.AllowUserToAddRows = false;
this.DT1.BackgroundColor = Color.White;
this.DT1.ReadOnly = true;

```

## 2. Columns

```c#
DataGridViewButtonColumn btn = new DataGridViewButtonColumn();

public class Columns
        {
            public static void init(DataGridView dataGridView)
            {
                dataGridView.Columns.Add(new DataGridViewTextBoxColumn() { Name = "Url", HeaderText = "域名地址" });
                dataGridView.Columns.Add(new DataGridViewTextBoxColumn() { Name = "Message", HeaderText = "信息" });
                dataGridView.Columns.Add(new DataGridViewTextBoxColumn() { Name = "Content", HeaderText = "备注说明" });
                dataGridView.Columns.Add(new DataGridViewButtonColumn() { Name = "Open", HeaderText = "打开" });

            }

        }

```

## 3. 隐藏列

```c#
DataGridView1.Columns[0].Visible = false;
```

## 4. 添加行数据

```c#

var LineId = DT1.Rows.Add();
DT1.Rows[LineId].Cells["Obj"].Value = item;

var item = items[i];
DT1.Rows.Add(item, (i + 1), item.Name, item.Remark);

```

## 6. 点击单元格内容事件

```c#
this.dt_domain.CellContentClick += Dt_domain_CellContentClick;

private void Dt_domain_CellContentClick(object sender, DataGridViewCellEventArgs e)
{
    if (e.RowIndex < 0 || e.ColumnIndex < 0)    {return;}

    var aa = dt_domain.Rows[e.RowIndex].Cells[e.ColumnIndex];
    if (aa.OwningColumn.Name == "action")
    {
        var url = (string)dt_domain.Rows[e.RowIndex].Cells["aaa"].Value;
    }
}
```

## 7. 常用填充表格代码格式化

```c#
for (int i = 0; i < items.Count; i++)
{
    var item = items[i];
    DT1.Rows.Add(

        item,
        (i + 1),

        item.BaiduUser,
        item.BaiduPass,

        item.NetEase163User,
        item.NetEase163Pass,


        "备注说明",
        "打开"

        );
}

```

## 8. 数据行 UI 状态更新

```c#
/// <summary>刷新UI状态</summary>
public void UIShowRefresh(DataGridView dataGridView, AledbItem aledbItem)
{
    dataGridView.Invoke((EventHandler)delegate
    {
        Application.DoEvents();
        dataGridView.Rows[aledbItem.lineId].Cells["TimeConsuming"].Value = aledbItem.TimeConsuming;

    });

}

/// <summary>刷新UI状态</summary>
public bool UIShowRefresh(DataGridView dataGridView, AledbItem aledbItem)
{
    dataGridView.Invoke((EventHandler)delegate
    {
        Application.DoEvents();
        dataGridView.Rows[aledbItem.lineId].Cells["TimeConsuming"].Value = aledbItem.TimeConsuming;

    });
    return true;
}
```

## 9. 选中行

```c#

```

## 10. DataGridViewCheckBoxColumn

- [DataGridViewCheckBoxColumn Class (System.Windows.Forms)](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.datagridviewcheckboxcolumn?view=net-5.0)

```c#

this.DT1.Columns.Add(new DataGridViewCheckBoxColumn() { Name = "CheckBox", HeaderText = "选中", Width = 40 });

// 读取选中
for (int i = 0; i < this.DT1.Rows.Count; i++)
{
    if ((bool)this.DT1.Rows[i].Cells["CheckBox"].Value == true)
    {

    }
}
// 取消选中
for (int i = 0; i < this.DT1.Rows.Count; i++)
{
    this.DT1.Rows[i].Cells["CheckBox"].Value = false;
}


```
