# Err

- [无法在 web 服务器上启动调试，iis 未列出与打开的 URL 匹配的网站](https://www.cnblogs.com/yankyblogs/p/8477821.html)

## 发布网站常遇到错误

### 1. 未能加载文件或程序集“DemoTestspace”或它的某一个依赖项。试图加载格式不正确的程序

- 原因 可能是程序集指定 X86 运行平台,而 IIS 程序池没有设置为 32 位改过来就行

### 2. iis 启动 服务无法在此时接受控制信息。 (异常来自

- 服务: services.msc 未启动,进入服务,修改为自动启动.可能关闭 DEP 时候自动关闭了这个服务了!
- [:iis 启动 服务无法在此时接受控制信息](https://yq.aliyun.com/articles/676516)

### 3. IIS 网站某些端口设置可能受到系统保护,站点是不能启动成功的,不是占用状态也不会被请求成功,请熟知

### 4. HTTP 错误 500.19 - Internal Server Error

```c#
// 配置错误;不能在此路径中使用此配置节。如果在父级别上锁定了该节，便会出现这种情况。锁定是默认设置的(overrideModeDefault="Deny")，或者是通过包含 overrideMode="Deny" 或旧有的 allowOverride="false" 的位置标记明确设置的。

原因:应用程序开发功能:没有安装:ASP.NET 4.x (如:ASP.NET 4.8)

解决:安装后就好了.

```
