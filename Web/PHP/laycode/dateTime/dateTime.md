# dateTime

- PHP Date() 函数把时间戳格式化为更易读的日期和时间。

- [PHP 日期和时间](http://www.w3school.com.cn/php/php_date.asp)
- [PHP Date / Time 函数](http://www.w3school.com.cn/php/php_ref_date.asp)
- [php 如何在某个时间上加一天？一小时？ 时间加减 - Yiven - 博客园](https://www.cnblogs.com/yiven/p/6038553.html)

## 语法

```php
date(format,timestamp)
// 参数描述
// format必需。规定时间戳的格式。
// timestamp可选。规定时间戳。默认是当前时间和日期。
```

## 常用 Demo 代码

```php
<?php
date_default_timezone_set("Asia/Shanghai");
echo "<br>";
echo "当前时间是 " . date("h:i:sa");
$t1=date('Y-m-d H:i:s',strtotime("-2 hour"));
$t2=date('Y-m-d H:i:s',strtotime("+1 hour"));
$t3=date('Y-m-d H:i:s',strtotime("+1 day +1 hour +1 minute");

echo "<br>";
echo "当前t1时间是 " . $t1;
echo "<br>";
echo "当前2时间是 " . $t2;
exit;
?>
```

## 获得时区

```php
<?php
date_default_timezone_set("Asia/Shanghai");
echo "当前时间是 " . date("h:i:sa");
?>
```

## 删除

```php
checkdate() 验证格利高里日期。
date_add() 添加日、月、年、时、分和秒到日期。
date_create_from_format() 返回根据指定格式进行格式化的新的 DateTime 对象。
date_create() 返回新的 DateTime 对象。
date_date_set() 设置新日期。
date_default_timezone_get() 返回由所有的 Date/Time 函数使用的默认时区。
date_default_timezone_set() 设置由所有的 Date/Time 函数使用的默认时区。
date_diff() 返回两个日期间的差值。
date_format() 返回根据指定格式进行格式化的日期。
date_get_last_errors() 返回日期字符串中的警告/错误。
date_interval_create_from_date_string() 从字符串的相关部分建立 DateInterval。
date_interval_format() 格式化时间间隔。
date_isodate_set() 设置 ISO 日期。
date_modify() 修改时间戳。
date_offset_get() 返回时区偏移。
date_parse_from_format() 根据指定的格式返回带有关于指定日期的详细信息的关联数组。
date_parse() 返回带有关于指定日期的详细信息的关联数组。
date_sub() 从指定日期减去日、月、年、时、分和秒。
date_sun_info() 返回包含有关指定日期与地点的日出/日落和黄昏开始/黄昏结束的信息的数组。
date_sunrise() 返回指定日期与位置的日出时间。
date_sunset() 返回指定日期与位置的日落时间。
date_time_set() 设置时间。
date_timestamp_get() 返回 Unix 时间戳。
date_timestamp_set() 设置基于 Unix 时间戳的日期和时间。
date_timezone_get() 返回给定 DateTime 对象的时区。
date_timezone_set() 设置 DateTime 对象的时区。
date() 格式化本地日期和时间。
getdate() 返回某个时间戳或者当前本地的日期/时间的日期/时间信息。
gettimeofday() 返回当前时间。
gmdate() 格式化 GMT/UTC 日期和时间。
gmmktime() 返回 GMT 日期的 UNIX 时间戳。
gmstrftime() 根据区域设置对 GMT/UTC 日期和时间进行格式化。
idate() 将本地时间/日期格式化为整数。
localtime() 返回本地时间。
microtime() 返回当前时间的微秒数。
mktime() 返回日期的 Unix 时间戳。
strftime() 根据区域设置对本地时间/日期进行格式化。
strptime() 解析由 strftime() 生成的时间/日期。
strtotime() 将任何英文文本的日期或时间描述解析为 Unix 时间戳。
time() 返回当前时间的 Unix 时间戳。
timezone_abbreviations_list() 返回包含夏令时、偏移量和时区名称的关联数组。
timezone_identifiers_list() 返回带有所有时区标识符的索引数组。
timezone_location_get() 返回指定时区的位置信息。
timezone_name_from_abbr() 根据时区缩略语返回时区名称。
timezone_name_get() 返回时区的名称。
timezone_offset_get() 返回相对于 GMT 的时区偏移。
timezone_open() 创建新的 DateTimeZone 对象。
timezone_transitions_get() 返回时区的所有转换。
timezone_version_get() 返回时区数据库的版本。
```

## date_add

- PHP 版本： 5.3+

```php
<?php
$date=date_create("1980-10-15");
date_add($date,date_interval_create_from_date_string("100 days"));
echo date_format($date,"Y-m-d");
?>
```

```php
<?php
date_default_timezone_set('PRC'); //默认时区
echo "今天:",date("Y-m-d",time()),"<br>";
echo "今天:",date("Y-m-d",strtotime("18 june 2008")),"<br>";
echo "昨天:",date("Y-m-d",strtotime("-1 day")),"<br>";
echo "明天:",date("Y-m-d",strtotime("+1 day")),"<br>";
echo "一周后:",date("Y-m-d",strtotime("+1 week")),"<br>";
echo "一周零两天四小时两秒后:",date("Y-m-d G:H:s",strtotime("+1 week 2 days 4 hours 2 seconds")), "<br>";
echo "下个星期四:",date("Y-m-d",strtotime("next Thursday")),"<br>";
echo "上个周一:".date("Y-m-d",strtotime("last Monday"))."<br>";
echo "一个月前:".date("Y-m-d",strtotime("last month"))."<br>";
echo "一个月后:".date("Y-m-d",strtotime("+1 month"))."<br>";
echo "十年后:".date("Y-m-d",strtotime("+10 year"))."<br>";
?>
```

```php
//strtotime可以接受第二个参数，类型timestamp,为指定日期
echo date('Y-m-d', strtotime ("+1 day", strtotime('2011-11-01'))),"\n";
```

```php
<?php
echo "今天:",date('Y-m-d H:i:s'),"<br>";//输出当前时间
echo "明天:",date('Y-m-d H:i:s',strtotime('+1 day'));//输出明天时间
//这里+1 day 可以修改参数1为任何想需要的数  day也可以改成year（年），month（月），hour（小时），minute（分），second（秒）
//如:
date('Y-m-d H:i:s',strtotime("+1 day +1 hour +1 minute");
?>
```

```php
<?php
//下面这些代码是一些常用的日期处理函数了，可以两个时间的日期加减，两日期之差,日期转换时间截等。
echo date('Y-m-d',strtotime('+1 d',strtotime('2009-07-08')));//日期天数相加函数
echo date("Y-m-d",'1246982400');
echo '<br>';
echo date("Y-m-d",'1279123200');
die();
$d   =   "2009-07-08 10:19:00";
echo   date("Y-m-d",strtotime("$d   +1   day"));   //日期天数相加函数
function dateToTime($d){//把日期转换成时间堆截
$year=((int)substr("$d",0,4));//取得年份
$month=((int)substr("$d",5,2));//取得月份
$day=((int)substr("$d",8,2));//取得几号
return mktime(0,0,0,$month,$day,$year);
}
$Date_1="2009-07-08";
echo $Date_1+1;
$Date_2="2009-06-08";
$Date_List_a1=explode("-",$Date_1);
$Date_List_a2=explode("-",$Date_2);
$d1=mktime(0,0,0,$Date_List_a1[1],$Date_List_a1[2],$Date_List_a1[0]);
$d2=mktime(0,0,0,$Date_List_a2[1],$Date_List_a2[2],$Date_List_a2[0]);
$Days=round(($d1-$d2)/3600/24);
echo "两日期之前相差有$Days 天";
?>
```
