# JavaScript Cookie

- [JavaScript Cookie | 菜鸟教程](https://www.runoob.com/js/js-cookies.html)

## 用法

```c#
// 使用 JavaScript 创建Cookie
// JavaScript 可以使用 document.cookie 属性来创建 、读取、及删除 cookie。
// JavaScript 中，创建 cookie 如下所示：

document.cookie="username=John Doe";

// 您还可以为 cookie 添加一个过期时间（以 UTC 或 GMT 时间）。默认情况下，cookie 在浏览器关闭时删除：

document.cookie="username=John Doe; expires=Thu, 18 Dec 2043 12:00:00 GMT";

// 您可以使用 path 参数告诉浏览器 cookie 的路径。默认情况下，cookie 属于当前页面。

document.cookie="username=John Doe; expires=Thu, 18 Dec 2043 12:00:00 GMT; path=/";
```

### 1. 使用 JavaScript 创建 Cookie

```c#
// JavaScript 可以使用 document.cookie 属性来创建 、读取、及删除 cookie。
// JavaScript 中，创建 cookie 如下所示：
document.cookie="username=John Doe";
// 您还可以为 cookie 添加一个过期时间（以 UTC 或 GMT 时间）。默认情况下，cookie 在浏览器关闭时删除：
document.cookie="username=John Doe; expires=Thu, 18 Dec 2043 12:00:00 GMT";
// 您可以使用 path 参数告诉浏览器 cookie 的路径。默认情况下，cookie 属于当前页面。
document.cookie="username=John Doe; expires=Thu, 18 Dec 2043 12:00:00 GMT; path=/";
```

### 2. 使用 JavaScript 读取 Cookie

```c#
// JavaScript 可以使用 document.cookie 属性来创建 、读取、及删除 cookie。
在 JavaScript 中, 可以使用以下代码来读取 cookie：

var x = document.cookie;

// document.cookie 将以字符串的方式返回所有的 cookie，类型格式： cookie1=value; cookie2=value; cookie3=value;
```

### 3. 使用 JavaScript 修改 Cookie

```c#
// 在 JavaScript 中，修改 cookie 类似于创建 cookie，如下所示：
document.cookie="username=John Smith; expires=Thu, 18 Dec 2043 12:00:00 GMT; path=/";
// 旧的 cookie 将被覆盖。
```

### 4. 使用 JavaScript 删除 Cookie

```c#
// 删除 cookie 非常简单。您只需要设置 expires 参数为以前的时间即可，如下所示，设置为 Thu, 01 Jan 1970 00:00:00 GMT:
document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
// 注意，当您删除时不必指定 cookie 的值。
```

### 5. Cookie 字符串

```c#
// document.cookie 属性看起来像一个普通的文本字符串，其实它不是。
// 即使您在 document.cookie 中写入一个完整的 cookie 字符串, 当您重新读取该 cookie 信息时，cookie 信息是以名/值对的形式展示的。
// 如果您设置了新的 cookie，旧的 cookie 不会被覆盖。 新 cookie 将添加到 document.cookie 中，所以如果您重新读取document.cookie，您将获得如下所示的数据：

cookie1=value; cookie2=value;

// 显示所有 Cookie  创建 Cookie 1  创建 Cookie 2 删除 Cookie 1  删除 Cookie 2
// 如果您需要查找一个指定 cookie 值，您必须创建一个JavaScript 函数在 cookie 字符串中查找 cookie 值。
```
