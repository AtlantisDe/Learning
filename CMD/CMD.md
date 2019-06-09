# CMD

- [CMD：[1]在当前文件夹下打开 cmd 命令 - hhj187 - 博客园](https://www.cnblogs.com/hhj187/p/4721596.html)

## 常用命令

### 查看端口被占用情况

```bat
<!-- 查看指定的端口号 -->
netstat -ano | findstr "8088"
netstat -ano | findstr "8989"
```

## 电脑设备是否支持睡眠唤醒

- [电脑从待机唤醒后显示器没法唤醒](http://ask.zol.com.cn/x/1321603.html)

```c#
powercfg -a
```
