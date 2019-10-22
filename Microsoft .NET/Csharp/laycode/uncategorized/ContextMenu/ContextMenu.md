# ContextMenu

- [C# 如何在 Windows 文件系统中添加自定义右键菜单 - u012853878 的专栏 - CSDN 博客](https://blog.csdn.net/u012853878/article/details/16354469)

- 软媒魔方大师 有右键菜单管理

```c#


var itemName = "[秒级处理]";
var associatedProgramFullPath = @"D:\Demo\ServerAdmin\Tool.exe";
var runcode = string.Format("\"{0}\" \"{1}\" \"{2}\"", associatedProgramFullPath, "Tool_Text2aledb", "%1");

CsharpLazycode.Module.PcContextMenu.Util.AddFileContextMenuItem(itemName, runcode);

CsharpLazycode.Module.PcContextMenu.Util.AddFileContextMenuItemParameterone(itemName, itemName);


var runcode = Application.ExecutablePath + " %1";
runcode = "\"" + Application.ExecutablePath + "\"" + " " + "\"" + "%1" + "\"";
CsharpLazycode.Module.Laycode.ContextMenu.AddFileContextMenuItem("秒级处理", runcode);



```

```C#
DemoTestTool.Module.DBini.Util.runfilepath = "";
if (args.Length > 0)
{
    var path = args[0];
    var ext = Path.GetExtension(path);
    if (ext.ToLower() == ".txt")
    {
        DemoTestTool.Module.DBini.Util.runfilepath = path;
    }
    else
    {
        Application.Exit(); return;
    }
}
```

```c#
using Microsoft.Win32;
private void AddFileContextMenuItem(string itemName, string associatedProgramFullPath)
{
    //创建项：shell
    RegistryKey shellKey = Registry.ClassesRoot.OpenSubKey(@"*\shell",true);
    if (shellKey == null)
    {
        shellKey = Registry.ClassesRoot.CreateSubKey(@"*\shell");
    }


    //创建项：右键显示的菜单名称
    RegistryKey rightCommondKey = shellKey.CreateSubKey(itemName);
    RegistryKey associatedProgramKey= rightCommondKey.CreateSubKey("command");


    //创建默认值：关联的程序
    associatedProgramKey.SetValue(string.Empty, associatedProgramFullPath);


    //刷新到磁盘并释放资源
    associatedProgramKey.Close();
    rightCommondKey.Close();
    shellKey.Close();
}


private void AddDirectoryContextMenuItem(string itemName, string associatedProgramFullPath)
{
    //创建项：shell
    RegistryKey shellKey = Registry.ClassesRoot.OpenSubKey(@"directory\shell", true);
    if (shellKey == null)
    {
        shellKey = Registry.ClassesRoot.CreateSubKey(@"*\shell");
    }


    //创建项：右键显示的菜单名称
    RegistryKey rightCommondKey = shellKey.CreateSubKey(itemName);
    RegistryKey associatedProgramKey = rightCommondKey.CreateSubKey("command");


    //创建默认值：关联的程序
    associatedProgramKey.SetValue("", associatedProgramFullPath);




    //刷新到磁盘并释放资源
    associatedProgramKey.Close();
    rightCommondKey.Close();
    shellKey.Close();
}
```
