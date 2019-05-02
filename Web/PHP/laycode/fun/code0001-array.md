# array

```php
<?php
$cars=array("Volvo","BMW","Toyota");
echo "I like " . $cars[0] . ", " . $cars[1] . " and " . $cars[2] . ".";
?>
```

## 创建数组

```php
array();
```

## 数值数组

```php
// 这里有两种创建数值数组的方法：

// 自动分配 ID 键（ID 键总是从 0 开始）：

$cars=array("Volvo","BMW","Toyota");
// 人工分配 ID 键：

$cars[0]="Volvo";
$cars[1]="BMW";
$cars[2]="Toyota";
```

## 获取数组的长度

```php
$cars=array("Volvo","BMW","Toyota");
echo count($cars);
```

## 关联数组

```php
$age=array("Peter"=>"35","Ben"=>"37","Joe"=>"43");

// or:
$age=null;
$age['Peter']="35";
$age['Ben']="37";
$age['Joe']="43";
```
