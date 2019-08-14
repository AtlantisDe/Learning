# Err

- [无法在 web 服务器上启动调试，iis 未列出与打开的 URL 匹配的网站](https://www.cnblogs.com/yankyblogs/p/8477821.html)

## 发布网站常遇到错误

### 未能加载文件或程序集“Aleseospace”或它的某一个依赖项。试图加载格式不正确的程序

- 原因 可能是程序集指定 X86 运行平台,而 IIS 程序池没有设置为 32 位改过来就行

### iis 启动 服务无法在此时接受控制信息。 (异常来自

- 服务: services.msc 未启动,进入服务,修改为自动启动.可能关闭 DEP 时候自动关闭了这个服务了!
- [:iis 启动 服务无法在此时接受控制信息](https://yq.aliyun.com/articles/676516)
