# co

## 配置命令行

### 1. 原始写法

- 配置正确 是不会一闪而过的.
- 请先 DOS CMD 下调试通过,再这里赋值自动命令

```c#
// 0. debug pause
cmd.exe
/c pause
pause for debug

// 1. delete
cmd.exe
/c del D:\Work\Demo\*.* /f/s/q/a
ClearProtect

// 2. protect 注意最前面无须空格
co.exe
projectfile="D:\demo\admin.obproj"
C:\Program Files (x86)\LogicNP Software\Crypto Obfuscator For .Net 2018
Protect

"C:\Program Files (x86)\LogicNP Software\Crypto Obfuscator For .Net 2018\co.exe" projectfile="D:\demo\admin.obproj"

// 3. copy
/c xcopy "D:\Work\Demo\*.*" "D:\Work\Demo2\" /y & exit

```

### 2. 批处理写法

```c#
D:\Work\demo.bat
"exit"
```
