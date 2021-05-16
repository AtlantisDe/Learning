# MysqliDb

- [ThingEngineer/PHP-MySQLi-Database-Class](https://github.com/ThingEngineer/PHP-MySQLi-Database-Class)

```php
require_once ("../MysqliDb.php");
require_once ("../dbObject.php");
```

## 常用

```c#
<?php
require_once ("MysqliDb.php");
require_once ("dbObject.php");

$db = new MysqliDb ('host', 'root', 'root', 'test001');

$db->setPrefix ('T_');
$db->autoReconnect = false;

$data = Array ("Content" => "你好测试特殊字符�。");
$id = $db->insert ('zw', $data);
if($id)
    echo 'user was created. Id=' . $id;
?>
```
