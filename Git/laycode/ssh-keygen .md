# SSH

## 检查本地是否有SSH Key存在

```shell
ls -al ~/.ssh
# 如果终端输出的是：No such file or directory
# 那么就说明本地没有SSH key 如果已存在SSH key那么就会显示 id_rsa 和 id_rsa.pub文件的存在以及它的创建日期。
```

## 生成新的SSH key

- [如何生成SSH key及查看SSH key](http://www.cnblogs.com/zheng577564429/p/8317524.html)
- [查看本机git ssh key公匙](https://blog.csdn.net/zhu119064177/article/details/80466550)

```shell
ssh-keygen -t rsa -C "your_email@example.com"
```