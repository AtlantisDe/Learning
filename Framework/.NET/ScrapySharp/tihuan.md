# tihuan

```c#
 var tag = ale[0];

var htmlDoc = new HtmlDocument();


try { loopitem.guid = tag.Attributes["标识"].Value; } catch (Exception) { throw; }
try { loopitem.loopcount = Convert.ToInt32(tag.Attributes["循环次数"].Value); } catch (Exception) { throw; }

var tmpdoc = new HtmlAgilityPack.HtmlDocument();
tmpdoc.LoadHtml(tag.OuterHtml);

var tmpale = document.DocumentNode.Descendants(tage)
.Where(n => n.Attributes["标识"] != null && n.Attributes["标识"].Value.Contains("[循环灵动列表标签]"))
.ToArray();

var tmptag = tmpale[0];


try { tmptag.Attributes["标识"].Remove(); } catch (Exception) { throw; }
try { tmptag.Attributes["循环次数"].Remove(); } catch (Exception) { throw; }
```
