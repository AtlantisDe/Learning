# requireAdministrator

## Wiki

- [C#程序以管理员权限运行 - Cosmic_Spy - 博客园](https://www.cnblogs.com/Interkey/p/RunAsAdmin.html)
- [c#通过 app.manifest 使程序以管理员身份运行 - Avatarx - 博客园](https://www.cnblogs.com/lvdongjie/p/5440849.html)

## 代码

### 判断程序是否以管理员身份运行

- using System.Security.Principal;

```c#
/// <summary>
    /// 确定当前主体是否属于具有指定 Administrator 的 Windows 用户组
    /// </summary>
    /// <returns>如果当前主体是指定的 Administrator 用户组的成员，则为 true；否则为 false。</returns>
    public static bool IsAdministrator()
    {
        bool result;
        try
        {
            WindowsIdentity identity = WindowsIdentity.GetCurrent();
            WindowsPrincipal principal = new WindowsPrincipal(identity);
            result = principal.IsInRole(WindowsBuiltInRole.Administrator);

        }
        catch
        {
            result = false;
        }
        return result;
    }
```
