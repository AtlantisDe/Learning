# GIT

- [官方](https://www.git-scm.com/download/win)
- [GIT 开源](https://github.com/git)
- [国内避免翻墙](https://github.com/waylau/git-for-win)

## Git 文章

- [Git 手册](https://git-scm.com/docs)
- [Git 知识大全](https://gitee.com/help/categories/43)
- [git - 简易指南](http://www.bootcss.com/p/git-guide/)
- [如何生成SSH key及查看SSH key](http://www.cnblogs.com/zheng577564429/p/8317524.html)
- [Git 使用详细教程](https://www.cnblogs.com/seven-ahz/p/7712125.html)
- [Git 远程分支与本地分支合并](https://blog.csdn.net/loongshawn/article/details/78864039)
- [Git 如何删除本地分支和远程分支](<[https://github.com/waylau/git-for-win](https://baijiahao.baidu.com/s?id=1596093203877347214&wfr=spider&for=pc)>)
- [git 拉取远程分支到本地]([https://blog.csdn.net/carfge/article/details/79691360]))
- [git 版本控制器常用命令](https://www.cnblogs.com/lixiaoni/p/6899437.html)
- [A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)
- [Git 分支模型](https://www.cnblogs.com/byeyear/archive/2012/11/28/2793374.html)
- [Git 撤销已经 commit 但是还没有 push 的代码](https://blog.csdn.net/weixin_42071874/article/details/83021670)
- [git Bash 命令行大全（持续更新](https://blog.csdn.net/webfrontenddev/article/details/83182436)
- [Git 如何删除输入过的历史命令](https://bbs.csdn.net/topics/392021867)
- [git 合并远程分支(带冲突)](https://blog.csdn.net/u013444177/article/details/19992509)
- [git 拉取远程分支解决冲突问题](https://blog.csdn.net/qq_40190624/article/details/82981445)
- [Git 解决合并到远程分支冲突问题](https://my.oschina.net/sdlvzg/blog/1589140)
- [Git 分支合并冲突解决](https://www.cnblogs.com/shuimuzhushui/p/9022549.html)
- [Git 出现|MERGING 解决](https://blog.csdn.net/Dorisi_H_n_q/article/details/81663564)

## GIT 配置

```shell
 git config --global user.name "John Doe"
 git config --global user.email johndoe@example.com
```

```shell
config 配置有system级别 global（用户级别） 和local（当前仓库）三个
设置先从system-》global-》local  底层配置会覆盖顶层配置 分别使用--system/global/local 可以定位到配置文件
```

```shell
 git config --global user.name "John Doe"
 git config --global user.email johndoe@example.com
```

### 查看系统 config

```shell
git config --system --list
```

### 查看当前用户（global）配置

```shell
git config --global  --list
```

### 远程 Github 信息

```shell
git config user.name "aaaa"
git config user.email "aaaa@gmail.com"
```

### 本地 Gitlab 信息

```shell
git config user.name "aaaa"
git config user.email "aaaa@qq.com"
```

### 查看当前仓库配置信息

```shell
git config --local  --list
```

### mingw64 界面直接进入 输入的 windows 路径

```shell
cd  $(echo 'D:\web\' |  sed "s/\\\/\//g")
cd  $(echo 'D:\XX' |  sed "s/\\\/\//g")
cd  $(echo 'D:\XX\aaa\.git' |  sed "s/\\\/\//g")
```

#### 配置不同项目不同提交用户信息,先进入.git 目录

```shell
git config user.name "aaaa"
git config user.email "aaaa@gmail.com"
```

#### 在工作目录中初始化新仓库 或者 删除命令

```shell
git init
rm -rf  .git
```

#### 克隆仓库

```shell
git clone git@www.aaa.com:atlantis/aaa.git
```

#### Git 常用

```shell
git log
rm -rf  .git
git add *.c
git add .
git add README
git commit -m 'initial project version'
git commit -am 'initial project version'
git branch -av
git branch -d
git branch -D
git commit -m
git commit --amend
git rebase -i

gitk --all

git log
git reset --hard id
git reset id
git push -f  ”也可以提交，但是会将remote上第一个人的改动冲掉，太暴力了，不太好。下面说的是手动合并.
```

#### git 设置忽略文件和目录

```shell
# 创建.gitignore
vim .gitignore
# 忽略bin文件和bin目录
bin
/obj
```

#### 总结创建与合并分支命令如下：

```shell
查看分支：git branch
远程分支:git branch -a
创建分支：git branch name
切换分支：git checkout name
创建+切换分支：git checkout –b name
合并某分支到当前分支：git merge name
删除分支：git branch –d name
把远程分支拉到本地 git fetch origin name
在本地创建分支dev并切换到该分支 git checkout -b dev(本地分支名称) origin/dev(远程分支名称)
git checkout -b dev-1.0.1 origin/dev-1.0.1
```

#### git 基本命令操作

```shell
1.建立分支
命令： git branch <branchname>
e.g: git branch demo

1. 查看分支
命令：git branch

3.切换分支
命令：git checkout <branchname>
e.g：git checkout demo

4.创建分支并进行切换
命令：git checkout -b <branchname>
e.g：git checkout -b demo

5.合并分支
命令：git merge <commit>
e.g: 先切换到目标分支 a)git checkout master b)git merge demo

6.删除分支
命令：git branch -d <branchname>
e.g：git branch -d demo

7.并行操作
a)git branch demo1
b)git branch demo2
c)git checkout demo1
d)git branch
e)git add myfile.txt
f)git commit -m "添加commit的说明"
g)git checkout demo2
h)git add myfile.txt
j)git commit -m "添加commit说明"

8.解决合并冲突
a)git checkout dev
b)git merge demo1
c)git merge demo2
d)编辑解决冲突文件
e)git add 冲突文件
f)git commit -m "合并demo3分支"

9.使用rebase合并
a)git checkout demo3
b)git rebase master
c)编辑解决冲突文件
d)git add 冲突文件
e)git rebase --continue
f)git checkout dev
g)git merge demo3

10.添加轻标签
命令：git tag <tagname>
e.g git tag v1.0
a)查看轻标签 git tag
b)在日志中显示包含标签资料的历史记录 git log --decorate

11.添加注解标签
命令：git tag -a <tagname> 或 git tag -am "你的注解" <tagname>
a)显示标签的列表和注解 git tag -n

12.删除标签
命令：git tag -d <tagname>

13.修改最近的提交
主要使用场合：
.添加最近提交时漏掉的文件.修改最近提交的注解
实战操作：
   >git log
   >git add 修改的文件
   >git commit -m "文件注解" -amend
14.取消过去的提交
主要使用场合：
安全地取消过去发布的提交
实战操作：
>git log
>git revert HEAD

15.遗弃提交
主要使用场合：
.复原修改过的索引的状态(mixed)
.彻底取消最近的提交(hard)
.只取消提交(soft)
实战操作：
>git log
>git reset --hard HEAD~~
reset错误还原
>git reset --hard ORIG_HEAD

16.提取提交
主要使用场合：
.把弄错分支的提交移动到正确的地方
.把其他分支的提交添加到现在的分支
实战操作：
>git checkout master
>git cherry-pick 99daed2(根据情况选择)
发生冲突时，解决冲突
>git add 文件名
>git commit  -m '注解'

17.改写提交的历史记录
主要使用场合：
.在push之前,重新输入正常的提交注解
.清楚的汇合中内容含义相同的提交
.添加最近提交时漏掉的档案
实战操作：
汇合提交
>git rebase -i HEAD~~
然后将看到HEAD到HEAD~~的提交，将pick改成squash,然事保存并退出。由于合并后要提交，所以接着会显示提交信息的编辑器，请编辑信息后保存并退出。
>git log 进行确认
修改提交
>git rebase -i HEAD~~
将第一行的“pick”改成“edit”，然后保存并退出。将会显示以下内容，修改过的提交呈现退出状态
>git add 把变更录入到索引中
>git commit --amend
>git rebase --continue (可能会发生冲突，请修改冲突再add和rebase --continue 如果中途要停止 rebase --abort)
撤消到rebase之前的状态
>git reset --hard ORIG_HEAD

18.汇合分支上的提交，然后一同合并到分支
主要使用场合：
.汇合主题分支的提交，然后合并提交到目标分支
实战操作：
>git checkout master
>git merge --squash demo1
有冲突,解决提交
>git add
>git commit
```

#### 总结创建与合并分支命令如下

```shell
1.创建数据库
命令：git init
2.添加文件或目录到索引（支持通配符 .表示可以将子目录里的所有文件添加到索引）
命令：git add <filepattern>
3.提交追加到索引文件
命令：git commit
-a 检测出修改的文件（不包括亲添加的文件）
-m 指定提交信息
4.显示修改文件清单
命令：git status
-s 不显示讲解
-sb 不显示讲解但显示分支名称
5.查看修改文件的差异（不指定选项可以显示工作树与索引的差异）
命令：git diff
-cached 显示索引与HEAD的差异
6.显示提交记录
命令：git log
7.查看提交详细记录
命令：git show <commit>
8.修改、移动文件的名称或目录的名称
命令:git mv <oldfilename> <newfilename>
9.删除文件
命令：git rm <file>
10.删除非管理的对象的文件
命令：git clean
-n 查看马上要被删除的文件
-f 立即删除文件
-x  .gitignore 指定的文件也成为删除对象
11.还原正手头上修改，还没被不回到索引里的文件
命令：git checkout <file>
12.删除已添加到索引的文件
命令：git reset HEAD <file>
13.只添加已经提交过的文件到索引
命令：git add -u

14.复制现有的远程数据库
命令：git clone <url>
命令：git remote add <name> <url>
15.显示远程数据库列表
命令：git remote
-v 显示详细情况
16.在远程数据库的分支创建本地数据库的分支(branch为远程分支名称，branchname为本地分支名称)
命令：git checkout <branch>
旧版命令：git branch <branchname> origin/<branch>
17.在远程数据库创建分支/反映修改内容到分支(repostionry 远程数据库名称refspec 指定的分支名称)
命令：git push <repostionry> <refspec>
-u 可以追踪在远程数据库的目标分支
18.查看远程数数据库分支的修改内容(repostionry 远程数据库名称refspec 指定的分支名称)
命令：git fetch <repostionry> <refspec>
19.读取远程数据库的分支的修改内容(repostionry 远程数据库名称refspec 指定的分支名称)
命令： git pull <repository> <refspec>
20.删除远程数据库的分支(repostionry 远程数据库名称)
命令： git push –delete <repository> <branchname>
21.建立远程数据库的标签(repostionry 远程数据库名称)
命令： git push <repository> <tagname>
-tags 把本地数据库里所有的标签添加到远程数据库
22.删除远程数据库的标签 (repostionry 远程数据库名称)
命令： git push –delete <repository> <tagname>
1.7版本之前命令：git push <repository>:<tagname>
23.修改已注册的远程数据库的电子邮件地址
命令：git remote set-url  <name> <newname>
24.修改已注册的远程数据库
命令：git remote rename <old> <new>

25.显示分支清单
命令：git branch
-a 显示包括远端分支在内的分支清单
26.创建分支
命令：git branch <branchname>
27.修改分支的名称
命令：git branch –m <oldbranch> <newbranch>
28.删除分支
命令：git branch –d <branchname>
29.切换分支
命令：git checkout <branchname>
30.合并分支
命令：git merge <branchname>

31.设定用户名/电子邮件地址
命令：git config –global user.name <username>
命令：git config –global user.email <mailadress>
不添加--global选项，此设定只对该数据库有效
32.输出彩色
命令：git config –global color.ui auto
33.设定命令的别名
命令：git config –global alias.<aliasname> <commandname>
34.把不需要用的文件归类到非管理对象gitignore改动后要进行提交
命令：echo <filename> >> .gitignore
35.管理空文件
命令：cd <dirname>  touch .gitkeep
36.显示设定清单
命令：git config –global --list
37.通过代理主机连接HTTP
在.gitconfig文件的http项目添加以下的设定
[http]
proxy = <代理主机的电子邮件地址>：<代理主机的端口号码>
config:
git config –global http.proxy <代理主机的电子邮件地址>：<代理主机的端口号码>
38.通过需要用户认证的代理主机连接http
39.在.gitconfig文件的http项目添加以下的设定
[http]
proxy = http://<用户名>:<密码>@<代理主机的电子邮件地址>：<代理主机的端口号码>
config:
git config –global http.proxy http://<用户名>:<密码>@<代理主机的电子邮件地址>：<代理主机的端口号码>
40.查看标签列表
命令：git tag
41.建立标签
命令：git tag <tagname>
42.建立含批注的标签
命令：git tag –a <tagname>
43.删除标签
命令：git tag –d <tagname>

44.暂时保存现状的操作
命令：git stash save
45.显示暂存列表
命令：git stash list
46.恢复暂存的操作
命令：git stash pop
47.删除暂存的操作
命令：git stash drop
48.删除所有暂存的删除
命令：git stash clear

49.修改最近的提交记录
命令: git commit --amend
50.只修改最近的提交的记录的注解
命令：git commit -- amend
51.修改过去的提交记录
命令: git rebase –i <commit> git commit –amend  git rebase --continue
52.只修改过去提交记录的注解
命令：git rebase –i <commit> git commit –amend  git rebase --continue
53.中途停止rebase
命令：git rebase --abort
54.查看HEAD的移动历史
命令：git reflog
55.查看分支前面的移动历史记录（ref 指定分支名称）
命令：git reflog <ref>
56.放弃最近的提交
命令：git reset –hard HEAD~
57.放弃rebase
命令：git reset –hard <commit >
首先使用reflog命令查找rebase以前的提交，确认提交的信号值或[HEAD@{数字}]值。然后reset
58.取消最近的reset
命令: git reset –hard ORIG_HEAD
59.移动弄错分支的提交
命令：git cherry-pick “<commit>”
60.查找包含特定注解的提交
命令：git log  --grep “<pattern>”
```

## git Bash

```shell
1、目录、文件操作
pwd ( print working directory ) 查看当前所在路径--绝对路径
cd ( change directory ) 切换目标
cd .. 返回到上一个目录
ls ( list ) 查看当前目录下的内容
ll 列出的内容更为详细ll 列出的内容更为详细
ls -al 包括隐藏文件和以 . 开头的文件
mkdir ( make directory ) 创建目录
touch 创建文件
cat 查看文件内容（一次性将内容全部显示）
less 查看文件内容（显示部分信息）--再次输入‘回车’一行一行显示，‘空格’一页一页显示 ，‘b’一次向上走一页
rm ( remove ) 删除文件，-rm -rf 文件夹（循环递进删除文件夹,不需要二次确认）
rmdir ( remove directory )删除文件夹（只能删除空文件夹，不常用）
clear 清屏
q 退出
mv ( move ) 移动文件或重命名
cp ( copy ) 复制文件    如复制  A 文件夹下的所有子文件、目录到 B 文件夹  cp -r A/* B
echo "something"  >> 文件名       把内容追加到某个文件
echo ‘内容’ > 文件名 （输出内容到文件中，每次输入都是覆盖原来的文件
echo ‘内容’ >>文件名（输出内容到文件中，每次输入都是追加新内容

2、环境相关操作
node 进入node环境 两次 ctrl+c 退出node环境

3、git仓库管理基本bash

ssh-keygen -t rsa -C "youremail@example.com"(邮箱和github注册邮箱保持一致)      创建SSH key（创建完成后在/C/Users/用户名下 id_rsa.pub 添加到github）
ssh -T git@github.com    判断是否连通成功
git init         初始化仓库
git status    查看当前仓库状态
git add 文件名（.表示添加所有更改到暂存区）       把更新添加到暂存区
git commit -m "描述文字"         把文件提交到本地仓库
git merge 分支名              把分支名上的代码合并到当前所在分支
git branch -d 分支名              删除分支
git remote add origin 远程仓库url       添加远程仓库
git add README.md       添加reademe文件
git push -u origin master     推送到远程master分支（关联本地与远程的master分支）

4、git工作流

git reset HEAD 文件名        把暂存区的修改回归到工作区
git checkout -- 文件名        把工作区文件清理干净
git reset --hard commitID         回滚到某一次commit前
git fsck --lost-found        恢复git add 过的文件
find .git/objects -type f | xargs ls -lt | sed 60q     找到最近add到本地仓库的60个文件
rm --cached          从暂存区删除文件
checkout HEAD 文件名

6、git 分支管理

 git branch  分支名        创建分支
 git branch           查看分支（当前分支*）
 git checkout 分支名         切换分支

7、实现在Git Bash 中用 SublimeText 打开文件
新建一个文件命名为你想要的命令，比如 subl（注意不能有后缀名），内容：

```
