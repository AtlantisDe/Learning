# VS.FAQ

## FAQ

### 1. 项目类

#### 1. 项目加载失败

```c#
// 可能原因:Web 应用程序项目 DemoRegmanagement 已配置为使用 IIS。  未能找到 Web 服务器“http://127.0.0.1:11201/”。
// 解决方案: IIS上建立对应调试站点即可

```

#### 2. VS 重置开发环境的方法

```c#
// 重置Visual Studio 即可
devenv.exe /setup /resetuserdata /resetsettings
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

#### 5. 无法从 COM 上下文 0x7ca30ec0 转换为 COM 上下文 0x7ca30d98，这种状态已持续 60

- [转换为 COM 上下文 0xece486f8， 这种状态已持续 60 秒” - 大型电灯泡 - 博客园](https://www.cnblogs.com/zhangne/p/10857481.html)
- [ContextSwitchDeadlock](https://blog.csdn.net/qqq1994_0810/article/details/83151621)

```c#
托管调试助手 "ContextSwitchDeadlock":“CLR 无法从 COM 上下文 0x7ca30ec0 转换为 COM 上下文 0x7ca30d98，这种状态已持续 60
```

#### 6. 关于开发类库后使用无法看到注释的解决方法

- [关于开发类库后使用无法看到注释的解决方法](https://blog.csdn.net/qq_22683623/article/details/53868696)

```c#
// 具体设置是：项目右键—>属性—>生成—>XML文档文件选中再编译
// 引用动态类库时，把类库和同名的xml文件放到同一个文件夹内即可。
```

#### 7. Solution: Could not load file or assembly 'System.Net.Http, Version=4.2.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a' or one of its dependencies. The system cannot find the file specified

- [Could not load file or assembly &quot;System.Net.Http, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a&quot;](https://stackoverflow.com/questions/38408167/could-not-load-file-or-assembly-system-net-http-version-4-0-0-0-culture-neutr)
- [a&#39; or one of its dependencies. The system cannot find the file specified.](https://coderjony.com/blogs/solution-could-not-load-file-or-assembly-systemnethttp-version-4200-culture-neutral-publickeytoken-b03f5f7f11d50a3a-or-one-of-its-dependencies-the-system-cannot-find-the-file-specified/)

```c#
// Solution: Could not load file or assembly 'System.Net.Http, Version=4.2.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a' or one of its dependencies. The system cannot find the file specified.


// Solution:
// Just add below configuration in the web.config or app.config of your startup project.

// 自己的解决方案是,确保代码没问题情况下,直接删除整个App.config下面的runtime配置

  <runtime>

  </runtime>

```
