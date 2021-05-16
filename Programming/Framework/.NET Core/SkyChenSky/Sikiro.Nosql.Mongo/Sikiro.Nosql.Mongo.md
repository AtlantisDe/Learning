# Sikiro.Nosql.Mongo

- [Sikiro.Nosql.Mongo 官方开源地址](https://github.com/SkyChenSky/Sikiro.Nosql.Mongo)

## 1. 研究

> 1. 常用

```c#
MongoDB.Driver
var listResult = mongoRepository.PageList<User>(a => a.Id == u.Id, a => a.Desc(b => b.BirthDateTime), 1, 10);


```

## 2. 知识点

> 1. 注意大小写

### 1. 通过过滤条件获取第一个数据 Get the first data by filtering condition

```c#
var getResult = mongoRepository.Get<User>(a => a.Id == u.Id);
getResult.Name = "superskychen";

```
