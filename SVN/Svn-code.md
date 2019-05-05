# SVN CODE

## 教程

- [简明教程 版本控制器：SVN 教程 | Flyne](http://www.flyne.org/article/851)
- [在 Windows 下使用 svn 命令行教程及 svn 命令行的解释 - 贫民窟里的程序高手 - 博客园](https://www.cnblogs.com/wpcnblog/p/8961051.html)

## SVN 的目录约定

- /trunck：开发主线
- /branches：支线副本
- /tags：标签副本（一旦创建，不允许修改）

## 常用命令

```shell
svn help
svn --version
svn --version --quiet    只显示版本号
svn checkout 地址
svn add 文件或者文件夹    增加本地数据到服务器
svn commit / svn ci -m “注释”  文件名   提交代码，要先add才commit
svn update / svn up 不必跟特定的文件或目录，也可以自己指定需要更新的文件或目录。每次commit或者改动之前最好更新一下。
svn log
svn delete 文件名
svn resolve 路径 --accept working    解决冲突 http://zccst.iteye.com/blog/1765519
svn switch 远程路径    版本切换
svn list 路径 / svn ls    列出版本库下的文件和目录
svn merge -r m:n 路径     合并文件，从版本号m到版本号n的远程分支都合并到当前分支中
svn info 确认工作目录的svn信息
svn diff -r m:n 路径    对版本m和版本n比较差异
svn cleanup     为失败的失误清场
svn status -v    在本地进行代码修改，检查修改状态
svn import 远程路径 --message “message”   将当前路径下文件导入到版本库中
svn export 远程路径    导出一份干净的项目
svn move/ svn mv 原文件名 新文件名    重命名
svn mkdir 文件名
svn copy / svn cp 源文件路径 新文件路径
svn revert 文件名     只能恢复未提交之前的操作
# 若要还原已提交的改动：只能用旧文件覆盖新文件。操作如下：
    1）sun up    让本地工作拷贝更新到最新状态
    2）svn log your_file_path     查看文件日志，这时候提交时填写的说明信息就派上用场了
    3）svn diff -r 旧修订版序号:新修订版序号 your_file_path    查看两个修订版之间的不同。
    4）决定用哪个旧的修订版号后，用旧的修订版号文件覆盖新的修订版号文件。svn merge -r 新修订版序号:旧修订版序号 your_file_path
    5）svn commit -m "恢复到某修订版（某修订版作废）"
# 本地的版本叫做working copy
```
