# 错误解决方案

- [HTTP 错误 401.3 - Unauthorized](https://blog.csdn.net/chenzhijie101/article/details/75089472)
- [ASP.NET对路径&quot;xxxxx&quot;的访问被拒绝的解决方法小结](https://www.cnblogs.com/qiywtc/p/3782179.html)

## HTTP 错误 401.3/需要添加权限

```shell
错误原因： 是该网站源文件所在目录的的权限设置问题

解决方案 ：

 1.找到目录，右键->安全->添加->查找 :找到everyone ，然后设置其权限，完全开放

 1. 也可以找到IUSR_开头的用户，同样设置其权限，完权开放

注：这个好像称之为设置权限为777.
```
