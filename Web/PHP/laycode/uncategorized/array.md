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

## 遍历索引数组

```php
<?php
$cars=array("porsche","BMW","Volvo");
$arrlength=count($cars);

for($x=0;$x<$arrlength;$x++) {
  echo $cars[$x];
  echo "<br>";
}
?>
```

## 数组分割

```php
print_r(explode("\n",$_POST['cdnurls']));
```

## PHP 怎么用换行符分割字符串

- [php 根据换行分割字符串](https://zhidao.baidu.com/question/222786436.html)
- [PHP 使用 preg_split 函数分割含换行和分号字符串 - 番石榴 - CSDN 博客](https://blog.csdn.net/qq_24613517/article/details/80506551)

```php
// 用textarea输入数据，想根据换行来分割数组，用explode函数来实现，分割条件输入\n,\r,\r\n都不可以实现，用PHP_EOL可以实现，如下：
"\n"
$arr = explode("\n",$Str);
// 把双引号写成单引号是不行的哦.

$key_arr = explode(PHP_EOL,$key);

///代码1begin
$newArr = Array();
$text = $_POST['cdnurls'];
//将分行符"\r\n"转义成HTML的换行符"<br />"
$text = nl2br($text);
//"<br />"作为分隔切成数组
$textArr = explode("<br />",$text);
//除去数组中的空格
foreach($textArr as $val)
{
if(isset($val) AND $val){array_push($newArr,$val);}
}
print_r($textArr);
print_r($newArr);
exit;
///代码1end

```

## php 遍历数组键名

- [php 遍历数组键名 - JackLiu 刘振东 - 博客园](https://www.cnblogs.com/zhendong/p/8481928.html)

```php
$menu = array('0' =>'常规管理','1'=>'模块管理','3'=>'用户管理','4'=>'系统设置' );
foreach ($menu as $key => $value) {
    echo $key;
}



foreach($BindDomains as $BindDomain)
{
  print_r($BindDomain);
}

foreach ($BindDomains as $key => $value) {
  echo $key;
}
```
