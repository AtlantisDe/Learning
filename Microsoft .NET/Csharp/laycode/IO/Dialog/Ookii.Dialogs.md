# Ookii.Dialogs

- [How to use Open File Dialog to Select a Folder](https://stackoverflow.com/questions/9227917/how-to-use-open-file-dialog-to-select-a-folder)
- [Ookii.Dialogs - Ookii.org](http://www.ookii.org/software/dialogs/)

## Ookii.Dialogs 常用

### 1. Ookii.Dialogs.WinForms

```c#
        public static string ChooseFolder()
        {
            string sPath = "";
            if (Ookii.Dialogs.WinForms.VistaOpenFileDialog.IsVistaFileDialogSupported)
            {
                using (Ookii.Dialogs.WinForms.VistaFolderBrowserDialog vistaFolderBrowserDialog = new Ookii.Dialogs.WinForms.VistaFolderBrowserDialog())
                {
                    if (vistaFolderBrowserDialog.ShowDialog() == DialogResult.OK)
                    {
                        sPath = vistaFolderBrowserDialog.SelectedPath;
                    }
                }
            }
            return sPath;
        }

```
