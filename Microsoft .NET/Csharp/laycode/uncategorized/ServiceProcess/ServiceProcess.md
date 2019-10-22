# ServiceProcess

- [c#管理服务停止启动 - 做最好的自己 - CSDN 博客](https://blog.csdn.net/vince6799/article/details/7468432)

## 服务

### 服务状态

- ServiceControllerStatus 枚举 指示服务的当前状态

```c#
成员名称 说明
ContinuePending 服务即将继续。这对应于 Win32 SERVICE_CONTINUE_PENDING 常数，该常数定义为 0x00000005。
Paused 服务已暂停。这对应于 Win32 SERVICE_PAUSED 常数，该常数定义为 0x00000007。
PausePending 服务即将暂停。这对应于 Win32 SERVICE_PAUSE_PENDING 常数，该常数定义为 0x00000006。
Running 服务正在运行。这对应于 Win32 SERVICE_RUNNING 常数，该常数定义为 0x00000004。
StartPending 服务正在启动。这对应于 Win32 SERVICE_START_PENDING 常数，该常数定义为 0x00000002。
Stopped 服务未运行。这对应于 Win32 SERVICE_STOPPED 常数，该常数定义为 0x00000001。
StopPending 服务正在停止。这对应于 Win32 SERVICE_STOP_PENDING 常数，该常数定义为 0x00000003。
```