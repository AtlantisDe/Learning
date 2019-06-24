# css

```c#
var link = htmlDocument.DocumentNode.SelectNodes("/html/head/link");

var link = htmlDocument.DocumentNode.SelectNodes("/html/head/link").Where(n => n.Attributes["href"] != null && n.Attributes["href"].Value.Contains(".css")).ToList();

```
