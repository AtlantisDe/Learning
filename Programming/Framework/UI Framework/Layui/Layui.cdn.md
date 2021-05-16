# layui CDN

- [开放静态文件 CDN | 类友网络 - 免费、快速、开放的 CDN 服务](https://cdn.90so.net/#layui)
- [Layui 免费 CDN 静态库](https://layui.hcwl520.com.cn/#layui-news)

## Layui 2.4.5

- [Layui 免费 CDN 静态库](https://www.layuicdn.com/)

```link

https://www.layuicdn.com/layui-v2.5.7/css/layui.css
https://www.layuicdn.com/layui-v2.5.7/layui.js
https://www.layuicdn.com/layui-v2.5.7/layui.all.js


https://www.layuicdn.com/layui-v2.5.6/css/layui.css
https://www.layuicdn.com/layui-v2.5.6/layui.js
https://www.layuicdn.com/layui-v2.5.6/layui.all.js

https://www.layuicdn.com/layui-v2.5.4/css/layui.css
https://www.layuicdn.com/layui-v2.5.4/layui.all.js
https://www.layuicdn.com/layui-v2.5.4/layui.js

https://www.layuicdn.com/layui-v2.5.4/css/layui.css
https://www.layuicdn.com/layui-v2.5.4/layui.all.js
https://www.layuicdn.com/layui-v2.5.4/layui.js
```

## 当你的静态资源 CDN 挂掉了该怎么办

- [当你的静态资源 CDN 挂掉了该怎么办？ - djl 的专栏，blog.djl.cx 好记 - CSDN 博客](https://blog.csdn.net/u010071211/article/details/80899170)

```c#
// 都知道使用静态的CDN引入jQuery等一些js包的时候，会提升网页的性能，那么，如果你引入CDN的地址挂掉了，那么项目同样也会挂掉，所以我们需要在引入的时候添加一个判断。如下：

<script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>

// 这段代码第一行很简单就是你正常引入cdn的地址。下面一行的话就是首先判断Windows.jQuery是否存在 也就是说判断一下这个CDN是不是挂掉了，如果没有挂掉，那么就直接使用，如果挂掉了，那么就要在后面引入自己的本地资源库。这样就可以保证在可以使用cdn的时候使用cdn不可以使用的时候就加载本地的。
```
