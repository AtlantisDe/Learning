# ColumnsAdd

```c#
 if (this.IsHandleCreated)
                {
                    this.Invoke((EventHandler)delegate
                    {
                        this.DGV_baiduConfigitems.Columns.Add(new DataGridViewTextBoxColumn() { Name = "obj", HeaderText = "对象", Width = 0 });
                        this.DGV_baiduConfigitems.Columns.Add(new DataGridViewTextBoxColumn() { Name = "lineid", HeaderText = "行号", Width = 40 });
                        this.DGV_baiduConfigitems.Columns.Add(new DataGridViewTextBoxColumn() { Name = "name", HeaderText = "解决方案名称", Width = 250 });
                        this.DGV_baiduConfigitems.Columns.Add(new DataGridViewTextBoxColumn() { Name = "createtime", HeaderText = "创建时间", Width = 100 });
                        this.DGV_baiduConfigitems.Columns.Add(new DataGridViewButtonColumn() { Name = "action", HeaderText = "操作", Width = 100 });
                        this.DGV_baiduConfigitems.Columns[0].Visible = false;
                        this.DGV_baiduConfigitems.AllowUserToAddRows = false;
                        this.DGV_baiduConfigitems.BackgroundColor = Color.White;

                    });
                }
```
