# C#JSON 相关

## C#里几种 Json 字符串特殊字符的转义

```c#
/// <summary>
///   替换部分字符串
/// </summary>
/// <param name="sPassed">需要替换的字符串</param>
/// <returns></returns>
public static string ReplaceString(string JsonString)
{
if (JsonString == null) { return JsonString; }
if (JsonString.Contains("\\"))
{
    JsonString = JsonString.Replace("\\", "\\\\");
}
if (JsonString.Contains("\'"))
{
    JsonString = JsonString.Replace("\'", "\\\'");
}
if (JsonString.Contains("\""))
{
    JsonString = JsonString.Replace("\"", "\\\"");
}
//去掉字符串的回车换行符
JsonString = Regex.Replace(JsonString, @"[\n\r]", "");
JsonString = JsonString.Trim();
return JsonString;
}
```
