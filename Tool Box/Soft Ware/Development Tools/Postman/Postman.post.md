# POST

## 常用

### 1. 注意事项

```c#
1）form-data 就是http请求中的multipart/form-data,它会将表单的数据处理为一条消息，以标签为单元，用分隔符分开。既可以上传键值对，也可以上传文件。
2）x-www-form-urlencoded 就是application/x-www-from-urlencoded,会将表单内的数据转换为键值对，比如,name=java&age = 23
3）raw 可以上传任意格式的文本，可以上传text、json、xml、html等
4）binary 相当于Content-Type:application/octet-stream,从字面意思得知，只可以上传二进制数据，通常用来上传文件，由于没有键值，所以，一次只能上传一个文件。
```

### 2. Request Payload

- [Postman 模拟 Request Payload 发送请求](https://blog.csdn.net/ShiMengRan107/article/details/86514441)
- [Postman 模拟 Request Payload 发送请求](https://blog.csdn.net/zuoyixiao/article/details/78719599)
