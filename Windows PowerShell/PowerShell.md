# Windows PowerShell

- C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
- [PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/)\
- [PowerShell 脚本](https://docs.microsoft.com/zh-cn/powershell/scripting/overview?view=powershell-6)
- [PowerShell/PowerShell](https://github.com/powershell/powershell)
- [Windows PowerShell 基本语法及常用命令 - 風之子 - 博客园](https://www.cnblogs.com/feng-zhizi/p/9935874.html)
- [PowerShell 在线教程 &#8211; PowerShell 中文博客](https://www.pstips.net/powershell-online-tutorials)

## 常用

### 1. 给变量赋值

```c#
// PowerShell的变量无需预定义，可直接使用。当使用一个变量时，该变量被自动声明。

// 变量以 $  符号开头。如：$a

// PowerShell普通变量：

// 1.给变量赋值：

   方式一：

   $a = "This is a string"

   $b = 123

   $c = 0.125

   方式二：

   Set-Variable var 100

   Set-Variable var1 ”test“

   Set-Variable va2 800
```

### 2. 获取变量值

```c#
   get-variable var   #获取单个变量值

   get-variable var*  #获取多个变量值
```

### 3. 清空变量值

```c#
clear-variable var
```

### 4. 删除变量

```c#
remove-variable var
```

### 5. 连接两个字符串变量

```c#
$a = "This is the 1st string"

$b = "This is the 2nd string"

$c = $a + " and " + $b

$c

//    结果：This is the 1st string and This is the 2nd string
```

### 6. 变量的方法

```c#
$date = Get-Date  #获取当前时间

$date.AddDays(3)  #当前时间加三天
```
