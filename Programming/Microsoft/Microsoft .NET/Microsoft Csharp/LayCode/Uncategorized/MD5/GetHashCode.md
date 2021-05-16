# GetHashCode

- [C# GetHashCode 在 x64 与 x86 版本下不一样 - zhaogaojian - 博客园](https://www.cnblogs.com/zhaogaojian/p/10417638.html)
- 最好指定一下目标平台
- [除版本库不同还有什么原因会影响 String.GetHashCode](https://ask.csdn.net/questions/341620)
- [关于 hashCode() 你需要了解的 3 件事 - 沙漏哟 - 博客园](https://www.cnblogs.com/yeahwell/p/7572496.html)

## 常用

```c#
var hash1 = "A".GetHashCode();
var hash2 = "a".GetHashCode();

var md51 = "A".Md5();
var md52 = "a".Md5();


```

## PHP 代码

```php
public function value_with_string($string, $file)
{
    if (!file_exists($file)) {
        return '文件不存在：' . $file;
    }
    if (!md5($string)) {
        return '散列计算错误：' . $string;
    }
    $str_md5      = str_replace(array('a', 'b', 'c', 'd', 'e', 'f'), array(1, 2, 3, 4, 5), md5($string));
    $arr_keywords = explode(PHP_EOL, mb_convert_encoding(file_get_contents($file), 'UTF-8', 'UTF-8,GBK,GB2312,BIG5'));
    $count        = count($arr_keywords) - 1;
    $sublen       = strlen($count);
    $i            = 0;
    $index        = substr($str_md5, substr($str_md5, $i, 1), $sublen);
    while ($index > $count) {
        $i++;
        if ($i > 17) {
            $sublen--;
        }
        $index = substr($str_md5, substr($str_md5, $i, 1), $sublen);
    }
    return $arr_keywords[(int) $index];
}
```
