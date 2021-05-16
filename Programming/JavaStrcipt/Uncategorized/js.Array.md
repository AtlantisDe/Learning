# js Array

- [JavaScript Array](http://www.w3school.com.cn/jsref/jsref_obj_array.asp)

## 清空数组

```c#
// 多次测试发现第二种方式最快，第一种其次，大数据量下 第三种最慢。
// 测试结果可能不严谨。大家仅做参考。
```

### 常用

```c#
var Texts = "";
for (var i = 0; i < datas.length; i++) {
  Texts = Texts + datas[i][column] + (i < datas.length ? "\r\n" : "");
}
```

### 方式 1：splice 函数 清空数组的方法

```c#
<script type="text/javascript">
  　　var arr = [1,2,3,4]; arr.splice(0,arr.length);
</script>
```

### 方式 2：给数组的 length 赋值为 0

```c#
<script type="text/javascript">　　var arr = [1,2,3,4]; arr.length = 0;</script>
```

### 方式 3：直接赋予新数组 []

```c#
<script type="text/javascript">　　var arr = [1,2,3,4]; arr = [];</script>
```

### 方式 4：数组+数组 Array.prototype.concat()

- [Array.prototype.concat()](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/concat)

```C#
// Array.prototype.concat()

const array1 = ['a', 'b', 'c'];
const array2 = ['d', 'e', 'f'];
const array3 = array1.concat(array2);

console.log(array3);
// expected output: Array ["a", "b", "c", "d", "e", "f"]

/*写法正确 必须另外new一个对象来接收否则先定义的对象即将失效.*/
var arr1 = [1,2,3,4];
var arr2 = [1,2,3,4];
var arr3 = arr1.concat(arr2);
arr3


/*如下写法也不准确*/
var arr0 = [1,2];
var arr1 = [1,2,3,4];
var arr2 = [1,2,3,4];
arr0.concat(arr1);
arr0.concat(arr2);
arr0



var arr0 = [];
var arr1 = [1,2,3,4];
var arr2 = [1,2,3,4];
arr0.push(arr1);
arr0.push(arr2);
/*即将保存的是对象*/
arr0
/*输出如下*/
0: (4) [1, 2, 3, 4]
1: (4) [1, 2, 3, 4]
```

## 用法

### 1. 代码 1

```c#
myArray.push(44, 55);
a.data.push(b); //数组最后加一条记录
a.data.push(c);
a.data.push(d);
a.data.unshift(d); //数组最前面加一条记录
```

### 2. js 如何动态添加数组

```c#
var arr = [];
arr.push('new');
arr.push('element');
arr -> ['new', 'element']
```

### 3. 遍历对象数组及对象属性

```c#
for (var item = 0; item < DemoItems.length; item++) {
  //遍历对象数组，item表示某个具体的对象
  for (var i in item) {
    //使用for in 遍历对象属性
    console.log(DemoItems[item][i]); //objectList[item][i]表示某个对象的某个
    //具体属性值，i表示属性名，可以打印出来看一下；
  }
}
```

### 4. js 遍历对象所有的属性名称和值

```c#
/*
 * 用来遍历指定对象所有的属性名称和值
 * obj 需要遍历的对象
 * author: Jet Mah
 * website: http://www.javatang.com/archives/2006/09/13/442864.html
 */
function allPrpos(obj) {
  // 用来保存所有的属性名称和值
  var props = "";
  // 开始遍历
  for (var p in obj) {
    // 方法
    if (typeof obj[p] == "function") {
      obj[p]();
    } else {
      // p 为属性名称，obj[p]为对应属性的值
      props += p + "=" + obj[p] + "\t";
    }
  }
  // 最后显示所有的属性
  alert(props);
}
```

### 5. JS 数组转字符串（3 种方法）

- [JS 数组转字符串（3 种方法）](http://c.biancheng.net/view/5673.html)

```c#
// 常用
var a = [1, 2, 3, 4, 5];
var s = a.join("\r\n");
console.log(s);

// 下面使用 join() 方法可以把数组转换为字符串。
// join() 方法可以把数组转换为字符串，不过它可以指定分隔符。在调用 join() 方法时，可以传递一个参数作为分隔符来连接每个元素。如果省略参数，默认使用逗号作为分隔符，这时与 toString() 方法转换操作效果相同。
var a = [1, 2, 3, 4, 5]; //定义数组
var s = a.join("=="); //指定分隔符
console.log(s); //返回字符串“1==2==3==4==5”

// 下面使用 split() 方法把字符串转换为数组。
// split() 方法是 String 对象方法，与 join() 方法操作正好相反。该方法可以指定两个参数，第 1 个参数为分隔符，指定从哪儿进行分隔的标记；第 2 个参数指定要返回数组的长度。
var s = "1==2== 3==4 ==5";
var a = s.split("==");
console.log(a);
console.log(a.constructor == Array);
```

### 6. Array.prototype.join()

- [Array.prototype.join()](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/join)

```c#
const elements = ['Fire', 'Air', 'Water'];

console.log(elements.join());
// expected output: "Fire,Air,Water"

console.log(elements.join(''));
// expected output: "FireAirWater"

console.log(elements.join('-'));
// expected output: "Fire-Air-Water"

```
