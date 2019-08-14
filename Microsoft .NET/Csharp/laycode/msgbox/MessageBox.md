# MessageBox

```c#
var frm = new Form() { Text = "请输入保存的文件名", StartPosition = FormStartPosition.CenterParent, MaximumSize = new System.Drawing.Size() { Height = 60, Width = 400 }, MaximizeBox = false, MinimizeBox = false };
frm.Controls.Add(new TextBox() { Dock = DockStyle.Fill, Text = "" });
frm.ShowDialog();
if (frm.ActiveControl.Text == "") { return false; }
```

## 信息框

```c#
MessageBoxIcon.Information
MessageBoxIcon.Question

MessageBox.Show("aa", "title", MessageBoxButtons.OK, MessageBoxIcon.Information);
MessageBox.Show(ex.Message, System.Reflection.MethodBase.GetCurrentMethod().Name, MessageBoxButtons.OK, MessageBoxIcon.Information);


if (MessageBox.Show(message, "安装提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
{
    MessageBox("点击了按钮“是”");
}
else
{
    MessageBox("点击了按钮“否”");
}
```
