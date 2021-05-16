# InputBox

- [PowerShell 制作提示窗口 - 爱做梦的鱼 - 博客园](https://www.cnblogs.com/dreamer-fish/archive/2013/01/22/2870747.html)
- [创建自定义输入框 - PowerShell](https://docs.microsoft.com/zh-cn/powershell/scripting/samples/creating-a-custom-input-box?view=powershell-7)
- [powershell: how to prompt to enter a variable](https://community.spiceworks.com/topic/148538-powershell-how-to-prompt-to-enter-a-variable)

## 常用

```c#
[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
$computer = [Microsoft.VisualBasic.Interaction]::InputBox("Enter a computer name", "Computer", "$env:computername")

$name = [Microsoft.VisualBasic.Interaction]::InputBox("Enter your name", "Name", "$env:username")
"Your name is $name"
```
