# Microsoft.mshtml

```c#
 //再来处理一次
        try
        {
            var doc = new mshtml.HTMLDocument();
            var doc2 = (mshtml.IHTMLDocument2)doc;
            doc2.write(newhtmlcode);
            var codehtml = doc.documentElement.outerHTML;
            var codeText = doc.documentElement.innerText;

            var arrlines = codeText.Split("\r\n".ToArray(), StringSplitOptions.None);
            newhtmlcode = "";
            for (int i = 0; i < arrlines.Length; i++)
            {
                var item = arrlines[i];
                newhtmlcode = newhtmlcode + Scrapy.Pstyle(item);
            }

        }
        catch (Exception Exhtml)
        {

            Console.WriteLine(string.Format("异常包: [{0}] [{1}] 异常消息:{2}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, System.Reflection.MethodBase.GetCurrentMethod().Name, Exhtml.Message));

        }

```
