# CLI

## 停止应用程序池

- [How do you start/stop IIS 7 app pool from cmd line if there are spaces in the app pool name?](https://serverfault.com/questions/155973/how-do-you-start-stop-iis-7-app-pool-from-cmd-line-if-there-are-spaces-in-the-ap/155983)

```c#
%SYSTEMROOT%\System32\inetsrv\appcmd stop apppool /apppool.name:"Engine"
```
