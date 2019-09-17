# 删掉本地.git，再删除远程库。下面是真删除，尝试前先备份

- [Git 的 origin 和 master 分析， 清空 master 分支](https://www.jianshu.com/p/4594abe59868)
- [git清理历史成为干净库](https://blog.csdn.net/wyongqing/article/details/84475683)

```shell
#删除本地分支
git branch -D xxx

#删除远程分支(除了master其它分支都删掉)
git push  :远程分支

#删本地git
rm -rf .git

#新建库
git init
git add -A

#关联远程仓库
git remote add origin http://xxxxxx.git

#强制提交并覆盖远程master
git push -f origin master

```
