# C# COPY

- [C# 复制、粘贴文本信息到剪贴板](https://www.cnblogs.com/testsec/p/6095518.html)

## 复制

```c#
private void button1_Click(object sender, System.EventArgs e) {
　　// Takes the selected text from a text box and puts it on the clipboard.
　　if(textBox1.SelectedText != ”")
　　Clipboard.SetDataObject(textBox1.SelectedText);
　　}

```

## 粘贴

```c#
private void button2_Click(object sender, System.EventArgs e) {
　　// Declares an IDataObject to hold the data returned from the clipboard.
　　// Retrieves the data from the clipboard.
　　IDataObject iData = Clipboard.GetDataObject();

　　// Determines whether the data is in a format you can use.
　　if(iData.GetDataPresent(DataFormats.Text)) {
　　// Yes it is, so display it in a text box.
　　textBox2.Text = (String)iData.GetData(DataFormats.Text);
　　}
}
```