# jq btn

- [jquery 禁用、启用 button 以及 button 的样式操作 - 你好，我们在哪里见过啊！ - CSDN 博客](https://blog.csdn.net/qq_38455201/article/details/80591530)
- 给 button 设置 css 样式

## 操作代码

### jquery 禁用、启用 button 以及 button 的样式操作

#### 禁用

```C#
<button id="btn" disabled="disabled">设置按钮不可以点击</button>
```

- js 禁用 button

```c#
document.getElementById("btn").disabled = true;
```

- 使用 jquery 禁用 button

```c#
$("#btn").attr("disabled", true);
$("#btn").attr("disabled", "disabled");
$("#btn").prop("disabled", "disabled");
```

#### 启用

- 使用 js 启用 button

```c#
document.getElementById("btn").disabled = true;
```

- 使用 jquery 禁用 button

```c#
$("#btn").attr("disabled", false);
$("#btn").removeAttr("disabled");
$("#btn").attr("disabled", "");
```
