# for

## 代码

```shell
# JavaScript 循环

# 假如您需要运行代码多次，且每次使用不同的值，那么循环（loop）相当方便使用。

# 通常我们会遇到使用数组的例子：

# 不需要这样写：
```

```js
text += cars[0] + "<br>";
text += cars[1] + "<br>";
text += cars[2] + "<br>";
text += cars[3] + "<br>";
text += cars[4] + "<br>";
text += cars[5] + "<br>";
```

```js
for (i = 0; i < cars.length; i++) {
  text += cars[i] + "<br>";
}
```
