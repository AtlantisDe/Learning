# Linux.AMD64.386

- [ubuntu 的 i386 平台和 amd64 平台区别？](https://zhidao.baidu.com/question/86765081.html)
- [【linux】i386 与 AMD64 的区别*运维*小 C](https://blog.csdn.net/C_chuxin/article/details/82800119)

## 0. Installation

```c#
i386=Intel 80386
AMD64，又称“x86-64”或“x64”


// 两个是一样的只是适合的CPU不同。
1、如果cpu只支持32位的，不支持64位的，适合下载i386。
2、如果cpu支持64位的，可以下载i386也可以下载amd64

i386=Intel 80386。其实i386通常被用来作为对Intel（英特尔）32位微处理器的统称。
AMD64，又称“x86-64”或“x64”，是一种64位元的电脑处理器架构。它是建基于现有32位元的x86架构，由AMD公司所开发。
```

## 1. 常用

```c#
cat /proc/cpuinfo

// clflush size    : 64
// cache_alignment : 64
// address sizes   : 46 bits physical, 48 bits virtual

```
