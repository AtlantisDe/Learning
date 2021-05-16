# DOS

## 常用

### 1. 删除文件夹内全部文件

```c#
del D:\Tmp\Dos\*.* /f/s/q/a

del G:\0\*.* /f/s/q/a pause
// 其中G:\0是需要删除的文件夹绝对路径，可根据实际更改
```

### 2. 复制指定文件夹内文件全部到目标文件夹内

```c#
// copy
/c xcopy "D:\Tmp\Dos\1\*.*" "D:\Tmp\Dos\2" /y & exit

xcopy "D:\Tmp\Dos\1\*.*" "D:\Tmp\Dos\2" /y & exit

xcopy "D:\Tmp\Dos\1\*.*" "D:\Tmp\Dos\2" /y
```
