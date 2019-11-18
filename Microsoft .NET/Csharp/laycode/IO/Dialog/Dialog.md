# Dialog

## Windows

```c#
using Microsoft.WindowsAPICodePack.Dialogs;
var dialog = new CommonOpenFileDialog();
dialog.IsFolderPicker = true;
CommonFileDialogResult result = dialog.ShowDialog();
// 请注意，此对话框在Windows Vista之前的操作系统上不可用，因此请务必先检查CommonFileDialog.IsPlatformSupported。

```

## Demo 代码示例

```c#
FolderBrowserDialog path = new FolderBrowserDialog
{
    Description = "测试描述",
    ShowNewFolderButton = true,
    RootFolder = System.Environment.SpecialFolder.Desktop
};

path.ShowNewFolderButton = false;
path.ShowDialog();

if (path.SelectedPath == "") { return; }
```
