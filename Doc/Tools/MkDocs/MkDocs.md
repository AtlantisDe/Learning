# MkDocs

- [MkDocs](https://www.mkdocs.org/)
- [MkDocs 中文文档](https://markdown-docs-zh.readthedocs.io/zh_CN/latest/)
- [readthedocs/sphinx_rtd_theme](https://github.com/readthedocs/sphinx_rtd_theme)
- [Home | Read the Docs](https://readthedocs.org/)

## 1. 安装

```c#
pip install --upgrade pip
pip install mkdocs

WARNING: You are using pip version 19.2.3, however version 19.3 is available.
You should consider upgrading via the 'python -m pip install --upgrade pip' command.

警告：您正在使用pip版本19.2.3，但是版本19.3可用。
您应该考虑通过“ python -m pip install --upgrade pip”命令进行升级。

如果您使用的是Windows，则上述某些命令可能无法立即使用。
一个快速的解决方案可能是在每个Python命令前添加python -m 这样的命令：

python -m pip install mkdocs
python -m mkdocs

```

## 2. 版本查看与路径

```c#
mkdocs --version

where mkdocs

C:\Program Files\Python38\Scripts\mkdocs.exe

C:\Program Files\Python38\Lib\site-packages\mkdocs
```

## 3. 创建新项目

```c#
mkdocs new my-project
cd my-project
```
