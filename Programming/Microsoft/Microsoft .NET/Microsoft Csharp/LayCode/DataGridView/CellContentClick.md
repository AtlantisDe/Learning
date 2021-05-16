# CellContentClick

- [DataGridView.CellContentClick Event (System.Windows.Forms)](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.datagridview.cellcontentclick?view=netframework-4.8)

```c#

private void DT1_CellContentClick(object sender, DataGridViewCellEventArgs e)
{
    var DT = (DataGridView)sender;

    if (e.RowIndex < 0 || e.ColumnIndex < 0) { return; }

    var DataGridViewCellItem = DT.Rows[e.RowIndex].Cells[e.ColumnIndex];
    if (DataGridViewCellItem.OwningColumn.Name == "Action")
    {
        var item = (string)DT.Rows[e.RowIndex].Cells["Obj"].Value;
    }
}

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
