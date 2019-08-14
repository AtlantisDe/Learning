# MSBuild

- 如果你的机器上没有装有 VisualStudio，那么可以使用 MSBuild 来 build .sln 或 project。MSBuild 可以通过安装.NETFramework 来安装，一般的安装路径为 C:\Windows\Microsoft.NET\Framework。其实 devenv 执行 build 时候，后台也是调用 MSBuild 来 build 的。

```c#
示例:

       MSBuild MyApp.sln /t:Rebuild /p:Configuration=Release
       MSBuild MyApp.csproj /t:Clean
                            /p:Configuration=Debug;TargetFrameworkVersion=v3.5
```

## 常用

- [使用 devenv/MSBuild 在命令行编译单个 project - iTech - 博客园](https://www.cnblogs.com/itech/archive/2011/12/22/2297587.html)

### 知识点

#### 1. MSBuild.exe 路径

```c#
C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe
C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\MSBuild.exe

"C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe" "D:\demo.sln" /p:DeployOnBuild=true /p:PublishProfile="D:\demo1\Properties\PublishProfiles\Release.x64.pubxml"

"C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\MSBuild.exe" "D:\demo.sln" /p:DeployOnBuild=true /p:PublishProfile="D:\demo1\Properties\PublishProfiles\Release.x64.pubxml"
```

#### 9. 帮助文档

```c#
C:\Windows\System32>msbuild - ?
用于 .NET Framework 的 Microsoft (R) 生成引擎版本 15.9.21+g9802d43bc3
版权所有(C) Microsoft Corporation。保留所有权利。

MSBUILD : error MSB1001: 未知开关。
开关:-

若要显示开关的语法，请键入“MSBuild /help”

C:\Windows\System32>msbuild -h
用于 .NET Framework 的 Microsoft (R) 生成引擎版本 15.9.21+g9802d43bc3
版权所有(C) Microsoft Corporation。保留所有权利。

语法:              MSBuild.exe [选项] [项目文件 | 目录]

描述:         在项目文件中生成指定的目标。如果
                    未指定项目文件，MSBuild 将搜索
                    当前工作目录来查找文件
                    扩展名以“proj”结尾的文件并使用该文件。如果
                     如果指定了目录，MSBuild 将搜索此
                     目录来查找项目文件。

开关:

  /target:<targets> 在此项目中生成这些目标。使用分号或
                    逗号分隔多个目标，或者分别指定
                    每个目标。(缩写: /t)
                    示例:
                      /target:Resources;Compile

  /property:= 设置或重写这些项目级属性。<n> 是
                    属性名，<v> 为属性值。请使用
                    分号或逗号分隔多个属性，或者
                    分别指定每个属性。(缩写: /p)
                    示例:
                      /property:WarningLevel=2;OutDir=bin\Debug\

  /maxcpucount[:n]   指定用于生成的最大
                    并发进程数。如果未使用开关，则使用的默认值
                    为 1。如果使用开关时不带值，
                    MSBuild 将最多使用计算机上的
                    处理器数。(缩写: /m[:n])

  /toolsversion:<version>
                    要在生成过程中使用的 MSBuild 工具集(任务、目标等)
                    的版本。此版本将重写
                    个别项目指定的版本。(缩写:
                    /tv)
                    示例:
                      /toolsversion:3.5

  /verbosity:<level> 在事件日志中显示此级别的信息量。
                    可用的详细级别有: q[uiet]、m[inimal]、
                    n[ormal]、d[etailed] 和 diag[nostic]。(缩写: /v)
                    示例:
                      /verbosity:quiet

  /consoleloggerparameters:<parameters>
                     控制台记录器的参数。(缩写: /clp)
                     可用的参数有:
                        PerformanceSummary -- 显示在任务、目标和项目上
                            花费的时间。
                        Summary -- 结束时显示错误和警告的摘要。
                        NoSummary -- 结束时不显示错误和警告
                            的摘要。
                        ErrorsOnly -- 仅显示错误。
                        WarningsOnly -- 仅显示警告。
                        NoItemAndPropertyList -- 在开始生成每个项目时不显示
                            项和属性的列表。
                        ShowCommandLine -- 显示 TaskCommandLineEvent 消息
                        ShowTimestamp -- 将时间戳作为所有消息的前缀
                            显示。
                        ShowEventId -- 显示已开始事件、已完成事件和消息
                            的事件 ID
                        ForceNoAlign -- 不将文本与控制台缓冲区的大小
                            匹配
                        DisableConsoleColor -- 将默认控制台颜色
                            用于所有记录消息。
                        DisableMPLogging -- 在非多处理器
                            模式下运行时，禁用输出的多处理器
                            日志记录样式。
                        EnableMPLogging -- 即使在非多处理器
                            模式下运行，也启用多处理器
                            日志记录样式。默认情况下启用此日志记录样式。
                        ForceConsoleColor -- 使用 ANSI 控制台颜色，即使
                            控制台不支持它
                        Verbosity -- 重写此记录器的 /verbosity
                            设置。
                     示例:
                        /consoleloggerparameters:PerformanceSummary;NoSummary;
                                                 Verbosity=minimal

  /noconsolelogger  禁用默认控制台记录器，并且不将事件
                    记录到控制台。(缩写: /noconlog)

  /fileLogger[n]     将生成输出记录到文件中。默认情况下，
                    该文件在当前目录中，名称为
                    "msbuild[n].log"。所有节点中的事件合并到
                    单个日志中。fileLogger 的文件和
                    其他参数的位置可以通过添加
                    "/fileLoggerParameters[n]" 开关来指定。
                    "n" (如果存在)可以为 1-9 的数字，允许最多附加
                    10 个文件记录器。(缩写: /fl[n])

  /fileloggerparameters[n]:<parameters>
                    为文件记录器提供任何额外的参数。
                    存在此开关意味着
                    存在对应的 /filelogger[n] 开关。
                    "n" (如果存在)可以为 1-9 的数字。
                    任何分布式文件记录器也可以使用 /fileloggerparameters，
                    具体可参阅 /distributedFileLogger 的说明。
                    (缩写: /flp[n])
                    为控制台记录器列出的相同参数
                    可用。某些其他可用参数有:
                       LogFile -- 生成日志将写入其中的
                           日志文件的路径。
                       Append -- 确定是将生成日志附加到日志文件，
                           还是覆盖日志文件。如果设置此
                           开关，则会将生成日志附加到日志文件；
                           如果不设置此开关，则会覆盖
                           现有日志文件的内容。
                           默认值为不附加到日志文件。
                       Encoding -- 指定文件的编码，
                           例如，UTF-8、Unicode 或 ASCII
                    默认的详细级别为 Detailed。
                    示例:
                      /fileLoggerParameters:LogFile=MyLog.log;Append;
                                          Verbosity=diagnostic;Encoding=UTF-8

                      /flp:Summary;Verbosity=minimal;LogFile=msbuild.sum
                      /flp1:warningsonly;logfile=msbuild.wrn
                      /flp2:errorsonly;logfile=msbuild.err

  /distributedlogger:<central logger>*<forwarding logger>
                    使用此记录器来记录 MSBuild 中的事件，向每个节点
                    附加不同的记录器实例。若要指定
                    多个记录器，请分别指定每个记录器。
                    (缩写 /dl)
                    <logger> 语法为:
                      [<logger class>,]<logger assembly>[;<logger parameters>]
                    <logger class> 语法为:
                      [<partial or full namespace>.]<logger class name>
                    <logger assembly> 语法为:
                      {<assembly name>[,<strong name>] | <assembly file>}
                    <logger parameters> 是可选的，并按键入的
                    形式原样传递给记录器。(缩写: /l)
                    示例:
                      /dl:XMLLogger,MyLogger,Version=1.0.2,Culture=neutral
                      /dl:MyLogger,C:\My.dll*ForwardingLogger,C:\Logger.dll

  /distributedFileLogger
                    将生成输出记录到多个日志文件，每个 MSBuild 节点
                    一个日志文件。这些文件的初始位置为
                    当前目录。默认情况下，这些文件名为
                    "MSBuild<nodeid>.log"。可通过添加
                    "/fileLoggerParameters" 开关来指定
                    这些文件的位置和 fileLogger 的其他参数。

                    如果日志文件名是通过 fileLoggerParameters
                    开关设置的，分布式记录器将使用 fileName 作为
                    模板并将节点 ID 附加到此 fileName
                    以便为每个节点创建一个日志文件。

  /logger:<logger> 使用此记录器来记录 MSBuild 中的事件。若要指定
                    多个记录器，请分别指定每个记录器。
                    <logger> 语法为:
                      [<logger class>,]<logger assembly>[;<logger parameters>]
                    <logger class> 语法为:
                      [<partial or full namespace>.]<logger class name>
                    <logger assembly> 语法为:
                      {<assembly name>[,<strong name>] | <assembly file>}
                    <logger parameters> 是可选的，并按键入的
                    形式原样传递给记录器。(缩写: /l)
                    示例:
                      /logger:XMLLogger,MyLogger,Version=1.0.2,Culture=neutral
                      /logger:XMLLogger,C:\Loggers\MyLogger.dll;OutputAsHTML

  /binaryLogger[:[LogFile=]output.binlog[;ProjectImports={None,Embed,ZipFile}]]
                     将所有生成事件序列化为压缩的二进制文件。
                     默认情况下该文件位于当前目录并且名为 "msbuild.binlog"。
                     二进制日志是生成过程的详细描述，
                     以后可将其于重新构建文本日志
                     并由其他分析工具所使用。
                     二进制日志通常比大多数详细的文本诊断级日志小 10 到 20 倍，
                     但它可以包含更多信息。
                     (缩写: /bl)

                     默认情况下，二进制记录器收集项目文件的源文本，
                     包括生成期间所有导入的
                     项目和目标文件。可选的
                     ProjectImports 开关控制此行为:


                      ProjectImports=None     - 不收集项目
                                                导入项。
                      ProjectImports=Embed    - 在日志文件中
                                                嵌入项目导入项。
                      ProjectImports=ZipFile  - 将项目文件保存到
                                                output.projectimports.zip，
                                                其中输出的名称
                                                与二进制日志文件名称相同。

                     ProjectImports 的默认设置为 Embed。
                     注意: 记录器不会收集非 MSBuild 源文件，
                     例如 .cs、.cpp 等。

                     可将 .binlog 文件以参数（而不是项目/解决方案）的形式传递给
                     msbuild.exe 对其进行“播放”。
                     其他记录器将接收日志文件中的信息，
                     就像原始的生成正在发生一样。
                     你可以通过以下网址阅读有关二进制文件及其用法的详细信息:
                     https://github.com/Microsoft/msbuild/wiki/Binary-Log

                     示例:
                       /bl
                       /bl:output.binlog
                       /bl:output.binlog;ProjectImports=None
                       /bl:output.binlog;ProjectImports=ZipFile
                       /bl:..\..\custom.binlog
                       /binaryLogger

  /warnaserror[:code[;code2]]
                     视为错误的警告代码列表。使用分号
                     或逗号分隔多个警告代码。将所有
                     警告视为错误，使用没有值的开关
                     (缩写: /err[:c;[c2]])

                     示例:
                       /warnaserror:MSB4130

                     当警告被视为错误时，目标将
                     当作警告继续执行，但是整个
                     生成将失败。

  /warnasmessage[:code[;code2]]
                     视为低重要性消息的警告代码列表。
                     使用分号或逗号分隔
                     多个警告代码。
                     (缩写: /nowarn[:c;[c2]])

                     示例:
                       /warnasmessage:MSB3026

  /validate          依据默认架构验证项目。(缩写:
                    /val)

 /validate:<schema> 依据指定的架构验证项目。(缩写:
                    /val)
                    示例:
                      /validate:MyExtendedBuildSchema.xsd

  /ignoreprojectextensions:<extensions>
                    确定要生成的项目文件时要忽略的
                    扩展名的列表。使用分号或逗号来分隔
                    多个扩展名。
                    (缩写: /ignore)
                    示例:
                      /ignoreprojectextensions:.sln

  /nodeReuse:<parameters>
                    启用或禁止重复使用 MSBuild 节点。
                    参数包括:
                    True -- 生成完成后节点将保留，
                           并且将由后面的生成重复使用(默认)
                    False -- 生成完成后节点将不会保留
                    (缩写: /nr)
                    示例:
                      /nr:true

  /preprocess[:file]
                    通过嵌入将在生成过程中导入的
                    所有文件并标记其边界，
                    创建一个聚合的项目文件。这对于
                    了解导入什么文件、从何处导入以及
                    这些文件在生成中的构成
                    非常有用。默认情况下，输出将写入
                    控制台窗口。如果提供输出文件的路径，
                    则将改用该路径。
                    (缩写: /pp)
                    示例:
                      /pp:out.txt

  /detailedsummary
                    在生成的结尾显示有关
                    所生成的配置以及如何向节点安排
                    这些配置的详细信息。
                    (缩写: /ds)

  /restore[:True|False]
                     在生成其他目标前，运行名为 Restore 的目标。
                     当系统树需要先将包还原才能生成包时，
                     将会用到此操作。
                     指定 /restore 与指定
                     /restore:True 等同。请使用此参数
                     替代来自响应文件的值。
                     (缩写: /r)

  /restoreProperty:<n>=<v>
                     在还原期间仅设置或重写这些项目级
                     属性并且不使用通过
                     /property 参数指定的属性。<n> 是属性
                     名，<v> 是属性值。请使用
                     分号或逗号分隔多个属性，
                     或分别指定每个属性。
                     (缩写: /rp)
                     示例:
                       /restoreProperty:IsRestore=true;MyProperty=value

  /profileevaluation:<file>
                     解析 MSBuild 评估并将结果写入
                     指定文件。如果指定文件的扩展名
                     为“.md”，则结果将以 markdown 格式
                     生成。否则，将生成制表符分隔文件。

  @<file>            从文本文件插入命令行设置。若要指定
                    多个响应文件，请分别指定每个响应
                    文件。

                    自动从以下位置使用任何名为 "msbuild.rsp" 的
                    响应文件:
                    (1) msbuild.exe 的目录
                    (2) 生成的第一个项目或解决方案的目录

  /noautoresponse  不自动包括任何 MSBuild.rsp 文件。(缩写:
                    /noautorsp)

  /nologo      不显示启动版权标志和版权消息。

  /version      仅显示版本信息。(缩写: /ver)

  /help       显示此用法消息。(缩写: /? 或 /h)

示例:

       MSBuild MyApp.sln /t:Rebuild /p:Configuration=Release
       MSBuild MyApp.csproj /t:Clean
                            /p:Configuration=Debug;TargetFrameworkVersion=v3.5


```
