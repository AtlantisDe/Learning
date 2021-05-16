# POST

- [浅谈 php 接收 POST 数据的三种方式 - Walker-C - CSDN 博客](https://blog.csdn.net/qq_38253837/article/details/78583737)
- [php 提交表单时判断 if($_POST[submit])与 if(isset($ POST[submit])) 的区别 - 茶瓶儿 - 博客园](https://www.cnblogs.com/chenguanai/p/7592775.html)
- [form 表单无法正常传 post 参数](https://zhidao.baidu.com/question/1238791819974543739.html)

## 使用前先判断变量是否已经声明就不会有这个错误

```php
<?php
isset($_POST['name']) && $name = $_POST['name'];
isset($_POST['password']) && $password = $_POST['password'];
include('conn.php');

if(isset($_POST['cdnurl']) && $name = $_POST['cdnurl']){

}
else
{
}

?>
```

```php
if(isset($_POST["submit"]){
echo "提交过来了";
}else
{
echo "submit is no come~";
```
