# .sln 和.csproj

-[初学 C#，总结一下.sln 和.csproj 的区别](https://blog.csdn.net/han_better/article/details/64140875)

## 这台计算机上缺少此项目引用的 NuGet 程序包。使用“NuGet 程序包还原”可下载这些程序包 手动解决方案

```C#
# 1.打开项目配置文件Demo.csproj
# 2.把相关的导入包信息删除,然后再重新下载,或者手动配置计算机上有的包即可.
# 例如一下信息重删除...
<Import Project="..\packages\cef.redist.x86.3.3578.1870\build\cef.redist.x86.props" Condition="Exists('..\packages\cef.redist.x86.3.3578.1870\build\cef.redist.x86.props')" />
<Import Project="..\packages\CefSharp.Common.71.0.2\build\CefSharp.Common.props" Condition="Exists('..\packages\CefSharp.Common.71.0.2\build\CefSharp.Common.props')" />
<Import Project="..\packages\cef.redist.x64.3.3578.1870\build\cef.redist.x64.props" Condition="Exists('..\packages\cef.redist.x64.3.3578.1870\build\cef.redist.x64.props')" />
<Import Project="..\packages\CefSharp.WinForms.71.0.2\build\CefSharp.WinForms.props" Condition="Exists('..\packages\CefSharp.WinForms.71.0.2\build\CefSharp.WinForms.props')" />



<Error Condition="!Exists('..\packages\cef.redist.x64.3.3578.1870\build\cef.redist.x64.props')" Text="$([System.String]::Format('$(ErrorText)', '..\packages\cef.redist.x64.3.3578.1870\build\cef.redist.x64.props'))" />
<Error Condition="!Exists('..\packages\cef.redist.x86.3.3578.1870\build\cef.redist.x86.props')" Text="$([System.String]::Format('$(ErrorText)', '..\packages\cef.redist.x86.3.3578.1870\build\cef.redist.x86.props'))" />
<Error Condition="!Exists('..\packages\CefSharp.Common.71.0.2\build\CefSharp.Common.props')" Text="$([System.String]::Format('$(ErrorText)', '..\packages\CefSharp.Common.71.0.2\build\CefSharp.Common.props'))" />
<Error Condition="!Exists('..\packages\CefSharp.Common.71.0.2\build\CefSharp.Common.targets')" Text="$([System.String]::Format('$(ErrorText)', '..\packages\CefSharp.Common.71.0.2\build\CefSharp.Common.targets'))" />
<Error Condition="!Exists('..\packages\CefSharp.WinForms.71.0.2\build\CefSharp.WinForms.props')" Text="$([System.String]::Format('$(ErrorText)', '..\packages\CefSharp.WinForms.71.0.2\build\CefSharp.WinForms.props'))" />
<Error Condition="!Exists('..\packages\CefSharp.WinForms.71.0.2\build\CefSharp.WinForms.targets')" Text="$([System.String]::Format('$(ErrorText)', '..\packages\CefSharp.WinForms.71.0.2\build\CefSharp.WinForms.targets'))" />

<Import Project="..\packages\CefSharp.Common.71.0.2\build\CefSharp.Common.targets" Condition="Exists('..\packages\CefSharp.Common.71.0.2\build\CefSharp.Common.targets')" />
<Import Project="..\packages\CefSharp.WinForms.71.0.2\build\CefSharp.WinForms.targets" Condition="Exists('..\packages\CefSharp.WinForms.71.0.2\build\CefSharp.WinForms.targets')" />
```
