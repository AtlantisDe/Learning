# 复制文件

## 常用

### 1. 复制多个文件

```c#
/c
copy "D:\1.exe" "D:\12.exe" && copy "D:\2.exe" "D:\22.exe"
```

### 2. XCOPY 复制多个文件

- XCOPY 是 COPY 的扩展，可以把指定的目录连文件和目录结构一并拷贝，但不能拷贝系统文件

```c#
/c
// 例：xcopy 2.txt bbb /y 当目标有重名时强制复制，不再提醒。下图红色区域。
xcopy "D:\1.exe" "D:\12.exe" /y

```
