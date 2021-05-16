# linq.js

- [Getting Title at 33:54](https://github.com/neuecc/linq.js)
- [Most efficient method to groupby on an array of objects](https://stackoverflow.com/questions/14446511/most-efficient-method-to-groupby-on-an-array-of-objects)
- [JS 系列——Linq to js 使用小结 - 懒得安分 - 博客园](https://www.cnblogs.com/landeanfen/p/4672542.html)
- [linq js groupBy_Codec007 的专栏-CSDN 博客](https://blog.csdn.net/Codec007/article/details/82978136)

## 1. 常用

- [linq.js - Libraries - cdnjs - The #1 free and open source CDN built to make life easier for developers](https://cdnjs.com/libraries/linq.js)

```c#
var myList = [
            { Name: "Jim", Age: 20 },
            { Name: "Kate", Age: 21 },
            { Name: "Lilei", Age: 18 },
            { Name: "John", Age: 14 },
            { Name: "LinTao", Age: 25 }
    ];

var arrRes = Enumerable.from(myList).where("x=>x.Name=='Jim'").toArray();

```

## 2. CDN

- [ation from Rx, Achiral, Haskell, Ruby, etc...) | BootCDN - Bootstrap 中文网开源项目免费 CDN 加速服务](https://www.bootcdn.cn/linq.js/)

```c#
// linq.js - LINQ for JavaScript. Implements all .NET 4.0 LINQ to Objects methods and many extra methods (inspiration from Rx, Achiral, Haskell, Ruby, etc...)
https://cdnjs.com/libraries/linq.js


<script src="https://cdn.bootcdn.net/ajax/libs/linq.js/3.2.3/linq.js"></script>

<script src="https://cdn.bootcdn.net/ajax/libs/linq.js/3.2.3/linq.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/linq.js/3.2.3/linq.min.js" integrity="sha512-acUZGEXElkN4ekXih5uYTJOkp+N1xoiIvhD6Uzkuh7LhRt0fWNmn0McKA9Fo3De9tQ9Vc7r6Fbg+WXq6zTuHtg==" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/linq.js/3.2.3/linq.min.js" integrity="sha512-acUZGEXElkN4ekXih5uYTJOkp+N1xoiIvhD6Uzkuh7LhRt0fWNmn0McKA9Fo3De9tQ9Vc7r6Fbg+WXq6zTuHtg==" crossorigin="anonymous"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/linq.js/3.2.3/linq.min.js"></script>

```

## 3. linq js groupBy

```c#
var list=[
  {id:1,name:"lily",gender:0,o:{id:123}},
  {id:2,name:"lucy",gender:0,o:{id:456}},
  {id:3,name:"lilei",gender:1,o:{id:123}},
  {id:4,name:"hanmeimei",gender:0,o:{id:789}}
];

Enumerable.from(list).groupBy(x=>x.o.id).select(x=>({key:x.key(),source:x.getSource()})).toArray();

// 其它语法
Enumerable.from(SinaHQCategoryItems).groupBy(x=>x.Lv1name).select(x=>({key:x.key(),source:x.getSource()})).toArray();
```

## 4. use .Contains() in linq.js

- [use .Contains() in linq.js](https://javascriptio.com/view/3261151/use-contains-in-linq-js)

## 5. How to write Enumerable 'like' query using linq.js

- [How to write Enumerable &#x27;like&#x27; query using linq.js](https://stackoverflow.com/questions/34150032/how-to-write-enumerable-like-query-using-linq-js)

```c#
var array = Enumerable.from(SinaSymbolCategoryItems).where("~($.NodesText).toUpperCase().indexOf(',new_blhy,'.toUpperCase())").toArray();

var _gramrTree = [{ "_Id": "0001", "_PatentId": "0000", "_Text": "Employee", "_Value": "employee", "_PermissionLevel": 55 }, { "_Id": "0002", "_PatentId": "0000", "_Text": "Employees", "_Value": "employees", "_PermissionLevel": 55 }, { "_Id": "0002", "_PatentId": "0001", "_Text": "Dept", "_Value": "Dept", "_PermissionLevel": 55 }],
qryResult = Enumerable.From(_gramrTree).Where("~($._Text).toUpperCase().indexOf('emp'.toUpperCase())").ToArray();

document.write('<pre>' + JSON.stringify(qryResult, 0, 4) + '</pre>');

var qryResult = Enumerable.From(_gramrTree)
    .Where("!!$._Text.match(/^"Emp"/i)")
    .OrderBy("$._Text")
    .Select("$._Text")
    .ToArray()
```
