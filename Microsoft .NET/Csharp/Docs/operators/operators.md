# operators

- [C# operators](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/index)
- [C# 运算符](https://docs.microsoft.com/zh-cn/dotnet/csharp/language-reference/operators/index)

## 常用

### 1. 非空运算符

```c#
Request?.Browser?.Browser??""

UserItem userItem = new UserItem();
var aa = userItem?.PassItem?.Pass ?? "";
if (userItem?.PassItem?.Pass == "1")
{
}
else
{
}
userItem.PassItem = new PassItem();
var bb = userItem?.PassItem?.Pass ?? "";
userItem.PassItem = new PassItem() { Pass = "111" };
var cc = userItem?.PassItem?.Pass ?? "";
if (userItem?.PassItem?.Pass == "111")
{
}
else
{
}
```
