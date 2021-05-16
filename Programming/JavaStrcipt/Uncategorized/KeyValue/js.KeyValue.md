# KeyValue

- [js object 动态生成 key](https://blog.csdn.net/u012891504/article/details/52087637)
- [动态-JS 实现给对象动态添加属性并赋值 及 实现 AJAX data 传递动态 key 键名](https://blog.csdn.net/qq_39028580/article/details/78871618)

## 常用

```c#
param = null;
var key = "user";
var value = "John";
param[key] = value; //这里的key才能是动态生成的

param = null;
var key = "user";
var value = "John";
param[key] = value;
```

## js 对象通过属性或者属性值相对应查找

```c#
var obj = {
  buJiMianCheSun: "1",
  buJiMianCheSunRMB: "",
  buJiMianChengKe: "1",
  buJiMianChengKeRMB: "",
  buJiMianDaoQiang: "1",
  buJiMianDaoQiangRMB: "",
  buJiMianHuaHen: "0",
  carNo: "我是车牌",
  carUserType: "222",
  carVin: "333",
  carno_mark: "",
  cheSun: "4444",
  cheSunRMB: "",
  cheZhuIdNumber: "1325211",
};

function inFn(object, val) {
  var array = Object.keys(object); //此处是查找对象所有的属性值
  var listArray = [];
  var list = new Object();
  for (var item in array) {
    if (array[item].indexOf(val) == -1) {
      //没有出现就返回-1
      /*console.log(object[array[item]])
     console.log(array[item])*/
    } else {
      if (
        object[array[item]] != "" &&
        object[array[item]] != null &&
        object[array[item]] != 0
      ) {
        console.log(array[item]);
        console.log(object[array[item]]); //这样就出来了
        //如果想拼接出来相对应的就得这样
        list[array[item]] = object[array[item]];
      }
    }
  }
  console.log(list); //之前用的object. 死活不行  最后还是得要积累经验！！
}
inFn(obj, "buJiMian");

function findKey(obj, value, compare = (a, b) => a === b) {
  return Object.keys(obj).find((k) => compare(obj[k], value));
}

// function findKey(obj,value){
//   return Object.keys(obj).find((k)=>{
//     return obj[k]==value
//   })
// }

console.log(findKey(obj, "我是车牌"));
```
