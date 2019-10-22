# 文件操作

- [PHP 逐行读取 txt 文件的方法实例](http://www.php.cn/php-weizijiaocheng-389370.html)
- [PHP 读取文件内容的五种方式](https://www.cnblogs.com/qiufang/p/8985102.html)

## 逐行读取 TXT 文件

```php
/*
 * 逐行读取TXT文件
 */
function getTxtcontent($txtfile){
$file = @fopen($txtfile,'r');
$content = array();
if(!$file){
    return 'file open fail';
}else{
    $i = 0;
    while (!feof($file)){
        $content[$i] = mb_convert_encoding(fgets($file),"UTF-8","GBK,ASCII,ANSI,UTF-8");
        $i++ ;
    }
    fclose($file);
    $content = array_filter($content); //数组去空
}
return $content;
}

```

## 读取文件内容到文本字符串

```php
$file_path = "D:\demo.js";
if(file_exists($file_path)){
$str = file_get_contents($file_path);//将整个文件内容读入到一个字符串中
$str = str_replace("\r\n","<br />",$str);
echo $str;
}
```
