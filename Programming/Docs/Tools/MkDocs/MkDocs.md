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

## 2. 版本

```c#
mkdocs --version
where mkdocs

// 路径
C:\Program Files\Python38\Scripts\mkdocs.exe

C:\Program Files\Python38\Lib\site-packages\mkdocs
```

## 3. 创建新项目

```c#
mkdocs new my-project
cd my-project
mkdocs serve
mkdocs build
mkdocs build --clean

// 创建新项目
mkdocs new my-project
cd my-project
```

## 4. 主题/Themes

- [mkdocs/mkdocs](https://github.com/mkdocs/mkdocs/wiki/MkDocs-Themes)
- [Home - Cinder](https://sourcefoundry.org/cinder/)
- [cjsheets/mkdocs-rtd-dropdown](https://github.com/cjsheets/mkdocs-rtd-dropdown)
- [squidfunk/mkdocs-material](https://github.com/squidfunk/mkdocs-material)
- [readthedocs/sphinx_rtd_theme](https://github.com/readthedocs/sphinx_rtd_theme)
- [Installation &mdash; Read the Docs Sphinx Theme 0.4.3 documentation](https://sphinx-rtd-theme.readthedocs.io/en/latest/installing.html#)

```c#
// 可以在配置文件中修改文档主题. 在 mkdocs.yml 中添加如下内容:
site_name: MkLorum
pages:
- [index.md, Home]
- [about.md, About]
theme: readthedocs
```

```c#
theme: readthedocs
theme: cinder
theme: cinder
theme:
  name: 'rtd-dropdown'

material
```

```c#
pip install mkdocs-cinder
pip install mkdocs-rtd-dropdown
pip install sphinx-rtd-theme

requirements.txt
```

## 5. nav 导航

- [Release Notes - MkDocs](https://www.mkdocs.org/about/release-notes/#major-additions-to-version-10)
- [ERROR - Config value: &#39;pages&#39;. Error: Invalid pages config · Issue #1770 · mkdocs/mkdocs](https://github.com/mkdocs/mkdocs/issues/1770)

```yml
site_name: keras
# 旧版
pages:

- [index.md, Home]
- [about.md, About]
- [about.md, About]
  theme: readthedocs

# 新版
nav:
 - Home: index.md
 - About: index.md
```
