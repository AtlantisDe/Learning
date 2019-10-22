# 创建新项目

## 常用

```c#
mkdocs new my-project
cd my-project
mkdocs serve
mkdocs build
mkdocs build --clean
```

### 1. 主题

```c#
// 可以在配置文件中修改文档主题. 在 mkdocs.yml 中添加如下内容:
site_name: MkLorum
pages:
- [index.md, Home]
- [about.md, About]
theme: readthedocs
```
