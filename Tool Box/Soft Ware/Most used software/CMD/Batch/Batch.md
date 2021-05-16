# Batch

- [bat 批处理的注释语句](https://blog.csdn.net/wh_19910525/article/details/8125762)
- [windows 查看网络常用 cmd 命令](https://blog.csdn.net/gease_lcj/article/details/80355642)
- [批处理 bat echo 中文乱码完美解决方法 - tp7309 的专栏 - CSDN 博客](https://blog.csdn.net/tp7309/article/details/79283524)

## 常用

```c#
// 编写批处理时候,请使用 UTF8 编码
```

## 编码

- CHCP 是一个计算机指令，能够显示或设置活动代码页编号

```bat
@echo off
REM 声明采用UTF-8编码
chcp 65001
echo test
echo 中文测试
pause
```

## 注释语法

```C#
// 在批处理中，段注释有一种比较常用的方法：

    goto start
     = 可以是多行文本，可以是命令
     = 可以包含重定向符号和其他特殊字符
     = 只要不包含 :start 这一行，就都是注释
    :start


// 另外，还有其他各种注释形式，比如：

   1、:: 注释内容（第一个冒号后也可以跟任何一个非字母数字的字符）
    2、rem 注释内容（不能出现重定向符号和管道符号）
    3、echo 注释内容（不能出现重定向符号和管道符号）〉nul
    4、if not exist nul 注释内容（不能出现重定向符号和管道符号）
    5、:注释内容（注释文本不能与已有标签重名）
    6、%注释内容%（可以用作行间注释，不能出现重定向符号和管道符号）
    7、goto 标签 注释内容（可以用作说明goto的条件和执行内容）
    8、:标签 注释内容（可以用作标签下方段的执行内容）
```
