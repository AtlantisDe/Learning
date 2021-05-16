# devenv

## VS 2017 的开发人员命令提示符

- [VS2017 Web 发布文件系统的命令行 - smallsusu 的专栏 - CSDN 博客](https://blog.csdn.net/smallsusu/article/details/86512369)
- [visual studio 命令行 build - kasteluo 的专栏 - CSDN 博客](https://blog.csdn.net/kasteluo/article/details/77246388)
- [使用 devenv 命令编译一个项目中的某个工程 - huanghuangYY 的专栏 - CSDN 博客](https://blog.csdn.net/huanghuangyy/article/details/83414260)
- [使用 devenv/MSBuild 在命令行编译 sln 或 csproj - 宋兴柱 - 博客园](https://www.cnblogs.com/songxingzhu/p/5242159.html)

### cmdline

- 经验之谈 如果 VS 用管理员方式打开项目.系统默认会用 Administrator 账户导入秘钥
- 此时只需要,以管理员 VS 2017 的开发人员命令提示符 运行即可编译

#### 0. Common7\IDE 路径

```c#
// Command
C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\devenv.com

// Working Dir
C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise

```

#### 1. 编译命令

```c#

msbuild 工程目录\yourWebApplication.csproj "/P:DeployOnBuild=True;PublishProfile=FolderProfile"

devenv E:/xx/yy/zz.sln /Rebuild "Release|Win32"
devenv E:/xx/yy/zz.sln /build "Debug|Win32"
devenv E:/xx/yy/zz.sln /build "Release|x64"
devenv.com E:/xx/yy/zz.sln /Rebuild "Release|Win32"
devenv.com E:/xx/yy/zz.sln /build "Debug|Win32"
devenv.com E:/xx/yy/zz.sln /build "Release|x64"

devenv.com -h
devenv.com "D:\demo.sln" /Build "Release|x64" /project "D:\demo.csproj"

// 使用devenv来build一个.sln的实例：
devenv d:\Build\MyProject\Src\MyProject.sln /Build "Release|Win32"

// 使用devenv来build一个.sln中的某个的实例：
devenv.exe d:\Build\MyProject\Src\NyProject.sln /build "Release|Win32" /Project MyProject1
devenv.exe d:\Build\MyProject\Src\NyProject.sln /build "Release|Win32" /Project MyProject1 /Project MyProject2

msbuild "D:\demo.sln" /p:DeployOnBuild=true /p:PublishProfile="D:\demo1\Properties\PublishProfiles\Release.x64.pubxml"

// 注意：通常地.sln中的多个Projects间有依赖关系，所以虽然你只是build一个.sln中的某个Project，但是还是需要指定Project所在.sln，然后通过/Project来指定Project的名字。

// 如果只是单个的Project，没有引用其他的projects，这个时候可以不指定.sln，直接build Project，如下实例：
devenv d:\Build\MyProject\Src\MyProject.vcxproj /Build "Release|Win32"

// 注意此时实际上devenv做如下事：

// 此时devenv将在此project文件的父目录中查找与Project相同名字的.sln；
// 如果没有找到的话，然后查找其他的引用了此Project的.sln；
// 如果还是没有找到的话会创建临时的不保存的与Project同名的.sln。
```

#### 2. 帮助文档

- [Developer Command Prompt in Visual Studio Code Integrated Terminal](http://www.cazzulino.com/code-developer-command-prompt.html)

```c#
用法:
devenv [解决方案文件 | 项目文件 | 任意文件.扩展名] [开关]

devenv 的第一个参数通常是一个解决方案文件或项目文件。
如果您希望在编辑器中自动打开文件，
也可以使用任何其他文件作为第一个参数。当您输入项目文件时，IDE
会在项目文件的父目录中查找与该项目文件具有相同
基名称的 .sln 文件。如果不存在这样的 .sln 文件，
IDE 将查找引用该项目的单个 .sln 文件。如果不存在这样的单个
.sln 文件，则 IDE 将创建一个具有默认 .sln 文件名的未保存
的解决方案，其基名称与项目文件的基名称相同。

命令行生成:
devenv 解决方案文件.sln /build [ 解决方案配置 ] [ /project 项目名称或文件 [ /projectconfig 名称 ] ]
可用的命令行开关:

/Build          使用指定的解决方案配置生成解决方案或
                项目。例如“Debug”。如果可能存在多个平台，
                则配置名称必须用引号括起来
                并且包含平台名称。例如“Debug|Win32”。
/Clean          删除生成结果。
/Command        启动 IDE 并执行该命令。
/Deploy         生成并部署指定的生成配置。
/Edit           在此应用程序的运行实例中打开
                指定文件。如果没有正在运行的实例，
                则启动一个具有简化窗口布局的新实例。
/LCID           设置 IDE 中用于用户界面的默认语言。
/Log            将 IDE 活动记录到指定的文件以用于疑难解答。
/NoVSIP         禁用用于 VSIP 测试的 VSIP 开发人员许可证密钥。
/Out            将生成日志追加到指定的文件中。
/Project        指定生成、清理或部署的项目。
                必须和 /Build、/Rebuild、/Clean 或 /Deploy 一起使用。
/ProjectConfig  重写解决方案
                配置中指定的项目配置。例如“Debug”。如果可能存在
                多个平台，则配置名称必须用引号括起来
                并包含平台名称。例如“Debug|Win32”。
                必须和 /Project 一起使用。
/Rebuild        先清理，然后使用指定配置生成
                解决方案或项目。
/ResetSettings  恢复 IDE 的默认设置，还可以重置为
                指定的 VSSettings 文件。
/ResetSkipPkgs  清除所有添加到 VSPackages 的 SkipLoading 标记。
/Run            编译并运行指定的解决方案。
/RunExit        编译并运行指定的解决方案然后关闭 IDE。
/SafeMode       以安全模式启动 IDE，加载最少数量的窗口。
/Upgrade        升级项目或解决方案以及其中的所有项目。
                并相应地创建这些文件的备份。 有关备份
                过程的详细信息，请参见
                “Visual Studio 转换向导”上的帮助。

产品特定的开关:

/debugexe       打开要调试的指定可执行文件。将
                命令行的剩余部分作为参数传递给此可执行文件。
/diff           比较两个文件。 采用四个参数:
                SourceFile、TargetFile、SourceDisplayName (可选)、
                TargetDisplayName (可选)
/sqldbaction    启动 SQL Server Data Tools并执行参数字符串中指定的操作。
/TfsLink        打开团队资源管理器并为提供的项目 URI 启动查看器
                (如果注册了项目 URI)。
 /useenv                使用 PATH、INCLUDE、LIBPATH 和 LIB 环境变量
                而不是使用 VC++ 生成的 IDE 路径。

要从命令行附加调试器，请使用:
        VsJITDebugger.exe -p <pid>
```

#### 3. devenv 命令编译一个项目中的某个工程

```c#
e.g.

$devenv = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\devenv.com"
&$devenv "C:\SoftwareCollectionMap\ColdStream\2.0\Main\Test\UI\UITest\UIAutomation.sln" /Build "Debug" /project "C:\SoftwareCollectionMap\ColdStream\2.0\Main\Test\UI\UITest\UIAutomation\UIAutomation.csproj"
```

#### 4. Deployment

- In the Windows 8 Start page, search for Developer Command Prompt for VS2012.
- Right-click the icon for Developer Command Prompt for VS2012 and click Run as administrator.

- [ASP.NET Web Deployment using Visual Studio: Command Line Deployment](https://docs.microsoft.com/en-us/aspnet/web-forms/overview/deployment/visual-studio-web-deployment/command-line-deployment)

```c#
msbuild C:\ContosoUniversity\ContosoUniversity.sln /p:DeployOnBuild=true /p:PublishProfile=Test
msbuild C:\ContosoUniversity\ContosoUniversity\ContosoUniversity.csproj /p:DeployOnBuild=true /p:PublishProfile=Test /p:VisualStudioVersion=11.0
msbuild C:\ContosoUniversity\ContosoUniversity.sln /p:DeployOnBuild=true /p:PublishProfile=C:\ContosoUniversity\ContosoUniversity\Properties\PublishProfiles\Test.pubxml

msbuild "D:\demo.sln" /p:DeployOnBuild=true /p:PublishProfile="D:\demo1\Properties\PublishProfiles\Release.x64.pubxml"

```

#### 5. /Deploy (devenv.exe)

- [-Deploy (devenv.exe) - Visual Studio](https://docs.microsoft.com/en-us/visualstudio/ide/reference/deploy-devenv-exe?view=vs-2019)

```c#
devenv SolutionName /Deploy [SolnConfigName [/Project ProjName [/ProjectConfig ProjConfigName]] [/Out OutputFilename]]
// Example
devenv "%USERPROFILE%\source\repos\MySolution\MySolution.sln" /deploy Release /project "CSharpWinApp\CSharpWinApp.csproj" /projectconfig Release
```

#### 6. Deploy to a local folder

- [Deploy to a local folder - Visual Studio](https://docs.microsoft.com/en-us/visualstudio/deployment/quickstart-deploy-to-local-folder?view=vs-2019)

```c#
devenv SolutionName /Deploy [SolnConfigName [/Project ProjName [/ProjectConfig ProjConfigName]] [/Out OutputFilename]]
// Example
devenv "%USERPROFILE%\source\repos\MySolution\MySolution.sln" /deploy Release /project "CSharpWinApp\CSharpWinApp.csproj" /projectconfig Release
```

### 常遇到错误

#### 删除旧秘钥

```c#
Summary:

Start the developer command prompt as administrator, otherwise you'll get a misleading error saying the container doesn't exist.
Run sn -d VS_KEY_XXXXXXXXXXX to remove the old key.
You should now be able to reinstall the certificate.

```

#### 无法导入以下密钥文件

- [Visual Studio 要求导入 pfx 密钥以及导入后依然要求导入的解决办法](https://void2.dev/visual-studio-pfx-import/)
- [解决 Visual Studio “无法导入以下密钥文件” 错误 - 朝扬 - 博客园](https://www.cnblogs.com/BeyondWJsel/archive/2013/03/07/2948405.html)
- [解决 Visual Studio:\&quot;无法导入以下密钥文件: xxxx.pfx,该密钥文件可能受密码保护\&quot;](https://www.jianshu.com/p/3d02f0fe546f)

```c#
// 要解决此问题:

// 打开Visual Studio 命令提示(2010): 开始->Microsoft Visual Studio 2010->Visual Studio Tools->Visual Studio 命令提示(2010)
// cd到当前pfx目录
// 输入下面的命令:sn -i [Common].pfx [VS_KEY] 例如: sn -i SamplePlugin.pfx VS_KEY_ 1110CommonPlugin
// 输入密码pfx密码就可以了

// 例如:
cd /d "C:\administrator\My Documents\Visual Studio 2010\Projects\KeyPro"

输入下面的命令:
sn -d VS_KEY_XXXXXXXXXXX
// 如果在删除密钥时获得以下报错：容器不存在 Container does not exist 这是由于系统中另外某个账户已经导入了密钥，在当前账户中无法对其进行移除。可以尝试登录到早先导入密钥的用户账户对密钥进行移除，然后再切换到要进行 项目 build 的账户重新导入密钥即可。
sn -i [CertName].pfx [VS_KEY]

// 例如:
sn -i xxxx.pfx VS_KEY_A5A29909FF6D902D
// 证书名称 和VS_KEY 要依据项目证书而定

// 4.输入密码pfx密码
```

#### 发现同一依赖程序集的不同版本间存在冲突

- [发现同一依赖程序集的不同版本之间存在冲突，如何定位问题？*已解决*博问 博客园](https://q.cnblogs.com/q/68799/)
- 如果偷懒的话，直接在 web.config 中进行 assembly binding redirect，不需要定位，比如：

```c#
// C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\Microsoft.Common.CurrentVersion.targets(2110,5): warning MSB3247: 发现同一依赖程序集的不同版本间存在冲突。在 Visual Studio 中，请双击此警告(或选择此警告并按 Enter)以修复冲突；否则，请将以 下绑定重定向添加到应用程序配置文件中的“runtime”节点: <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1"><dependentAssembly><assemblyIdentity name="System.ValueTuple" culture="neutral" publicKeyToken="cc7b13ffcd2ddd51" /><bindingRedirect oldVersion="0.0.0.0-4.0.3.0" newVersion="4.0.3.0" /></dependentAssembly></assemblyBinding><assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1"><dependentAssembly><assemblyIdentity name="System.Runtime.CompilerServices.Unsafe" culture="neutral" publicKeyToken="b03f5f7f11d50a3a" /><bindingRedirect oldVersion="0.0.0.0-4.0.4.1" newVersion="4.0.4.1" /></dependentAssembly></assemblyBinding>

<runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="HtmlAgilityPack" publicKeyToken="bd319b19eaf3b43a" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-1.11.12.0" newVersion="1.11.12.0" />
      </dependentAssembly>
    </assemblyBinding>

    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="System.ValueTuple" culture="neutral" publicKeyToken="cc7b13ffcd2ddd51" />
        <bindingRedirect oldVersion="0.0.0.0-4.0.3.0" newVersion="4.0.3.0" />
      </dependentAssembly>
    </assemblyBinding>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="System.Runtime.CompilerServices.Unsafe" culture="neutral" publicKeyToken="b03f5f7f11d50a3a" />
        <bindingRedirect oldVersion="0.0.0.0-4.0.4.1" newVersion="4.0.4.1" />
      </dependentAssembly>
    </assemblyBinding>

  </runtime>

```
