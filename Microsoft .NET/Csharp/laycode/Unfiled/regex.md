# C#正则相关

## 正则代码

```c#
private static string GetRegexStr_codes_str(string reString)
        {
            System.Text.RegularExpressions.Regex reg;
            List<string> strList = new List<string>();
            string regexCode;
            regexCode = "\"codes_str\":\"(.*?)\",\"ii\":";


            reg = new System.Text.RegularExpressions.Regex(regexCode);
            System.Text.RegularExpressions.MatchCollection mc = reg.Matches(reString);
            for (int i = 0; i < mc.Count; i++)
            {
                GroupCollection gc = mc[i].Groups; //得到所有分组
                for (int j = 1; j < gc.Count; j++) //多分组 匹配的原始文本不要
                {
                    string temp = gc[j].Value;
                    if (!string.IsNullOrEmpty(temp))
                    {
                        strList.Add(temp); //获取结果   strList中为匹配的值
                    }
                }
            }

            string aa = reString;

            for (int i = 0; i < strList.Count; i++)
            {
                aa = aa.Replace(strList[i], "");
            }

            return aa;
        }
```

### C#判断字符串是否只有数字和字母组成

```C#
// 正则表达式判断
/*

下面正则:满足数字或字母或者英文逗号
"^[0-9a-zA-Z.]+$"

下面正则:满足数字或字母
"^[0-9a-zA-Z]+$"

下面正则:满足必须包含数字和字母
"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-zA-Z]+$"


*/
if (System.Text.RegularExpressions.Regex.IsMatch("01123a.**aaS", "^[0-9a-zA-Z.]+$"))
{
    System.Diagnostics.Debug.WriteLine("是符合要求字符");
}
else System.Diagnostics.Debug.WriteLine("不是符合要求的字符");
```

### 字符串中如何删除掉“特殊字符”

```C#
// 特殊字符包含下划线的话用这个
string 结果 = Regex.Replace(字符串, "[^0-9A-Za-z]", "");
// 不包含下划线用这个
Regex.Replace(字符串, "\W", "")
//经过测试似乎有bug 满足常规使用
 var a = Regex.Replace("asdfas@!#$^(&**&)*(_)❤❥웃유♋☮✌☏☢☠✔☑♚▲♪✈✞÷↑↓◆◇⊙■□△▽¿─│♥❣♂♀☿Ⓐ✍✉☣☤✘☒♛▼♫⌘☪≈←→◈◎☉★☆⊿※¡━┃♡ღツ☼☁❅♒✎©®™Σ✪✯☭➳卐√↖↗●◐Θ◤◥︻〖〗┄┆℃℉°✿ϟ☃☂✄¢€£∞✫★½✡×↙↘○◑⊕◣◢︼【】┅┇☽☾✚〓▂▃▄▅▆▇█▉▊▋▌▍▎▏↔↕☽☾の•▸◂(*_235234 你好我的世界 @#$%@#$^%#$^ -asd 你", @"\W", "");
```
