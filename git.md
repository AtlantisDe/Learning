GIT下载安装:
---------------------------------------------------------
* [官方](https://www.git-scm.com/download/win) 
* [国内避免翻墙](https://github.com/waylau/git-for-win)

GIT开源:
---------------------------------------------------------
* [GIT](https://github.com/git) 

## GIT配置
--------------------------------------------------------- 
配置信息
```txt
 git config --global user.name "John Doe"
 git config --global user.email johndoe@example.com
```
config 配置有system级别 global（用户级别） 和local（当前仓库）三个 设置先从system-》global-》local  底层配置会覆盖顶层配置 分别使用--system/global/local 可以定位到配置文件
```txt
 git config --global user.name "John Doe"
 git config --global user.email johndoe@example.com
```
查看系统config
```txt
git config --system --list
```
查看当前用户（global）配置
```txt
git config --global  --list
```
查看当前仓库配置信息
```txt
git config --local  --list
```
