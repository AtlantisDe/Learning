# groupBy

- [Getting Title at 13:06](https://lodash.com/docs/4.17.15#groupBy)
- [JS 中的 groupBy 方法 - 只争朝夕，不负韶华 - 博客园](https://www.cnblogs.com/aidixie/p/12741193.html)
- [JS 中的 groupBy 方法](https://segmentfault.com/a/1190000011201544)
- [js 分组（group by） 风火一回，一生不毁-CSDN 博客](https://blog.csdn.net/mafan121/article/details/83418116)
- [Most efficient method to groupby on an array of objects](https://stackoverflow.com/questions/14446511/most-efficient-method-to-groupby-on-an-array-of-objects)

## 常用

### 1. 代码 1

```c#
/**JS  groupBy 方法*/
function groupBy( array , id ) {
    let groups = {};
    array.forEach( function( o ) {
        let group = JSON.stringify( o[id] );
        groups[group] = groups[group] || [];
        groups[group].push( o );
    });
    return Object.values(groups);
}

let name = "name"
let list = [
    {"name": "John","Average":15,"High":10,"DtmStamp":1358226000000},
    {"name": "Jane","Average":16,"High":92,"DtmStamp":1358226000000},
    {"name": "Jane","Average":17,"High":45,"DtmStamp":1358226000000},
    {"name": "John","Average":18,"High":87,"DtmStamp":1358226000000},
    {"name": "Jane","Average":15,"High":10,"DtmStamp":1358226060000},
    {"name": "John","Average":16,"High":87,"DtmStamp":1358226060000},
    {"name": "John","Average":17,"High":45,"DtmStamp":1358226060000},
    {"name": "Jane","Average":18,"High":92,"DtmStamp":1358226060000}
];
let sorted = groupBy(list, name);
console.log(sorted);
```

### 2. 代码 2

```c#
var list = [
  {"name": "John", "Average": 15, "High": 10, "DtmStamp": 1358226000000},
  {"name": "Jane", "Average": 16, "High": 92, "DtmStamp": 1358226000000},
  {"name": "Jane", "Average": 17, "High": 45, "DtmStamp": 1358226000000},
  {"name": "John", "Average": 18, "High": 87, "DtmStamp": 1358226000000},
  {"name": "Jane", "Average": 15, "High": 10, "DtmStamp": 1358226060000},
  {"name": "John", "Average": 16, "High": 87, "DtmStamp": 1358226060000},
  {"name": "John", "Average": 17, "High": 45, "DtmStamp": 1358226060000},
  {"name": "Jane", "Average": 18, "High": 92, "DtmStamp": 1358226060000}
];

function ngOnInit() {
  const sorted = this.groupBy(this.list, function (item) {
    return [item.name];
  });
  console.log(sorted);

}

function groupBy(array, f) {
  //debugger;
  const groups = {};
  array.forEach(function (o) {
    const group = JSON.stringify(f(o));
    groups[group] = groups[group] || [];
    groups[group].push(o);
  });
  return Object.keys(groups).map(function (group) {
    return groups[group];
  });
}

ngOnInit()
```

### 3. 代码 3

```c#
var cars = [{'make':'audi','model':'r8','year':'2012'},{'make':'audi','model':'rs5','year':'2013'},{'make':'ford','model':'mustang','year':'2012'},{'make':'ford','model':'fusion','year':'2015'},{'make':'kia','model':'optima','year':'2012'},];

var grouped = _.groupBy(cars, function(car) {
  return car.make;
});

console.log(grouped);
```

### 4. 代码 4

```c#
var cars = [{'make':'audi','model':'r8','year':'2012'},{'make':'audi','model':'rs5','year':'2013'},{'make':'ford','model':'mustang','year':'2012'},{'make':'ford','model':'fusion','year':'2015'},{'make':'kia','model':'optima','year':'2012'},];

var res = _.groupBy(cars,(car)=>{
    const makeValue=car.make;
    delete car.make;
    return makeValue;
})
console.log(res);

console.log(cars);
```

### 5. 代码 5

```c#
let newcars = {}

cars.forEach(car => {
  newcars[car.make] ? // check if that array exists or not in newcars object
    newcars[car.make].push({model: car.model, year: car.year})  // just push
   : (newcars[car.make] = [], newcars[car.make].push({model: car.model, year: car.year})) // create a new array and push
})

console.log(newcars);
```
