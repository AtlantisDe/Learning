# regedit

- [如何在注册表中添加右键菜单？ - 學海無涯 - 博客园](https://www.cnblogs.com/cheungxiongwei/p/7541447.html)
- [右键菜单太 Low？加个图标看看清楚-百度经验](https://jingyan.baidu.com/article/a681b0de532ed33b18434614.html)
- [所有的右键菜单在注册表的哪个位置](https://zhidao.baidu.com/question/578605284.html)
- [桌面右键菜单，文件右键菜单，注册表位置。 - Curiosity - 博客园](https://www.cnblogs.com/CuriosityWzk/archive/2012/03/15/2397950.html)

## 要点

- 一定要用 UTF-16LE 有签名 文件保存 才不会出现乱码

### WOW6432Node 真身

- [WOW6432Node 真身 注册表 - linuxheik 的专栏 - CSDN 博客](https://blog.csdn.net/linuxheik/article/details/81257757)
- 在 64 位版本的注册表编辑器中，32 位注册表项显示在以下注册表项下：HKEY_LOCAL_MACHINE\Software\WOW6432Node

```c#
64 位版本的注册表 中 32 位注册表项显示在以下注册表项下：HKEY_LOCAL_MACHINE\Software\WOW6432Node

-- 64位
HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\explorer\CommandStore\shell
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\


```

### 知识点

```C#
// 1、鼠标右键桌面空白处，新建菜单中的项目在注册表中的位置
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Discardable\PostSetup\ShellNew]
// 2、鼠标右键文件，弹出的菜单明细在注册表中的位置
[HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers]
// 3、鼠标右键文件夹，弹出的菜单明细在注册表中的位置
[HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers]
// 4、鼠标右键在IE浏览器里，弹出的菜单明细在注册表中的位置
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\MenuExt]

// 5、桌面空白处点击右键菜单HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers
// 注意：
// 1、某些软件所添加的鼠标右键可能在
[HKEY_CLASSES_ROOT\Folder\shell]
[HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers

// 桌面右键菜单的注册表位置为

[HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers]

// 在文件上点右键注册表位置为

[HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers]

// 找到里面的不需要的项删除即可
```

### 默认值示例

```reg
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\.txt]
@="aledb"
```

### 打开文件

```reg
explorer.exe "D:\Work\"
```
