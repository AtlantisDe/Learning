# Js

## JSON转URL参数

```c#
function parseParams(data) {
    try {
        var tempArr = [];
        for (var i in data) {
            var key = encodeURIComponent(i);
            var value = encodeURIComponent(data[i]);
            tempArr.push(key + '=' + value);
        }
        var urlParamsStr = tempArr.join('&');
        return urlParamsStr;
    } catch (err) {
        return '';
    }
}

var obj = {
    name: 'zhangsan',
    age: 100
};

parseParams(obj); //"name=zhangsan&age=100"
```

## URL参数转JSON

```c#
function getParams(url) {
    try {
        var index = url.indexOf('?');
        url = url.match(/\?([^#]+)/)[1];
        var obj = {}, arr = url.split('&');
        for (var i = 0; i < arr.length; i++) {
            var subArr = arr[i].split('=');
            obj[subArr[0]] = subArr[1];
        }
        return obj;

    } catch (err) {
        return null;
    }
}

var urlStr = 'http://www.xxx.com/test?name=zhangshan&age=100#hello';

getParams(urlStr); //{name: "zhangshan", age: "100"}
```