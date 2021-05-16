# PHP 文章

- [Automatically populating \$HTTP_RAW_POST_DATA is deprecated......](https://blog.csdn.net/github_26672553/article/details/52526862)
- [这个问题和 PHP 版本有关系，PHP 5.6 已经废弃了\$HTTP_RAW_POST_DATA。](https://blog.csdn.net/github_26672553/article/details/52526862)
- [PHP [开发汇总]](https://www.cnblogs.com/bycnboy/p/9050405.html)
- [PHP 保留两位小数的几种方法](https://www.cnblogs.com/zouzhe0/p/6197594.html)
- [PHP 保留两位小数并且四舍五入及不四舍五入的方法](https://www.jb51.net/article/41562.htm)

## 1. php 错误提示开启

```php
ini_set("display_errors", "On");//打开错误提示
ini_set("error_reporting",E_ALL);//显示所有错误
```

## 2. PHP 代码

```php
header( 'Content-Type:text/html;charset=utf-8 ');
global $_G;
```

## 3. php 下 intval()和(int)转换使用与区别

```php
// 例：intval("A")=0; intval(12.3223)=12; intval("1123Asdfka3243")=1123;
int();
$b=(int)$a; //$b=0;
$a=0.99;
$b=(int)$a; //$b=0;
$a=1.01;
$b=(int)$a; //$b=1;
$a=1.99;
$b=(int)$a; //$b=1;
```

## 4. PHP 字符串转换为 int

```php
$str = "10";
$num = (int)$str;
```

## 5. PHP 保留两位小数的几种方法

```php
$num = 10.4567;
//第一种：利用round()对浮点数进行四舍五入
echo round($num,2); //10.46

//第二种：利用sprintf格式化字符串
$format_num = sprintf("%.2f",$num);
echo $format_num; //10.46

//第三种：利用千位分组来格式化数字的函数number_format()
echo number_format($num, 2); //10.46
//或者如下
echo number_format($num, 2, '.', ''); //10/46
// php保留两位小数并且不四舍五入
$num = 123213.666666;
echo sprintf("%.2f",substr(sprintf("%.3f", $num), 0, -2));
// php舍去法，取整数
echo floor(4.3); // 4
echo floor(9.999); // 9
// php进一法取整
echo ceil(4.3); // 5
echo ceil(9.999); // 10
```
