# upgrade

- [http://dev.21ds.cn/article/324.html](http://dev.21ds.cn/article/324.html)

## 命令

```c#
// 当使用以下命令升级Ubuntu 16.04到18.04时

do-release-upgrade
// 如果出现以下提示：

// Checking for a new Ubuntu release
// Please install all available updates for your release before upgrading.
// 可以用以下命令进行修复：（依次执行即可）

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade
// 然后再执行升级命令进行升级即可

sudo do-release-upgrade
```
