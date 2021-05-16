# VMware Workstation

- [Workstation Pro - VMware Products : Windows Virtualization for Everyone](https://www.vmware.com/asean/products/workstation-pro.html)
- [Workstation 15.5 Pro for Windows](https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html)
  )
- [VM ware 无法关机 虚拟机繁忙](https://blog.csdn.net/qq_34646546/article/details/86561183)

## 1. Workstation for Windows

```c#
https://www.vmware.com/go/getworkstation-win
```

## 2. Workstation for Linux

## 3. 常见虚拟机问题与解决方案

### 1. VMware Workstation 与 Device/Credential Guard 不兼容

- 原因:大致是 VMware 和 Hyper-V 不兼容导致。 如安装了 Windows Sandbox 或者 Hyper-V
- [VMware Knowledge Base](https://kb.vmware.com/s/article/2146361)
- [解决 VM 与 Device/Credential Guard 不兼容。在禁用 Device/Credential Guard 后，可以运行 VM 的方法](https://blog.csdn.net/qq_36761831/article/details/81175736)

```c#
"VMware Workstation and Device/Credential Guard are not compatible" error in VMware Workstation on Windows 10 host (2146361)

// VMware Workstation 与 Device/Credential Guard 不兼容。在禁用 Device/Credential Guard 后，可以运行 VMware Workstation。有关更多详细信息，
// 请访问 http://www.vmware.com/go/turnoff_CG_DG。

解决方法：

步骤一：禁用Device Guard或Credential Guard：

// 禁用用于启用Credential Guard的组策略设置。
// 在主机操作系统上，右键单击“开始” > “运行”，键入gpedit.msc，然后单击“ 确定”。本地组策略编辑器打开。
// 转至本地计算机策略 > 计算机配置 > 管理模板>系统 >Device Guard（或者是： 设备防护） > 启用基于虚拟化的安全性。
// 选择已禁用。

// 转到“ 控制面板” >“ 卸载程序” >“ 打开或关闭Windows功能”以关闭Hyper-V。
// 选择不重启。
步骤二：通过命令关闭Hyper-V（控制面板关闭Hyper-V起不到决定性作用，要彻底关闭Hyper-V）

//         以管理员身份运行Windows Powershell (管理员)（Windows键+X）

//         运行下面命令并重启电脑：
bcdedit /set hypervisorlaunchtype off
```

### 2. V 如何在虚拟机 Vmware 设置用 u 盘启动

- [如何在虚拟机 Vmware 设置用 u 盘启动-百度经验](https://jingyan.baidu.com/article/cbf0e5004d83022eaa289321.html)
