# 数组随机提取元素

## 随机提取元素

```php
<?php
class getValues {
   function __construct($inputArray){
        $this->inputArray = $inputArray;
   }
    //该函数此处没用到
    public function inputValue($inputArray) {
        $this->inputArray = $inputArray;
    }
    public function getValue($number) {
        $this->number = $number;
        for($i = 0; $i < $this->number; $i ++) {
          $count = count ( $this->inputArray ) - 1 - $i;
          $index = rand ( 0, $count);
          $getArray [$i] = $this->inputArray [$index];
          $temp = $this->inputArray [$count];
          $this->inputArray [$count] = $this->inputArray [$index];
          $this->inputArray [$index] = $temp;
        }
        //asort ( $getArray ); // 从小到大排序，根据需要修改
        return $getArray;
    }
}

//测试代码
$keywords  = array(
        "aa",
        "bb",
        "ccc"
);
$getValue=new getValues($keywords);
$key = $getValue->getValue(1);//从数组中随机抽取一个元素
print_r($key);
?>
```

## php 获取随机字符串的几种方法

- [php 获取随机字符串的几种方法 - myIvan - 博客园](https://www.cnblogs.com/myIvan/p/9533189.html)

```php
function randKey($len)
{
$chars = array( "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" );
$charsLen = count($chars) - 1;
shuffle($chars);
$str = "";
for ($i=0; $i<$len; $i++)
{
$str .= $chars[mt_rand(0, $charsLen)];
}
return $str;
}
```
