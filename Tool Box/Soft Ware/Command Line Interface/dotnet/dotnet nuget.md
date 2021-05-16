# dotnet nuget

- dotnet nuget push - 将包推送到服务器，并将其发布。

## 常用

```c#
// 摘要Synopsis
dotnet nuget push [<ROOT>] [-d|--disable-buffering] [--force-english-output] [--interactive] [-k|--api-key] [-n|--no-symbols]
    [--no-service-endpoint] [-s|--source] [-sk|--symbol-api-key] [-ss|--symbol-source] [-t|--timeout]
dotnet nuget push [-h|--help]


dotnet nuget push -h

net nuget push foo.nupkg -k 4003d786-cc37-4004-bfdf-c4f3e8ef9b3a

dotnet nuget push *.nupkg
```
