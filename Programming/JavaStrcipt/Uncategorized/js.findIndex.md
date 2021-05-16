# findIndex

- [JS 实现查找数组中对象的属性值是否存在示例](https://www.jb51.net/article/161867.htm)

```c#
<script>
  var studentsArray =
    [
      {
        "rollnumber": 1,
        "name": "dj",
        "subject": "physics"
      },
      {
        "rollnumber": 2,
        "name": "tanmay",
        "subject": "biology"
      },
      {
        "rollnumber": 3,
        "name": "amit",
        "subject": "chemistry"
      }
    ];

  function functiontofindIndexByKeyValue(arraytosearch, key, valuetosearch) {
    for (var i = 0; i < arraytosearch.length; i++) {
      if (arraytosearch[i][key] == valuetosearch) {
        return i;
      }
    }
    return null;
  }
  var index = functiontofindIndexByKeyValue(studentsArray, "rollnumber", 3);
  console.log(index);
</script>
```
