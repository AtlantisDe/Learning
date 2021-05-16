# Example

- [MicrosoftDocs/visualstudio-docs](https://github.com/MicrosoftDocs/visualstudio-docs/blob/master/docs/msbuild/how-to-build-specific-targets-in-solutions-by-using-msbuild-exe.md)

## 常用

```c#
where MSBuild
C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe

msbuild SlnFolders.sln -target:NotInSlnfolder:Rebuild;NewFolder\InSolutionFolder:Clean
```
