# array

## 清空数组

```js
// 多次测试发现第二种方式最快，第一种其次，大数据量下 第三种最慢。
// 测试结果可能不严谨。大家仅做参考。
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
