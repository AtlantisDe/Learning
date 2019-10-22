# CellContentClick

- [DataGridView.CellContentClick Event (System.Windows.Forms)](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.datagridview.cellcontentclick?view=netframework-4.8)

```c#
        private void DGV_baiduConfigitems_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            var DataGridView = (DataGridView)sender;

            if (e.RowIndex < 0 || e.ColumnIndex < 0) { return; }

            var DataGridViewCellItem = DataGridView.Rows[e.RowIndex].Cells[e.ColumnIndex];
            if (DataGridViewCellItem.OwningColumn.Name == "action")
            {
                var url = (string)DataGridView.Rows[e.RowIndex].Cells["aaa"].Value;
            }


        }

```
