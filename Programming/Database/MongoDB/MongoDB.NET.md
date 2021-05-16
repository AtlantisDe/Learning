# MongoDB C#/.NET

- [MongoDB C#/.NET Driver](https://docs.mongodb.com/drivers/csharp)
- [Error Happened](https://mongodb.github.io/mongo-csharp-driver/2.10/apidocs/html/R_Project_CSharpDriverDocs.htm)

## 1. 常用

```c#
db.getCollection("ArticleContents").find()
```

## 2. 忽略类|字段方法

```c#
/// <summary>测试忽略属性</summary>
[MongoDB.Bson.Serialization.Attributes.BsonIgnore]
public string Nodesstring { get; set; }

/// <summary>测试忽略类</summary>
[MongoDB.Bson.Serialization.Attributes.BsonIgnoreExtraElements]
public class UserModel
{
    public ObjectId id { get; set; }
    public string Email { get; set; }
}


```
