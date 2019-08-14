# Array

- [JavaScript Array](http://www.w3school.com.cn/jsref/jsref_obj_array.asp)

## 清空数组

```js
// 多次测试发现第二种方式最快，第一种其次，大数据量下 第三种最慢。
// 测试结果可能不严谨。大家仅做参考。
```

### 常用

```js
var Texts = "";
for (var i = 0; i < datas.length; i++) {
  Texts = Texts + datas[i][column] + (i < datas.length ? "\r\n" : "");
}
```

### 方式 1：splice 函数 清空数组的方法

```js
<script type="text/javascript">
  　　var arr = [1,2,3,4]; arr.splice(0,arr.length);
</script>
```

### 方式 2：给数组的 length 赋值为 0

```js
<script type="text/javascript">　　var arr = [1,2,3,4]; arr.length = 0;</script>
```

### 方式 3：直接赋予新数组 []

```js
<script type="text/javascript">　　var arr = [1,2,3,4]; arr = [];</script>
```

## 用法

### 代码 1

```js
myArray.push(44, 55);
a.data.push(b); //数组最后加一条记录
a.data.push(c);
a.data.push(d);
a.data.unshift(d); //数组最前面加一条记录
```

### js 如何动态添加数组

```js
var arr = [];
arr.push('new');
arr.push('element');
arr -> ['new', 'element']
```
