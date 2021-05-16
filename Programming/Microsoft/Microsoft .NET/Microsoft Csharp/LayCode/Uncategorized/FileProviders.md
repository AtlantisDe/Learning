# FileProviders

- [ASP.NET Core File Providers](https://www.cnblogs.com/Wddpct/p/6128386.html)

## IFileInfo

## 代码

- [File Providers in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/file-providers?view=aspnetcore-2.2)

```c#
# Demo
var provider = new PhysicalFileProvider(applicationRoot);
var contents = provider.GetDirectoryContents(string.Empty);
var fileInfo = provider.GetFileInfo("wwwroot/js/site.js");

# Demo
try
{
var provider = new PhysicalFileProvider(@"d:/Work/Doc/tmp/");
var contents = provider.GetDirectoryContents(string.Empty);
var fileInfo = provider.GetFileInfo("1.txt");
}
catch (Exception ex)
{
}
```

## 读文件内容

```C#
try
{

    var provider = new PhysicalFileProvider(@"d:/Work/Doc/tmp/");
    var contents = provider.GetDirectoryContents(string.Empty);
    var fileInfo = provider.GetFileInfo("1.txt");

    var stream = fileInfo.CreateReadStream();
    var reader = new StreamReader(stream);

    string content = reader.ReadLine();
    StringBuilder stringBuilder = new StringBuilder();
    while (content != null)
    {
        stringBuilder.Append(content + "\r\n");
        content = reader.ReadLine();
    }
    stream.Close();
    reader.Close();
}
catch (Exception ex)
{
}

```

## C#文本读写

```c#
 var aa= System.IO.File.ReadAllText("d:/Work/Doc/tmp/2.txt", Encoding.UTF8);

System.IO.File.WriteAllText("e:\\asp_1.txt", "I LOVE YOU!");
System.IO.File.WriteAllText("d:/Work/Doc/tmp/2.txt", "I LOVE YOU!");
System.IO.File.WriteAllText("d:/Work/Doc/tmp/2.txt", "I LOVE YOU!", Encoding.UTF8);
```

## 代码 1

```C#
        //读取目录下所有文件内容
        private void ResolveFileInfo(StringBuilder output, string path, string suffix)
        {
            output.AppendLine("UserID    Golds    RecordDate");

            IDirectoryContents dir = _fileProvider.GetDirectoryContents(path);
            foreach (IFileInfo item in dir)
            {
                if (item.IsDirectory)
                {
                    ResolveFileInfo(output,
                        item.PhysicalPath.Substring(Directory.GetCurrentDirectory().Length),
                        suffix);
                }
                else
                {
                    if (item.Name.Contains(suffix))
                    {
                        var userList = new List<UserGolds>();
                        var user = new UserGolds();

                        IFileInfo file = _fileProvider.GetFileInfo(path + "\\" + item.Name);

                        using (var stream = file.CreateReadStream())
                        {
                            using (var reader = new StreamReader(stream))
                            {
                                string content = reader.ReadLine();

                                while (content != null)
                                {
                                    if (content.Contains("begin"))
                                    {
                                        user = new UserGolds();
                                    }
                                    if (content.Contains("写入时间"))
                                    {
                                        DateTime recordDate;
                                        string strRecordDate = content.Substring(content.IndexOf(":") + 1).Trim();
                                        if (DateTime.TryParse(strRecordDate, out recordDate))
                                        {
                                            user.RecordDate = recordDate;
                                        }
                                    }

                                    if (content.Contains("userid"))
                                    {
                                        int userID;
                                        string strUserID = content.Substring(content.LastIndexOf("=") + 1).Trim();
                                        if (int.TryParse(strUserID, out userID))
                                        {
                                            user.UserID = userID;
                                        }
                                    }

                                    if (content.Contains("golds"))
                                    {
                                        int golds;
                                        string strGolds = content.Substring(content.LastIndexOf("=") + 1).Trim();
                                        if (int.TryParse(strGolds, out golds))
                                        {
                                            user.Golds = golds;
                                        }
                                    }

                                    if (content.Contains("end"))
                                    {
                                        var userMax = userList.FirstOrDefault(u => u.UserID == user.UserID);
                                        if (userMax == null || userMax.UserID <= 0)
                                        {
                                            userList.Add(user);
                                        }
                                        else if (userMax.RecordDate < user.RecordDate)
                                        {
                                            userList.Remove(userMax);
                                            userList.Add(user);
                                        }
                                    }

                                    content = reader.ReadLine();
                                }
                            }
                        }

                        if (userList != null && userList.Count > 0)
                        {
                            foreach (var golds in userList.OrderBy(u => u.RecordDate))
                            {
                                output.AppendLine(golds.UserID.ToString() + "    " + golds.Golds + "    " + golds.RecordDate);
                            }

                            output.AppendLine("");
                        }
                    }
                }
            }
        }

        //读取目录下所有文件名
        private void ResolveDirectory(StringBuilder output, string path, string prefix)
        {
            IDirectoryContents dir = _fileProvider.GetDirectoryContents(path);
            foreach (IFileInfo item in dir)
            {
                if (item.IsDirectory)
                {
                    output.AppendLine(prefix + "[" + item.Name + "]");

                    ResolveDirectory(output,
                        item.PhysicalPath.Substring(Directory.GetCurrentDirectory().Length),
                        prefix + "    ");
                }
                else
                {
                    output.AppendLine(path + prefix + item.Name);
                }
            }
        }
```
