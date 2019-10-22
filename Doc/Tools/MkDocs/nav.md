# nav

## 常用导航配置

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
