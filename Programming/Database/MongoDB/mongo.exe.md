# mongo.exe

- 终端

## 常用

```c#
mongo.exe
show dbs // 显示所有的数据库
use admin // 切换到admin
db.createUser({user:'root',pwd:'root',roles:['userAdminAnyDatabase']})
db.auth('root','root')
// 取一条数据不加sort速度快
db.users.find({"Category":"互联网","Imgs":null}).limit(1)

// 获取随机的 N 条记录 随机读取
db.users.aggregate( [ { $sample: { size: N } } ] )


db.mycoll.aggregate([
    { $match: { a: 10 } },
    { $sample: { size: 1 } }
])

db.orders.aggregate([
   { $match: { status: "A" } },
   { $group: { _id: "$cust_id", total: { $sum: "$amount" } } }
])
```
