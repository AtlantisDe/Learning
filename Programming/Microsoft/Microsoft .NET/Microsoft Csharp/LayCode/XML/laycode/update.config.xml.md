# 经典修改更新案例

## Demo 代码

```c#
var path = @"D:\Tmp\Web.config";
var xmlDoc = new System.Xml.XmlDocument();

xmlDoc.Load(path);
var childNodes = xmlDoc.SelectNodes("configuration/appSettings");
var childNode = xmlDoc.SelectSingleNode("/configuration/appSettings/add[@key='loginToken']");

var childElement = (System.Xml.XmlElement)childNode;
childElement.SetAttribute("value", "BYH99");

xmlDoc.Save(path);
```
