# ShowItems

```c#
public static bool domains(DataGridView dataGridView)
{
    dataGridView.Rows.Clear();

    for (int i = 0; i < ucmainapi.Static.Root.root.domains.Count; i++)
    {
        var a = ucmainapi.Static.Root.root.domains[i];
        DataGridViewRow dataGridViewRow = new DataGridViewRow();

        var LineId = dataGridView.Rows.Add();
        a.lineId = LineId;
        dataGridView.Rows[LineId].Cells["obj"].Value = a;
        dataGridView.Rows[LineId].Cells["lineid"].Value = (i + 1);
        dataGridView.Rows[LineId].Cells["url"].Value = a.url;
        dataGridView.Rows[LineId].Cells["content"].Value = a.content;
        dataGridView.Rows[LineId].Cells["action"].Value = "删除";


    }
    return true;

}



this.DGV_baiduConfigitems.Rows.Clear();
for (int i = 0; i < apibaiduConfigitems.baiduConfigitems.Count; i++)
{
    var a = apibaiduConfigitems.baiduConfigitems[i];
    DataGridViewRow dataGridViewRow = new DataGridViewRow();
    var LineId = this.DGV_baiduConfigitems.Rows.Add();
    this.DGV_baiduConfigitems.Rows[LineId].Cells["obj"].Value = a;
    this.DGV_baiduConfigitems.Rows[LineId].Cells["lineid"].Value = (i + 1);
    this.DGV_baiduConfigitems.Rows[LineId].Cells["url"].Value = a.url;
    this.DGV_baiduConfigitems.Rows[LineId].Cells["content"].Value = a.content;
    this.DGV_baiduConfigitems.Rows[LineId].Cells["action"].Value = "删除";
}

```
