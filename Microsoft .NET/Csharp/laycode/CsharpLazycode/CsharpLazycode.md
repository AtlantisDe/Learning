# 常用自己的语法

## 辅助类代码

### 等待延时

```c#
CsharpLazycode.Module.Laycode.sys.WaitDelay(1000, true);
CsharpLazycode.Module.Laycode.sys.WaitDelay(CsharpLazycode.Module.Laycode.random.NextIncludeMax(3, 5) * 1000, true);

var rid = CsharpLazycode.Module.Laycode.random.Next(0, ips.Length);
var rid = CsharpLazycode.Module.Laycode.random.Next(0, ips.Count);
var rid = CsharpLazycode.Module.Laycode.random.NextIncludeMax(20, 100);
var ridv = CsharpLazycode.Module.Laycode.random.NextIncludeMax(20, 100);
var ridv = CsharpLazycode.Module.Laycode.random.NextIncludeMax(Convert.ToInt32(arrleng[0]), Convert.ToInt32(arrleng[1]));
var port = CsharpLazycode.Module.Laycode.random.NextIncludeMax(1200, 65535);

newname = CsharpLazycode.Module.Laycode.random.GetRandomString(8, 20, true, true, true, false, "");

CsharpLazycode.Module.Laycode.random.GetRandomString(5, 20, true, true, true, false, "____")


var configurationNobase64 = CsharpLazycode.Module.base64.Util.afterDecodeRspace(configuration);
```

### MD5

```c#
 hrefmd5 = CsharpLazycode.Module.MessageDigestAlgorithm.Util.md5(_href);
```

### Base64

```c#
 var configurationNobase64 = CsharpLazycode.Module.base64.Util.afterDecodeRspace(configuration);
```

### Application.Exit()

- Application.Exit()只是发出终止的消息，并不立即退出 立即退出可以用 Environment.Exit(0)

```c#
System.Windows.Forms.Application.Exit();
System.Environment.Exit(0);

```

### window路径

```c#
CsharpLazycode.Module.Laycode.Path.Util.toWindowsstyle(hostPath + href);
```

### 分页

```c#
System.Environment.Exit(0);
```

### 执行 CMD

```c#
var cmd_run = CsharpLazycode.Module.Process.Util.RunCmd("taskkill /im cmd.exe /f");
var cmd_run = CsharpLazycode.Module.Process.Util.RunCmd("taskkill /im WerFault.exe /f");
```

### 中文字符个数

```c#
var count = CsharpLazycode.Module.Laycode.str.GetChineseCharactersCount(socure);
```

### 文本编码

```c#
 if (DemoTestTool.Module.DBini.Util.candoit == false) { return; }

var encoding = CsharpLazycode.Module.FileEncoding.Util.EncodingType.GetType(DemoTestTool.Module.DBini.Util.runfilepath);
if (encoding.EncodingName == Encoding.UTF8.EncodingName || encoding.EncodingName == CsharpLazycode.Module.encode.Util.GB2312.EncodingName)
{
}
else
{
    MessageBox.Show("文本文件不是标准的UTF8格式,无法进行转换.", "请确保编码正确", MessageBoxButtons.OK, MessageBoxIcon.Information);
    System.Environment.Exit(0);
    return;
}
```

### 匿名方法写法

1. 方法添加删除能出现在左边 += 或 -=
2. 根据方法参数写匿名方法内容大概是小括号() 接着 => {内容}

#### 示例代码

```c#
frm_th.Shown += (object sender, EventArgs e) =>
{
};
```
