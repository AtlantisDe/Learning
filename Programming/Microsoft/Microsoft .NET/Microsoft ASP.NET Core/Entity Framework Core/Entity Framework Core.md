# Entity Framework Core

- [Entity Framework Core 工具参考 - EF Core](https://docs.microsoft.com/zh-cn/ef/core/cli/)
- [迁移概述 - EF Core](https://docs.microsoft.com/zh-cn/ef/core/managing-schemas/migrations/?tabs=dotnet-core-cli)

## 1. Github

- [aspnet/EntityFrameworkCore](https://github.com/aspnet/EntityFrameworkCore)

## 2. Documentation on using EF Core

- [概述 - EF Core](https://docs.microsoft.com/zh-cn/ef/core/)

## 3. Installation | 安装工具 | 程序包管理器控制台

- [EF Core 工具参考 (程序包管理器控制台) -EF Core](https://docs.microsoft.com/zh-cn/ef/core/cli/powershell)

```c#

// 安装工具
// 首先，必须安装 EF Core 命令行工具：
// 我们通常建议使用 .NET Core CLI 工具，该工具适用于所有平台。
// 如果你更喜欢在 Visual Studio 内工作或你具有 EF6 迁移经验，还可以使用程序包管理器控制台工具。


Entity Framework Core
Package Manager Console


// 在 Package Manager console 中运行以下命令，安装包管理器控制台工具：
// PowerShell

Install-Package Microsoft.EntityFrameworkCore.Tools

// 在 Package Manager Console 中运行以下命令，更新这些工具。
// PowerShell

Update-Package Microsoft.EntityFrameworkCore.Tools


// 验证安装
// 通过运行以下命令验证是否已安装这些工具：
// PowerShell

Get-Help about_EntityFrameworkCore
```

## 4. 命令

```c#
1. 创建旧数据库模型
Add-Migration init

2. 创建新数据库模型
Add-Migration init2

3. 对比新旧数据库模型,生成新旧数据库的差异SQL,用生成的数据库SQL在数据库中运行
Script-Migration init init2


Add-Migration

init

Add-Migration init -Context DataContext


Add-Migration InitialCreate

Update-Database

Add-Migration AddBlogCreatedTimestamp

Update-Database



add-Migration Init -Context DefaultDbContext

update-database Init -Context DefaultDbContext
```

## 5. 重新阅读安装步骤 dotnet ef

- [EF Core 工具参考 ( .NET CLI) -EF Core](https://docs.microsoft.com/zh-cn/ef/core/cli/dotnet)
- [Dotnet Core EF CodeFirst 创建数据库和更新数据库 - Rookie_lee - 博客园](https://www.cnblogs.com/0819lsl/p/11144180.html)

```c#
1. 第一步
// dotnet ef 可以安装为全局或本地工具。 大多数开发人员偏向于使用以下命令将 dotnet ef 安装为全局工具：
dotnet tool install --global dotnet-ef

// 可使用以下命令调用工具: dotnet-ef
// 已成功安装工具“dotnet-ef”(版本“5.0.5”)。


// 若要将它用作本地工具，请使用工具清单文件恢复声明为工具依赖项的项目的依赖项。
// 使用以下命令更新工具：
dotnet tool update --global dotnet-ef

// PS C:\Users\AtlantisDe> dotnet tool update --global dotnet-ef
// 工具“dotnet-ef”已重新安装最新稳定版本(版本“5.0.5”)。

2. 第二步
// 你需要将包添加到特定项目上，然后才能使用这些工具 Microsoft.EntityFrameworkCore.Design 。

dotnet add package Microsoft.EntityFrameworkCore.Design

3. 第三步
// 验证安装
dotnet ef



```

## 6. EFCore2.0 Code First

- [EF Core 工具参考 ( .NET CLI) -EF Core](https://docs.microsoft.com/zh-cn/ef/core/cli/dotnet)
- [Dotnet Core EF CodeFirst 创建数据库和更新数据库 - Rookie_lee - 博客园](https://www.cnblogs.com/0819lsl/p/11144180.html)
- [EF Core 工具参考 (程序包管理器控制台) -EF Core](https://docs.microsoft.com/zh-cn/ef/core/cli/powershell)

```c#
// 项目安装的库:App 设置默认项目再操作

1. 第一步
Install-Package Microsoft.EntityFrameworkCore
Install-Package Microsoft.EntityFrameworkCore.SqlServer
Install-Package Microsoft.EntityFrameworkCore.Tools

2. 第二步


3. 第三步
// 验证安装
dotnet ef

// 项目安装的库:App.DataAccess 设置默认项目再操作
Install-Package Microsoft.EntityFrameworkCore.Design

1. 第一步:
Add-Migration Init  //其中Init是你的版本名称

2. 第二步:
Update-database Init //更新数据库操作 init为版本名称

3. 第三步



1. 创建旧数据库模型
Add-Migration Init

2. 创建新数据库模型
Add-Migration Init2

3. 对比新旧数据库模型,生成新旧数据库的差异SQL,用生成的数据库SQL在数据库中运行 (可更新线上库)
Script-Migration Init Init2
Script-Migration -Context DataContext


Update-Database -Context DataContext

```
