# Dot.Net.Forms

## 0. 常用

### 1. 普通文本框与单提交按钮

```c#
using (var frm = new Dot.Net.Forms.MetroModernUI.Forms.Textarea1())
{
    frm.Text = "标题";
    frm.Size = new Size(888, 366);
    frm.ShowDialog();
    if (frm.Formdata.ActionType == Dot.Net.Forms.FormCommon.Models.ActionType.Submit)
    {
    }
}


using (var frm = new Dot.Net.Forms.MetroModernUI.Forms.Textarea1())
{
    frm.Text = "导入";
    frm.Size = new Size(888, 366);
    frm.ShowDialog();
    if (frm.Formdata.ActionType == Dot.Net.Forms.FormCommon.Models.ActionType.Submit)
    {
        var rst = Google.Net.WinForms.Engine.Baidu.App.Google.Driver.Insert(frm.Formdata.Content);
        MessageBox.Show(rst.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
    }

}



```
