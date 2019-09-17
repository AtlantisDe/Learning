# Demo

```xml
  <system.webServer>
    <modules runAllManagedModulesForAllRequests="true" />
    <httpErrors errorMode="Custom" existingResponse="Replace">
      <error path="/Error/Forbidden" statusCode="403" subStatusCode="14" responseMode="ExecuteURL"/>
      <error path="/Error/NotFound" statusCode="404" subStatusCode="7" responseMode="ExecuteURL"/>
      <error path="/Error/NotFound" statusCode="404" subStatusCode="8" responseMode="ExecuteURL"/>
    </httpErrors>
  </system.webServer>




<?xml version="1.0" encoding="utf-8"?>

<!--
  有关如何配置 ASP.NET 应用程序的详细信息，请访问
  https://go.microsoft.com/fwlink/?LinkId=169433
-->

<configuration>
  <system.web>
    <compilation debug="true" targetFramework="4.0" />

  </system.web>
    <system.webServer>
        <httpErrors>
            <remove statusCode="502" subStatusCode="-1" />
            <remove statusCode="501" subStatusCode="-1" />
            <remove statusCode="500" subStatusCode="-1" />
            <remove statusCode="412" subStatusCode="-1" />
            <remove statusCode="406" subStatusCode="-1" />
            <remove statusCode="405" subStatusCode="-1" />
            <remove statusCode="404" subStatusCode="-1" />
            <remove statusCode="401" subStatusCode="-1" />
            <remove statusCode="403" subStatusCode="-1" />
            <error statusCode="403" prefixLanguageFilePath="" path="/404.html" responseMode="ExecuteURL" />
            <error statusCode="401" prefixLanguageFilePath="" path="/401.html" responseMode="ExecuteURL" />
            <error statusCode="404" prefixLanguageFilePath="" path="/404.html" responseMode="ExecuteURL" />
            <error statusCode="405" prefixLanguageFilePath="" path="/404.html" responseMode="ExecuteURL" />
            <error statusCode="406" prefixLanguageFilePath="" path="/404.html" responseMode="ExecuteURL" />
            <error statusCode="412" prefixLanguageFilePath="" path="/404.html" responseMode="ExecuteURL" />
            <error statusCode="500" prefixLanguageFilePath="" path="/404.html" responseMode="ExecuteURL" />
            <error statusCode="501" prefixLanguageFilePath="" path="/404.html" responseMode="ExecuteURL" />
            <error statusCode="502" prefixLanguageFilePath="" path="/404.html" responseMode="ExecuteURL" />
        </httpErrors>
    </system.webServer>

  
</configuration>

```
