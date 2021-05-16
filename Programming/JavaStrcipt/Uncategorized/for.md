# for

## 代码

```shell
# JavaScript 循环

# 假如您需要运行代码多次，且每次使用不同的值，那么循环（loop）相当方便使用。

# 通常我们会遇到使用数组的例子：

# 不需要这样写：
```

```c#
text += cars[0] + "<br>";
text += cars[1] + "<br>";
text += cars[2] + "<br>";
text += cars[3] + "<br>";
text += cars[4] + "<br>";
text += cars[5] + "<br>";
```

```c#
for (i = 0; i < cars.length; i++) {
  text += cars[i] + "<br>";
}

var text= "";
for (i = 1; i < 10; i++) {
    text += "news"+i+".com"+" ";
  }
  for (i = 1; i < 10; i++) {
    text += "www.news"+i+".com"+" ";
  }

for (i = 0; i < 100; i++) {
  text += "www.news"+i+".com";
}
for (i = 0; i < 100; i++) {
  text += "news"+i+".com"+"\r\n";
}

```

## js 中 forEach，for in，for of 循环的用法

- [js 中 forEach，for in，for of 循环的用法 - 探索之路慢慢 - 博客园](https://www.cnblogs.com/amujoe/p/8875053.html)

```c#

// 一、一般的遍历数组的方法:

    var array = [1,2,3,4,5,6,7];
    for (var i = 0; i < array.length; i++) {
        console.log(i,array[i]);
    }

// 二、用for in的方遍历数组
    var array = [1,2,3,4,5,6,7];
    for(let index in array) {
        console.log(index,array[index]);
    };

// 三、forEach

array.forEach(v=>{
    console.log(v);
});
array.forEach（function(v){
    console.log(v);
});

// 四、用for in不仅可以对数组,也可以对enumerable对象操作

var A = {a:1,b:2,c:3,d:"hello world"};
for(let k in A) {
    console.log(k,A[k]);
}

// 五、在ES6中,增加了一个for of循环,使用起来很简单

  for(let v of array) {
      console.log(v);
  };
  let s = "helloabc";

  for(let c of s) {

  console.log(c);

  }


```
