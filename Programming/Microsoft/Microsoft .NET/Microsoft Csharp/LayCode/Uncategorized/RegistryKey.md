# RegistryKey

- [RegistryKey Class (Microsoft.Win32)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.win32.registrykey?view=dotnet-plat-ext-3.1)
- [How To Find Path Of Installed Program(s) in C#](https://social.msdn.microsoft.com/Forums/windows/en-US/afb5012a-30f1-4b96-9931-a143fd76bab5/how-to-find-path-of-installed-programs-in-c?forum=winformssetup)

## 1. 常用

```c#
RegistryKey regKey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Windows\CurrentVersion\Uninstall");
string location = FindByDisplayName(regKey, "华彩人生1点通");

/// <summary>根据程序显示名称 获取安装目录路径</summary>
    public static string FindByDisplayName(RegistryKey parentKey, string name)
    {
        string[] nameList = parentKey.GetSubKeyNames();
        for (int i = 0; i < nameList.Length; i++)
        {
            RegistryKey regKey = parentKey.OpenSubKey(nameList[i]);
            try
            {
                var item = regKey.GetValue("DisplayName");
                if (item.IsNullOrEmpty())
                {
                    continue;
                }
                var nameshow = regKey.GetValue("DisplayName").ToString();

                if (nameshow == name)
                {
                    return regKey.GetValue("InstallLocation").ToString();
                }
                if (nameshow.Contains(name))
                {

                }
            }
            catch { }
        }
        return "";
    }


```
