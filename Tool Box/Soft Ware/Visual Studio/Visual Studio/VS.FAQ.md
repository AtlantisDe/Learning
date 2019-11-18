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

#### 3. VS 中 Release 模式下生成去掉生成 pdb 文件

- [VS 中 Release 模式下生成去掉生成 pdb 文件](https://blog.csdn.net/pukuimin1226/article/details/51819738)
- 生成-->高级 中配置

#### 4. 怎么区分.net dll 编译时是 Debug 的还是 Release 的

- [怎么区分.net dll 编译时是 Debug 的还是 Release 的？ - %幻#影% - 博客园](https://www.cnblogs.com/cmblogs/p/6374261.html)

```c#
// Release编译的dll显示如下：
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
// 而Debug编译的dll将显示：
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.Default | DebuggableAttribute.DebuggingModes.DisableOptimizations | DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints | DebuggableAttribute.DebuggingModes.EnableEditAndContinue)]

```
