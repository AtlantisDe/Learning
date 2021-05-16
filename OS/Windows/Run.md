# Run

- [Open CMD as admin with Windows&#x2B;R shortcut](https://superuser.com/questions/968214/open-cmd-as-admin-with-windowsr-shortcut)

```c#
%Temp%
%Prefetch%
```

## Run Command

- Win+R

```c#
// EDIT: It seems that the latest version of Windows 10 does offer support for ctrl+shift+enter at the Win+R dialog, so you can now use it there too.
ctrl+shift+enter
runas /user:Administator "cmd.exe"

// 计算机管理
compmgmt.msc
Temp
Prefetch
OptionalFeatures
appwiz.cpl
certlm.msc
%windir%\system32\services.msc
```
