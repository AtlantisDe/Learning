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
```
config 配置有system级别 global（用户级别） 和local（当前仓库）三个 
设置先从system-》global-》local  底层配置会覆盖顶层配置 分别使用--system/global/local 可以定位到配置文件
```
```txt
 git config --global user.name "John Doe"
 git config --global user.email johndoe@example.com
```
# 查看系统config
```txt
git config --system --list
```
# 查看当前用户（global）配置
```txt
git config --global  --list
```

# 远程Github信息
```
git config user.name "aaaa"
git config user.email "aaaa@gmail.com"
```
# 本地Gitlab信息
```
git config user.name "aaaa"
git config user.email "aaaa@qq.com"
```

# 查看当前仓库配置信息
```txt
git config --local  --list
```
mingw64 界面直接进入 输入的windows路径
```txt
cd  $(echo 'D:\web\' |  sed "s/\\\/\//g")
```
# git mingw64 界面直接进入 输入的windows路径
```txt
cd  $(echo 'D:\XX' |  sed "s/\\\/\//g") 
cd  $(echo 'D:\XX\aaa\.git' |  sed "s/\\\/\//g")
```

```
配置不同项目不同提交用户信息,先进入.git目录

git config user.name "aaaa"
git config user.email "aaaa@gmail.com"
```
 

# 在工作目录中初始化新仓库 或者 删除命令
```
git init
rm -rf  .git
```


# 克隆仓库
```
git clone git@www.aaa.com:atlantis/aaa.git
```

# Git常用
```
git log
rm -rf  .git 
git add *.c
git add .
git add README
git commit -m 'initial project version'
```

# git设置忽略文件和目录
创建.gitignore
```
vim .gitignore
```
忽略bin文件和bin目录 
```
bin
```


# 总结创建与合并分支命令如下：
```
查看分支：git branch

创建分支：git branch name

切换分支：git checkout name

创建+切换分支：git checkout –b name

合并某分支到当前分支：git merge name

删除分支：git branch –d name
```
# Git文章

* [Git使用详细教程](https://www.cnblogs.com/seven-ahz/p/7712125.html) 
* [Git远程分支与本地分支合并](https://blog.csdn.net/loongshawn/article/details/78864039) 
* [Git 如何删除本地分支和远程分支]([https://github.com/waylau/git-for-win](https://baijiahao.baidu.com/s?id=1596093203877347214&wfr=spider&for=pc))
* [git 拉取远程分支到本地]([https://blog.csdn.net/carfge/article/details/79691360]))
* [git版本控制器常用命令](https://www.cnblogs.com/lixiaoni/p/6899437.html) 