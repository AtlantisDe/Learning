# random

- [js 获取一个区间随机数 - 三三 - CSDN 博客](https://blog.csdn.net/qq_40776187/article/details/85230379)

## 代码

### 1. 代码 1

```c#
// 含有小数点
var max = 70;
var min = 30;
var random = Math.random() * (max - min) + min;
console.log(random);


// 整数随机数
var random = Math.random() * (500 - 100) + 100;
console.log(parseInt(random));


parseInt(Math.random() * (500 - 100) + 100);
console.log(parseInt(Math.random() * (500 - 100) + 100));
```

### 2. 代码 1

```c#
/**随机模块 0-9随机几个不重复数字 返回数组*/
function FunRandS0To9Limit(Limit) {
  var arr_4 = new Array();
  function getRandom(min, max) {
    var random = Math.random() * (max - min) + min;
    //向下取整
    random = Math.floor(random);

    if (arr_4.length < Limit) {
      for (i = 0; i <= arr_4.length; i++) {
        if (random == arr_4[i]) {
          break;
        } else {
          if (i == arr_4.length) {
            arr_4.push(random.toString());
            break;
          }
        }
      }
      getRandom(0, 10);
    }
  }
  getRandom(0, 10);
  return arr_4;
}
```

### 3. Select a random string from an array [duplicate]

- [Select a random string from an array](https://stackoverflow.com/questions/7350363/select-a-random-string-from-an-array)

```c#
/**图片 扩展名 */
function FunImageExt() {
  var arr = [".jpg", ".gif", ".jpeg", ".png"];
  var randomIndex = Math.floor(Math.random() * arr.length);
  var randomElement = arr[randomIndex];
  return randomElement;
}

/**图片 图片路径 */
function FunImagePath() {
  var arr = ["/Images", "/Uploads", "/Attachments", "/Pictures"];
  var randomIndex = Math.floor(Math.random() * arr.length);
  var randomElement = arr[randomIndex];
  return randomElement;
}

var textArray = ["song1.ogg", "song2.ogg"];
var randomNumber = Math.floor(Math.random() * textArray.length);
textArray[randomNumber];

var textArray = ["song1.ogg", "song2.ogg"];
var randomIndex = Math.floor(Math.random() * textArray.length);
var randomElement = textArray[randomIndex];
```
