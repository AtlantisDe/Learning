# ColumnsAdd

```c#
 if (this.IsHandleCreated)
    {
        this.Invoke((EventHandler)delegate
        {
            this.DT1.Columns.Add(new DataGridViewTextBoxColumn() { Name = "Obj", HeaderText = "对象", Width = 0 });
            this.DT1.Columns.Add(new DataGridViewTextBoxColumn() { Name = "Lineid", HeaderText = "行号", Width = 40 });
            this.DT1.Columns.Add(new DataGridViewTextBoxColumn() { Name = "Name", HeaderText = "解决方案名称", Width = 250 });
            this.DT1.Columns.Add(new DataGridViewTextBoxColumn() { Name = "Remark", HeaderText = "备注说明", Width = 300 });
            this.DT1.Columns.Add(new DataGridViewButtonColumn() { Name = "Action", HeaderText = "操作", Width = 100 });
            this.DT1.Columns[0].Visible = false;
            this.DT1.AllowUserToAddRows = false;
            this.DT1.BackgroundColor = Color.White;

        });
    }



for (int i = 0; i < items.Count; i++)
{
    var item = items[i];
    DT1.Rows.Add(item, (i + 1), item.Name, item.Remark,"打开");

}
```
