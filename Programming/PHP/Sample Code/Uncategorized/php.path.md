# PHP 路径百科

- [./和../以及/之间的区别](https://zhidao.baidu.com/question/544197599.html)
- [PHP中include和require绝对路径、相对路径问题 - Veitor - 博客园](https://www.cnblogs.com/veitor/p/3529130.html?utm_source=tuicool&utm_medium=referral)

```C#
1、./是当前目录
2、../是父级目录
3、/是根目录

// 根目录指逻辑驱动器的最上一级目录，它是相对子目录来说的。打开“我的电脑”，双击C盘就进入C盘的根目录，双击D盘就进入D盘的根目录。其它类推。根目录在文件系统建立时即已被创建，其目的就是存储子目录（也称为文件夹）或文件的目录项。

// 电脑中的子目录很好理解，例如：

1、C:\是父目录，C:\Windows就是C:\的子目录。
2、C:\Windows\System32\就是C:\Windows的子目录。

define('ROOT_PATH', dirname(__FILE__).'/../../');
$path=ROOT_PATH.'./config/config_global.php';
echo $path;

define('ROOT_PATH', dirname(__FILE__));
define("WWWROOT",str_ireplace(str_replace("/","\\",$_SERVER['PHP_SELF']),'',__FILE__)."\\");

// 根路径
print_r($_SERVER['DOCUMENT_ROOT']);
// 当前文件路径
print_r(dirname(__FILE__));


<?php
print_r(dirname(__FILE__)."/App_Configs/AppConfig.php");
exit;
?>
```
