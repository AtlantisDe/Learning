# Get file name from URI string

- [Get file name from URI string in C#](https://stackoverflow.com/questions/1105593/get-file-name-from-uri-string-in-c-sharp/1105614)

```c#
var filename = this.Request.Url.Segments.Last();

var uri = new Uri(hreflink);
var filename = uri.Segments.Last();
```
