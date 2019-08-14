# Application error

- 应用程序错误

- [禁止 windows 服务器中烦人的应用程序错误弹出 - wine 的思考 - ITeye 博客](https://cavenfeng.iteye.com/blog/1030070)
- [组策略关闭 windows 程序崩溃禁止弹出错误报告的设置方法](http://www.07net01.com/linux/zucelueguanbiwindowschengxubengkuijinzhidanchucuowubaogaodeshezhifangfa_13901_1346903766.html)

## 修改注册表方法

```reg


设置注册表：



键值设置说明:

注册表键: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows
键值名称: ErrorMode
数据类型: REG_DWORD (DWORD Value)
数据内容:
(0 = all errors, 1 = application errors, 2 = no popups)

０：弹出所有错误

１：不弹出系统错误，只弹出应用程序错误

２：所有错误都不弹出
```
