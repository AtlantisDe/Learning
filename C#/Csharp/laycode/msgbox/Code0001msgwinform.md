# msgwinform

```c#
var frm = new Form() { Text = "请输入保存的文件名", StartPosition = FormStartPosition.CenterParent, MaximumSize = new System.Drawing.Size() { Height = 60, Width = 400 }, MaximizeBox = false, MinimizeBox = false };
frm.Controls.Add(new TextBox() { Dock = DockStyle.Fill, Text = "" });
frm.ShowDialog();
if (frm.ActiveControl.Text == "") { return false; }
```

## 信息框

```c#
MessageBox.Show("aa", "title", MessageBoxButtons.OK, MessageBoxIcon.Information);
```
