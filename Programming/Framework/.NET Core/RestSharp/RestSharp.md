# RestSharp

- [RestSharp - Simple REST and HTTP Client for .NET](http://restsharp.org/)
- [restsharp/RestSharp](https://github.com/restsharp/RestSharp)

## 1. 安装

- [RestSharp 106.11.5](https://www.nuget.org/packages/RestSharp/)

```c#
dotnet add package RestSharp
Install-Package RestSharp -Version 106.11.5
```

## 2. 常用

- [restsharp/RestSharp](https://github.com/restsharp/RestSharp/tree/dev/test)
- [RestSharp.Tests](https://github.com/restsharp/RestSharp/tree/dev/test/RestSharp.Tests)
- [Authenticators](https://restsharp.dev/usage/authenticators.html#using-simpleauthenticator)

```c#

```

## 3. Basic Usage

- [Getting Started | RestSharp](https://restsharp.dev/getting-started/getting-started.html)

```c#
using RestSharp;
using RestSharp.Authenticators;

var client = new RestClient("https://api.twitter.com/1.1");
client.Authenticator = new HttpBasicAuthenticator("username", "password");

var request = new RestRequest("statuses/home_timeline.json", DataFormat.Json);

var response = client.Get(request);
```

## 4. 发送实体对象示例

```c#
var client = new RestSharp.RestClient();
var request = new RestSharp.RestRequest("http://localhost:11301/api/DoubleSecurityLogSave").AddJsonBody(doubleSecurityLog);
var response = client.PostAsync<ServiceResult>(request).Result;

```
