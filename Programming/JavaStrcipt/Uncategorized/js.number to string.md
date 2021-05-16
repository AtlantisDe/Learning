# number to string

- [JS 数字转字符串的方法(number to string) - 诚明小巫 - 博客园](https://www.cnblogs.com/chengmingxiaowu/p/10036473.html)

## 1. number to string

```c#
// 一、双点解析
88..toString();

// 二、括号先计算再转换
(88).toString();

// 三、加空串
88 + ''
```

## 2. string to number

```c#
parseInt("abc") // Returns NaN.
parseInt("12abc") // Returns 12.
parseInt("12") //Return 12.
Math.abs(-1);  //1
Math.abs(-2);  //2

parseInt("1234blue"); //returns 1234
parseInt("0xA"); //returns 10
parseInt("22.5"); //returns 22
parseInt("blue"); //returns NaN
parseInt("AF", 16); //returns 175

parseInt("10", 2); //returns 2
parseInt("10", 8); //returns 8
parseInt("10", 10); //returns 10

parseInt("010"); //returns 8
parseInt("010", 8); //returns 8
parseInt("010", 10); //returns 10


parseFloat("1234blue"); //returns 1234.0
parseFloat("0xA"); //returns NaN
parseFloat("22.5"); //returns 22.5
parseFloat("22.34.5"); //returns 22.34
parseFloat("0908"); //returns 908
parseFloat("blue"); //returns NaN


//INT判断
if (parseInt("abc")>0){console.log('yes')}else{console.log('no');}
if (parseInt("abc9999")>0){console.log('yes')}else{console.log('no');}
if (parseInt("6666")>0){console.log('yes')}else{console.log('no');}
if (parseInt("6666.23")>0){console.log('yes')}else{console.log('no');}
// Float
if (parseFloat("abc")>0){console.log('yes')}else{console.log('no');}
if (parseFloat("abc9999")>0){console.log('yes')}else{console.log('no');}
if (parseFloat("6666")>0){console.log('yes')}else{console.log('no');}
if (parseFloat("6666.23")>0){console.log('yes')}else{console.log('no');}

```

## 3. JavaScript parseFloat() Function

- [Error Happened](https://www.w3schools.com/jsref/jsref_parsefloat.asp)

```c#
var b = parseFloat("-10.00") //-10

var a = parseFloat("10")
var b = parseFloat("10.00")
var c = parseFloat("10.33")
var d = parseFloat("34 45 66")
var e = parseFloat(" 60 ")
var f = parseFloat("40 years")
var g = parseFloat("He was 40")
```
