# favicon.ico

- [favicon.ico 网站图标不显示问题 - W 的博客 - CSDN 博客](https://blog.csdn.net/weixin_40848638/article/details/82853286)

```css
<link rel="shortcut icon" href="/favicon.ico" />
<link rel="bookmark" href="/favicon.ico" />
<link rel="icon" href="https://img.alicdn.com/tfs/TB1_ZXuNcfpK1RjSZFOXXa6nFXa-32-32.ico"  type="image/x-icon">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
```

```c#
<link rel="Shortcut Icon" href="images/favicon.ico">
是因为你在本地测试的，而不是在服务器端测试的。
【1】在服务器端测试，默认会识别根目录下favicon.ico的文件作为网页的ico。若在个别页面有不同的ico，在个别页面用添加ico即可
【2】在本地端测试，chrome、opera和firefox支持通过标签添加ico，但IE和safari不支持其他情况：
```
