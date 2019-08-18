# window.conf

- [JS 配置文件动态加载 CSS，js 和定义请求路径 - heartOfblack 离开了电脑，我不希望我还有病 - CSDN 博客](https://blog.csdn.net/a250758092/article/details/73649721)

## Demo

```js

(function(){
// js/conf.js
//JS文件配置
window.conf={
    include_JS:function(src){document.write('<script src="'+src+'"></script>')},
    include_CSS:function(href){document.write('<link href="'+href+'" rel="stylesheet" />')},
    Jmui:'js/mui.min.js',
    Jplus_extends:'js/plus_extends.js',
    Jquery:'js/jquery-3.1.1.min.js',
    Cmui:'css/mui.min.css',
    Cbootstrap:'css/bootstrap.min.css',
    Cstyle:'css/style.css',
    xxxPHP:'http://www.xxx.cn/xxx.php'


}

})();

// 使用
<script type="text/javascript" src="js/conf.js"></script>//先加载配置文件
<script type="text/javascript">
    conf.include_CSS(conf.Cmui);//导入css
    conf.include_JS(conf.Jmui);//导入js
    //请求路径则是conf.xxxPHP
</script>
        //这样以后因为各种原因，修改了JS/CSS文件名称，或者请求路径变了，直接修改conf.js中的信息就可以了
```
