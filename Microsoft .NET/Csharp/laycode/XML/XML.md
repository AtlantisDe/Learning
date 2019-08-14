# XML

- System.Xml.ReaderWriter
- Nuget--
- [C#操作 XML 方法集合](https://www.cnblogs.com/zery/p/3362480.html)
- [C#读取和写入 XML 文件](https://www.cnblogs.com/fengxuehuanlin/p/5631664.html)
- [Select XML Nodes by Name [C#]](http://www.csharp-examples.net/xml-nodes-by-name/)

## XML 工具

- [XML 编辑器 阅读器 - 在线工具](http://xmlgrid.net/cn/)
- [XML 压缩、格式化-BeJSON.com](http://www.bejson.com/otherformat/xml/)

## 关系

```C#
* 1 XMLElement 主要是针对节点的一些属性进行操作
* 2 XMLDocument 主要是针对节点的CUID操作
* 3 XMLNode 为抽象类，做为以上两类的基类，提供一些操作节点的方法

using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;
```

## 代码示例

### Select XML Nodes by Name

```xml
<Names>
    <Name>
        <FirstName>John</FirstName>
        <LastName>Smith</LastName>
    </Name>
    <Name>
        <FirstName>James</FirstName>
        <LastName>White</LastName>
    </Name>
</Names>
```

```C#
XmlDocument xml = new XmlDocument();
xml.LoadXml(myXmlString); // suppose that myXmlString contains "<Names>...</Names>"

XmlNodeList xnList = xml.SelectNodes("/Names/Name");
foreach (XmlNode xn in xnList)
{
  string firstName = xn["FirstName"].InnerText;
  string lastName = xn["LastName"].InnerText;
  Console.WriteLine("Name: {0} {1}", firstName, lastName);
}
```

### not sure how to use XmlNode in

- [not sure how to use XmlNode in C#](https://stackoverflow.com/questions/18058872/not-sure-how-to-use-xmlnode-in-c-sharp)

```xml
<?xml version="1.0" encoding="utf-8"?>
<ServerConfig type="ProjectName" version ="1.1.1.2" createDate ="2013-07-30T15:07:19.3859287+02:00" >
<items>
    <item  name="fs" type="directory" source="C:\temp\source" destination="C:\temp\target" action="Create" />
    <item  name="testdoc.txt" type="file" source="C:\temp\source" destination="C:\temp\target" action="Update" />
</items>
</ServerConfig>
```

```c#
XmlTextReader reader = new XmlTextReader(fileManager.ConfigFile);
XmlDocument doc = new XmlDocument();
XmlNode node = doc.ReadNode(reader);

// failed to get values here
var Version = node.Attributes["version"].Value;
var Type = node.Attributes["type"].Value;
var Date = node.Attributes["createDate"].Value;

        //how to get values from items/item attributes here?
```

- You can use LINQ to XML (which is preferable in latest .Net versions)

```C#
var xdoc = XDocument.Load(fileManager.ConfigFile);
var serverConfig = xdoc.Root;
string version = (string)serverConfig.Attribute("version");
DateTime date = (DateTime)serverConfig.Attribute("createDate");
string type = (string)serverConfig.Attribute("type");

var items = from item in serverConfig.Element("items").Elements()
            select new {
                Name = (string)item.Attribute("name"),
                Type = (string)item.Attribute("type"),
                Source = (string)item.Attribute("source"),
                Destination = (string)item.Attribute("destination")
            };
```

### C#操作 XML 文档(XmlDocument、XmlNode、XmlAttribute、SelectSingleNode、SelectNodes、XmlNodeList)

- [C#操作 Xml 文件(读 Xml 文档中的节点内容)。 - 谢尊旭 - 博客园](https://www.cnblogs.com/xiezunxu/articles/7591189.html)

#### 保存

- [C# XMl 读写配置文件](https://zhidao.baidu.com/question/872644689765139052.html)

#### 操作示例一 注意 foreach 下不能删除节点...错误用法

```C#
        public bool del(string fileExtension)
        {
            try
            {


                XmlNodeList childNodes = root.xmlDoc.SelectNodes("configuration/system.webServer/staticContent");

                foreach (XmlNode childNode in childNodes[0])
                {
                    XmlElement childElement = (XmlElement)childNode;

                    if (childElement.GetAttribute("fileExtension") == fileExtension)
                    {
                        //删除name属性
                        //childElement.RemoveAttribute("name");
                        //删除该节点的全部内容
                        //childElement.RemoveAll();

                        //删除节点
                        childNodes[0].RemoveChild(childElement);


                    }
                }

            }
            catch (Exception ex)
            {
                var exErr = string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message);
                Console.WriteLine(exErr);
            }
            finally
            {
            }



            return true;

        }
```

#### 操作示例一 注意 foreach 下不能删除节点...正确用法 for

```c#
public bool del(string fileExtension)
        {
            try
            {


                XmlNodeList childNodes = root.xmlDoc.SelectNodes("configuration/system.webServer/staticContent");


                var listXN = new List<XmlNode>();

                foreach (XmlNode childNode in childNodes[0])
                {
                    XmlElement childElement = (XmlElement)childNode;

                    if (childElement.GetAttribute("fileExtension") == fileExtension)
                    {
                        //删除name属性
                        //childElement.RemoveAttribute("name");
                        //删除该节点的全部内容
                        //childElement.RemoveAll();

                        //删除节点
                        //childNodes[0].RemoveChild(childElement);
                        listXN.Add(childElement);
                    }
                }

                for (int i = 0; i < listXN.Count; i++)
                {
                    childNodes[0].RemoveChild(listXN[i]);
                }

            }
            catch (Exception ex)
            {
                var exErr = string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message);
                Console.WriteLine(exErr);
            }
            finally
            {
            }



            return true;

        }
```

```c#
其中：

“user”是xml文件的根节点；

两个"person"节点是"user"节点的子节点；

"person"节点有三个属性："name", "sex", "age"；

"pass"和"address"是"person"节点的两个子节点
```

#### (1) 增加声明段落

```c#
XmlDocument xmldoc = new XmlDocument();
//加入XML的声明段落,<?xmlversion="1.0" encoding="gb2312"?>
XmlDeclaration xmldecl;
xmldecl = xmldoc.CreateXmlDeclaration("1.0","gb2312", null);
xmldoc.AppendChild(xmldecl);
```

#### (2) 加入根元素

```c#
        private void CreateRootElement()
        {
            xmlDoc = new XmlDocument();
            XmlElement xmlelem = xmlDoc.CreateElement("user");
            xmlDoc.AppendChild(xmlelem);

            //保存创建好的XML文档
            xmlDoc.Save("User.xml");
        }
```

#### (3) 装载 XML 文件

```c#
        //load xml file
        private void LoadXml()
        {
            if (isFileExisted == false)
            {
                xmlDoc = new XmlDocument();
                CreateRootElement();
                isFileExisted = true;
                return;
            }
            xmlDoc=new XmlDocument();
            xmlDoc.Load("User.xml");
        }
```

#### (4) 增加新元素

```c#
         //添加节点
        public void AddElement(string name, string sex, string age, string pass, string address)
        {
            //装载Xml文件
            LoadXml();
            //获取根节点
            XmlNode xmldocSelect = xmlDoc.SelectSingleNode("user");

            //创建元素Person
            XmlElement personElement = xmlDoc.CreateElement("person");

            //person节点的三个属性
            personElement.SetAttribute("name", name);
            personElement.SetAttribute("sex", sex);
            personElement.SetAttribute("age", age);

            //创建一个新的元素
            XmlElement passElement=xmlDoc.CreateElement("pass");
            //设置节点的串联值
            passElement.InnerText = pass;
            //将新创建的节点pass添加为person节点的子节点
            personElement.AppendChild(passElement);

            XmlElement addrElement=xmlDoc.CreateElement("Address");
            addrElement.InnerText = address;
            personElement.AppendChild(addrElement);

            //添加person节点
            xmldocSelect.AppendChild(personElement);
            xmlDoc.Save("user.xml");
        }
```

#### (0) 输出 xml 文档内容：（用了两种遍历方式：XmlNode，XmlElement）

```c#
        //输出xml文档
        public void showXml()
        {
            LoadXml();
            //获取根节点
            XmlElement rootElement = xmlDoc.DocumentElement;

            //挨个查找其下的子节点
            foreach (XmlElement childElement in rootElement)
            {
                //分别输出子节点属性
                Console.WriteLine(childElement.GetAttribute("name"));
                Console.WriteLine(childElement.GetAttribute("sex"));
                Console.WriteLine(childElement.GetAttribute("age"));

                //获取孙节点列表
                XmlNodeList grandsonNodes = childElement.ChildNodes;
                foreach (XmlNode grandsonNode in grandsonNodes)
                {
                    //显示孙节点文本
                    Console.WriteLine(grandsonNode.InnerText);
                }
            }
        }
```

#### (6) 查找并修改节点

```c#
         //修改节点
        public void UpdateElement(string name)
        {
            LoadXml();
            //获取根节点的所有子节点
            XmlNodeList nodeList=xmlDoc.SelectSingleNode("user").ChildNodes;

            foreach(XmlNode childNode in nodeList)
            {
                XmlElement childElement = (XmlElement)childNode;

                //如果找到姓名为name的节点
                if (childElement.GetAttribute("name") == name)
                {
                    childElement.SetAttribute("name","BYH");

                    //如果下面有子节点在下走
                    XmlNodeList grandsonNodes = childElement.ChildNodes;
                    //继续获取xe子节点的所有子节点
                    foreach (XmlNode grandsonNode in grandsonNodes)
                    {
                        XmlElement grandsonElement = (XmlElement)grandsonNode;
                        //如果找到节点名为pass的孙子节点
                        if (grandsonElement.Name == "pass")
                        {
                            grandsonElement.InnerText = "66666";
                            break;
                        }
                    }
                    break;
                }
            }
            xmlDoc.Save("user.xml");
        }
```

#### (7) 查找并删除节点

```c#
        public void deleteNode(string name)
        {
            LoadXml();
            //获取根节点的所有子节点
            XmlNodeList childNodes=xmlDoc.SelectSingleNode("user").ChildNodes;

            foreach (XmlNode childNode in childNodes)
            {
                XmlElement childElement = (XmlElement)childNode;
                if (childElement.GetAttribute("name") == name)
                {
                    //删除name属性
                    childElement.RemoveAttribute("name");
                    //删除该节点的全部内容
                    childElement.RemoveAll();

                    break;
                }
            }

            xmlDoc.Save("user.xml");
        }
```
