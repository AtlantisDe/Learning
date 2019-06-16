# Html Agility Pack

- [Html Agility pack | Html Agility Pack](https://html-agility-pack.net/)
- [zzzprojects/html-agility-pack](https://github.com/zzzprojects/html-agility-pack)

## HTML Parser

### Load and parse HTML

- [Parser | Html Agility Pack](https://html-agility-pack.net/parser)
- From File
- From String
- From Web
- From Browser

- [From Browser | Html Agility Pack](https://html-agility-pack.net/from-browser)

```c#
// From File
var doc = new HtmlDocument();
doc.Load(filePath);

// From String
var doc = new HtmlDocument();
doc.LoadHtml(html);

// From Web
var url = "http://html-agility-pack.net/";
var web = new HtmlWeb();
var doc = web.Load(url);
```
