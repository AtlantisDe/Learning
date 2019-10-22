# is_file

- [PHP is_file() 函数 | 菜鸟教程](http://www.runoob.com/php/func-filesystem-is-file.html)
- 定义和用法
- is_file() 函数检查指定的文件是否是常规的文件。
- 如果文件是常规的文件，该函数返回 TRUE。
- 提示和注释
- 注释：该函数的结果会被缓存。请使用 clearstatcache() 来清除缓存。

```php
<?php
$file = "test.txt";
if(is_file($file))
{
echo ("$file is a regular file");
}
else
{
echo ("$file is not a regular file");
}
?>
```
