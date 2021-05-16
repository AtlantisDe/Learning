# js 数字类

- [JavaScript NaN 属性](https://www.w3school.com.cn/jsref/jsref_nan.asp)
- [js 类型转换-字符串转整型、浮点型方法-【科 e 互联】](http://www.internetke.com/m3_itm_mode1_139.html)

## 常用

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
