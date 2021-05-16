# ComboBox

- [ComboBox.DataSource Property (System.Windows.Forms)](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.combobox.datasource?view=netcore-3.1)
- [comboBox.DataSource 绑定 - 晴天有时下鱼 - 博客园](https://www.cnblogs.com/vmyspace/archive/2012/01/30/2332189.html)

## 常用

### 1. DataSource 绑定

```c#
string strSql = "select AMID as [编号],AMLX as [类型] from SYS_AlarmType order by AMID";
DataTable DT = TH.TracerEnerView.DBUtility.DbHelperSQL.Query(strSql).Tables[0];
comboBoxType.DataSource = DT;
comboBoxType.DisplayMember = "类型";
comboBoxType.ValueMember = "编号";

comboBoxType.DisplayMember = "Name";
comboBoxType.ValueMember = "Age";

this.C3.SelectedValue;
```
