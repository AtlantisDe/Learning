# Microsoft.EntityFrameworkCore.Tools

- [NuGet Gallery
        | Packages matching Microsoft.EntityFrameworkCore.Tools](https://www.nuget.org/packages?q=Microsoft.EntityFrameworkCore.Tools)

```c#

```

## 0. Installation

```c#
Microsoft.EntityFrameworkCore
Microsoft.EntityFrameworkCore, Version=5.0.3.0


Microsoft.EntityFrameworkCore.Tools
Install-Package Microsoft.EntityFrameworkCore.Tools -Version 6.0.0-preview.2.21154.2

检查:
Get-Help about_EntityFrameworkCore


1. 创建旧数据库模型
Add-Migration init

2. 创建新数据库模型
Add-Migration init2

3. 对比新旧数据库模型,生成新旧数据库的差异SQL,用生成的数据库SQL在数据库中运行
Script-Migration init init2

```
