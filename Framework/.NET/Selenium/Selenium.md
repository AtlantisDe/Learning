# Selenium

- Selenium(浏览器自动化测试框架)
- [Selenium - Web Browser Automation](https://www.seleniumhq.org/)
- [C#使用 Selenium+PhantomJS 抓取数据 - \$zoro - 博客园](https://www.cnblogs.com/zoro-zero/p/9028809.html)
- [C#使用 Selenium+PhantomJS 抓取数据 - 挖宝居士 - 博客园](https://www.cnblogs.com/endlock/p/6423613.html)
- [.NET client driver configuration &mdash; Selenium Documentation](https://www.seleniumhq.org/docs/appendix_installing_dotnet_driver_client.jsp)

## 常用

### 代码一

```c#

var url = "http://www.baidu.com";
IWebDriver driver = new OpenQA.Selenium.Chrome.ChromeDriver(@"D:\Work\Github\Lib\Selenium\ChromeDriver\ChromeDriver 75.0.3770.140");
driver.Navigate().GoToUrl(url);

Console.WriteLine(driver.Title);
Console.WriteLine(driver.Title);

//Console.WriteLine(driver.PageSource);
Console.Read();
```
