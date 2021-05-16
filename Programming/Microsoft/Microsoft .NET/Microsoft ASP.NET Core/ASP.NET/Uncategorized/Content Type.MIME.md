# Get MIME type from filename extension

- [Get a File Content-Type / MIME-type from file extension in ASP.NET C#](https://www.ryadel.com/en/get-file-content-mime-type-from-extension-asp-net-mvc-core/)
- [Get MIME type from filename extension](https://stackoverflow.com/questions/1029740/get-mime-type-from-filename-extension)

```c#
System.Web.MimeMapping.GetMimeMappin

string mimeType = MimeMapping.GetMimeMapping(fileName);
MimeMapping._mappingDictionary.AddMapping(string fileExtension, string mimeType)
```
