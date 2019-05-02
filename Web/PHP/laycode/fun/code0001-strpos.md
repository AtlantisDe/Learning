# strpos()

- [PHP strpos()](http://www.w3school.com.cn/php/func_string_strpos.asp)
- [php 中如何判断内容中是否包含指定的文字](https://zhidao.baidu.com/question/105035939.html)

```php
// 查找 "php" 在字符串中第一次出现的位置
<?php
echo strpos("You love php, I love php too!","php");
?>
// 相关函数：
// stripos() - 查找字符串在另一字符串中第一次出现的位置（不区分大小写）
// strripos() - 查找字符串在另一字符串中最后一次出现的位置（不区分大小写）
// strrpos() - 查找字符串在另一字符串中最后一次出现的位置（区分大小写）
```

## 创建数组

```php
// 当然这样会有一个问题，就是当"张三"出现在字符串开头的时候，结果也为0，
$x = "abc张三klllk";
if(strpos($x,"张三") > 0){
echo "ok";
}
// 这时候就要在字符串前加一特殊字符来判断。
$x = "abc张三klllk";
if(strpos("Demo%**#".$x,"张三") > 0){
echo "ok";
}

```
