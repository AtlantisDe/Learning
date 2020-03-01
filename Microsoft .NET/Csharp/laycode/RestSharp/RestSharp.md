# RestSharp

- [Getting Title at 41:39](http://restsharp.org/)

## Basic Usage

```c#
using RestSharp;
using RestSharp.Authenticators;

var client = new RestClient("https://api.twitter.com/1.1");
client.Authenticator = new HttpBasicAuthenticator("username", "password");

var request = new RestRequest("statuses/home_timeline.json", DataFormat.Json);

var response = client.Get(request);
```
