# explode

- [PHP explode()](http://www.w3school.com.cn/php/func_string_explode.asp)

```php
<?php
$str = 'one,two,three,four';

// 零 limit
print_r(explode(',',$str,0));

// 正的 limit
print_r(explode(',',$str,2));

// 负的 limit
print_r(explode(',',$str,-1));

//换行分割
print_r(explode("\n",$_POST['users']));
?>
```

```php
Array
(
    [0] => one,two,three,four
)
Array
(
    [0] => one
    [1] => two,three,four
)
Array
(
    [0] => one
    [1] => two
    [2] => three
)
```
