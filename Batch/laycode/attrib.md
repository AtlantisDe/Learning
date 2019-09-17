# attrib

- [批处理删除隐藏文件](https://zhidao.baidu.com/question/60507798.html)

## 文档

````shell
# attrib指令的格式和常用参数为：

ATTRIB [+R | -R] [+A | -A ] [+S | -S] [+H | -H] [[drive:] [path] filename] [/S [/D]]

   +    设置属性。
   -     清除属性。
   R    只读文件属性。
   A    存档文件属性。
   S    系统文件属性。
   H    隐藏文件属性。
  [drive:][path][filename]     指定要处理的文件属性。
   /S   处理当前文件夹及其子文件夹中的匹配文件。
   /D   也处理文件夹。
```

## 取消系统文件隐藏功能

```bat
attrib +s +h +r 文件名
attrib +s +h +r %1
attrib -s -h -r 文件名
````

```bat
:: 1、遍布当前目录及所有子文件夹
dir /s
:: 2、去除文件隐藏 系统属性
attrrib -s -h
```
