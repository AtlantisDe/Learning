# taskkill

- [bat 结束启动进程](https://zhidao.baidu.com/question/567621054.html)

## 代码 1

```bat
@echo off
Echo 先等待7秒。。等待启动其他软件
ping 127.0.0.1 -n 7
Echo 正在杀死进程...
taskkill /f /im explorer.exe
echo 重启UI..
start Explorer.exe
```
