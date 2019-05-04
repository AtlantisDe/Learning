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
