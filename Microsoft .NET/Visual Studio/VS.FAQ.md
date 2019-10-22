# VS.FAQ

## FAQ

### 1. 项目类

#### 1. 项目加载失败

```c#
// 可能原因:Web 应用程序项目 AleseoRegmanagement 已配置为使用 IIS。  未能找到 Web 服务器“http://127.0.0.1:11201/”。
// 解决方案: IIS上建立对应调试站点即可

```

#### 2. VS 重置开发环境的方法

```c#
devenv.exe /setup /resetuserdata /resetsettings，重置Visual Studio 即可
```
