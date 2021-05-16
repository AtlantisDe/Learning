# chcp

## 常用

```c#
chcp 437 更改为英文
chcp 936 更改为简体中文
chcp 65001
mode con cp select=437
mode con cp /status
chcp
cmd /c "chcp 437 >null && schtasks /query" |select-string $TaskName  -Encoding default -quiet
cmd /c "chcp 437 Pause"
```
