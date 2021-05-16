# while

## 常用

### 循环内部跳出 示例代码参考写法 再次使用自己调整逻辑

```c#
//失败返回-1 成功大于0
        public static int getRandomCanInsertNextIndexValueFromIndexsitems(string oldstring, List<keywordfindindexitem> keywordfindindexitems)
        {
            var keywordfindindexitem = getRandomitemFromIndexsitems(keywordfindindexitems);
            var oknextindex = -1;
            var okindex = 0;
            var count = 0;
            while (true)
            {
                count++; if (count >= 10 || Go001() == true) { break; }
            }

            bool Go001()
            {
                var rid = CsharpLazycode.Module.Laycode.random.Next(0, keywordfindindexitem.indexs.Count - 1);
                if (keywordfindindexitem.indexs.IsNullOrEmpty() == false && keywordfindindexitem.indexs.Count > 0)
                {
                    okindex = keywordfindindexitem.indexs[rid];
                    var tmp = oldstring.IndexOf(keywordfindindexitem.key, okindex);
                    if (tmp > 0)
                    {
                        oknextindex = tmp;
                        return true;
                    }

                }
                return false;
            }



            return oknextindex;
        }

```
