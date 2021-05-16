# ToBoolean

- 使用注意 转换为 ToBoolean 一定要为字符串的 true 或者 false 不能为是 0 或者 1 否则报异常

## 代码

### 1. C#版本

```c#
var with = (double?) jToken[key] ?? 100;


var value = "false";
var demobool = Convert.ToBoolean(value);

if (site.Nodes.Hostitem?.Deployment == true)
{

}
```

### 2. JS 版本

```c#
function GetcheckboxValuetrueOrfalse_for_save(tagguid) {
  // console.log(tagguid);
  var val = "false";
  if (tagguid == "true" || tagguid == 1) {
    val = "true";
  }
  // console.log(val);
  return val;
}

function GetcheckboxValuetrueOrfalse_for_readUIshow(tagguid) {
  // console.log(tagguid);
  var val = "";
  if (tagguid == "true" || tagguid == 1) {
    val = "true";
  }
  // console.log(val);
  return val;
}
```
