# ajax

## 1. official

### 1. wiki url

- [jQuery.ajax() | jQuery API Documentation](http://api.jquery.com/jquery.ajax/)

### 2. search url

- [一个简单的 ajax 获取 json 的例子](https://www.cnblogs.com/liangxiaoli/p/7183607.html)

### 3. Shorthand Methods

- [Shorthand Methods | jQuery API Documentation](https://api.jquery.com/category/ajax/shorthand-methods/)
- [jQuery.post() | jQuery API Documentation](https://api.jquery.com/jQuery.post/)

```c#
jQuery.getJSON()
jQuery.get()
jQuery.getScript()
jQuery.post()
.load()


var json = layui.$.getJSON("http://127.0.0.1:11210/api/WebConfigNew");
json.responseJSON


```

## 2. ajax 经常遇到的问题与解决方案

### 1. Wiki

- [JQ-AJAX 执行成功不执行 success 方法解决 - wang704987562 的博客 - CSDN 博客](https://blog.csdn.net/wang704987562/article/details/82559467)
- [ajax()不执行 success 也不执行 error 的分析和解决 - qq_42118231 的博客 - CSDN 博客](https://blog.csdn.net/qq_42118231/article/details/82851167)
- [jquery ajax 后台响应成功，返回正确 json 但不执行 success 方法，执行 error 的问题](https://www.cnblogs.com/lijinwen/p/6066842.html)
- [ajax 中 dataType="json"，执行后却进入 error 函数中，无法解析 json - zwk199024 的专栏 - CSDN 博客](https://blog.csdn.net/zwk199024/article/details/53032621)

### 2. 解决方案

```shell
# 解决方案：
# 1、服务端设置response.setContentType("application/json;charset=utf-8")；
# 2、或者页面端ajax设置dataType为“json”，指定服务器返回的数据类型。

# jquery 1.4以后对json格式变严格了,也就是说必须要这种格式的{"键":"值","键":"值"};像原来的{键:值，键:值}和{'键':'值','键':'值'}这种都是错误的，不合标准，所以jquery返回error。

# 我的问题是 发送的 POST数据包导致这个报错,不走success 走error 不知道为什么
```

## 3. ajax 常用

### 0. jObject

```c#
jObject = JSON.stringify(json)

// 前端发送字符串Json: 
jObjectText:JSON.stringify({ aa: 123 })

// layui数据表格常用
where: { jObjectText: JSON.stringify({ aa: 123 }) },

// 后端接收字符串Json:
  public ServiceResult Demos(int pageIndex, int pageSize, string jObjectText)

```

### 1. 代码示例 1

```c#
$.ajax({
  type: "get",
  url: "http://localhost:8080/test/ok",
  //期望服务端返回的数据类型
  dataType: "json",
  success: function (data) {
    console.log("success");
  },
  error: function (e) {
    console.log("error");
  },
});

function myFunction() {
  alert("Hello World!");
}

$.ajax({
  url: "test.html",
  context: document.body,
  success: function () {
    $(this).addClass("done");
  },
});

$.ajax({
  type: "POST",
  url: "../../demo",
  dataType: "json",
  data: {
    txtname: txtname,
    txttel: txttel,
    txtOrderDepartment: txtOrderDepartment,
    txtOrderTime: txtOrderTime,
    txtOrderDescription: txtOrderDescription,
  },
  success: function (data) {
    if (data.status == 1) {
      alert(data.msg);
    } else {
      alert(data.msg);
    }
  },
});

$.ajax({
  type: "POST",
  url: ctxRoot + "FolderAction!saveInformSetting.action",
  data: "jsonStr=" + inform_settingListStr,
  dataType: "json",
  complete: function (data) {
    //在这里做些事情，假设返回的json数据里有name这个属性
    //有时候可以直接data.name或者data['name']去访问
    //但有时候，却要通过var jsonData = eval("("+data.responseText+")");才可以通过jsonData.name访问，而且这种情况下，需要是complete而不是success
  },
});

// $.ajax(options)

// 语法如下：

// $.ajax({options});
// url：(string)发送请求的地址，可以是服务器页面也可以是WebService动作。
// type：(string)请求方式，POST或GET
// data：(object)向服务器发送请求时带去的数据。是key:value对形式，如：{name:"grayworm",sex:"male"}，如果是数组{works:["work1","work2"]}
// dataType：(string)预期返回的数据类型。xml,html,json,text等
// beforeSend：（Function）发送ajax请求前被触发，如果返回false则取消本次请求。如果异步请求需要显示gif动画，那应当在这里设置相应<img>的可见。
```

### 2. ajax 文档类型

```c#
context: document.body,
dataType: "json"
dataType : "jsonp",
dataType: "text",
cache: false,//缓存true/false
async:false,//默认是true：异步        false：同步。
```

### 3. ajax POST

````c#
data:  "username="+username+"&password="+password,
data: "JSON=" + JSON.stringify(json),
data:  'username='+username+'&password='+password,
data: 'JSON=' + JSON.stringify(json),



// ajax post 参数变化情况

// 1. 参数与方法变化

function fun_subSiteconfigSet() {
  layer.load();

  layui.$.ajax({
    type: "POST",
    url: "http://" + host + "/api/demo/set",
    dataType: "json",
    data: "Token=" + localStorage.getItem("Token"),
    cache: false,
    async: true,
    success: function(data) {
      layer.closeAll("loading");
      if (data.code == 200) {

        layer.msg(data.message, function() {});
      } else {
        layer.alert(data.message, { icon: 6 });
      }
    }
  });
}

```c#
// 第一种:data 参数字符拼接的时候 Request Method: POST
data: "Token=" + localStorage.getItem("Token")

// 第二种:data 参数字符拼接的时候 Request Method: POST
data: "Token=" + localStorage.getItem("Token")

````

### 4. ajax Data

```c#
var json = {
  path: path,
  id: 0,
};
```

### 5. 用户定义的 callback 函数

```c#
$.ajax({
  async: false,
  url: "",
  type: "post",
  dataType: "jsonp",
  jsonp: "callbackparam",
  jsonpClaaback: "success_jsonpCallback", //用户定义的callback函数，没有定义的话会jQuery会自动生成以jQuery开头的函数
  data: {},
  error: function (XMLHttpReuqest, textStautus, errothrown) {
    console.log(XMLHttpRequest.status);
    console.log(XMLHttpReuqest.readyState);
    console.log(XMLHttpRequest.responseText);
    console.log(textStautus);
    console.log(errothrown);
  },
  success: function (json) {
    alert(json);
  },
});
```

### 6. ajax layui async: true 同步请求

```c#
function RefreshCdnUrlphp(obj) {
  layer.load();
  logincheck();

  layui.$.ajax({
    type: "POST",
    url: "/demoui.php",
    dataType: "Json",
    data: "url=" + obj.data.url,
    cache: false,
    async: true,
    success: function (data) {
      if (data.codeDesc == "Success") {
        layer.alert(
          "提交成功!正常5分钟内生效!请勿频繁提交,修改一次,提交一次即可",
          { icon: 6 }
        );
      } else {
        layer.alert(data.message, { icon: 6 });
      }
      //{"code":0,"message":"","codeDesc":"Success","data":{"count":1,"task_id":"1557144469900757406"}}
    },
    complete: function (data) {
      layer.closeAll("loading");
      console.log("close");
    },
  });
}
```

### 7. async

- [Ajax 请求中 async 属性](https://blog.csdn.net/weixin_40877388/article/details/80483258)
- [jquery ajax 属性 async(同步异步)示例 - 浅苍蓝 - 博客园](https://www.cnblogs.com/ldyblogs/p/ajax.html)

```c#
$.ajax({
 async: false,
  type : "post",
  url : "haha",
  datatype : 'json'，
  success : function(data) {

  }
});
alert("执行");

// 当async属性的值为false时是同步的，Ajax请求将整个浏览器锁死，只有ajax请求返回结果后，才执行ajax后面的alert语句。

// 当async属性的值为true时是异步的，即不会等待ajax请求返回的结果，会直接执行ajax后面的alert语句。
```

### 8. ajax.c2s 对象设计传输

#### 1. JS 对象结构体设计

- 注意:提交必须包含 json 为空的这样格式对象格式

```c#
var apiDemoItem_c2s_Valueitems = {
  json: ""
};
apiDemoItem_c2s_Valueitems.Items = {};
apiDemoItem_c2s_Valueitems.Items = { k: "v" };
```

#### 2. AJAX 发送 data 对象数据

- 只需要发送 apiDemoItem_c2s_Valueitems 结构体里面

```c#
data: {
  Items: Items;
}
```

#### 3. 后台服务端设计

```c#
[Route("api/Demo/go")]
[HttpPost]
public apiDemosRootItemRoot Demo(apiDemoItem_c2s_Valueitems apiDemoItem_c2s_Valueitems)
{
    var root = new apiDemosRootItemRoot();
    try
    {
        root = Util.demo(apiDemoItem_c2s_Valueitems);
    }
    catch (Exception ex)
    {
        root.message = ex.Message;
    }
    return root;
}
```

### 9. ajax-object-send

#### 1.格式:基础格式

- Main.Entity.ApiRequestPackageBase.Root
- json

```c#
// 通讯基类
public class ApiRequestPackageBase
{
    public class Root
    {
        public Root()
        {
            json = "";
        }
        public string json { get; set; }
    }
}
// 继承类
public class apirequestpackageDemoitem : Main.Entity.ApiRequestPackageBase.Root
{
    public string host { get; set; }
    public Main.Entity.Models.demoitem demoitem { get; set; }
    public Module.Main.Entity.workeritem workeritem { get; set; }

}

```

#### 2.格式:AJAX 提交格式

- 注意这里参数对应的是实体类型里的字段参数
- 与传入后台 API 参数名称没有任何关系

```c#
layui.$.ajax({
  dataType: "json",
  data: { host: host, demoitem: demoitem, workeritem: workeritem }
  //   ....
});
```

#### 3. 其它通讯基类说明

```c#

public class api_s2c_DemoItems : Module.DemoTest.Api.Main.Entity.ApiBase.Root
{
    public Module.Regmanagement.Main.Entity.DB.Models.DemoItems DemoItems { get; set; }


}
public class api_c2s_DemoItems : Module.DemoTest.Api.Main.Entity.ApiRequestPackageBase.Root
{
    public Module.Regmanagement.Main.Entity.DB.Models.DemoItems DemoItems { get; set; }

}

```

## 4. 配置跨域 ajax Cross-domain(Cors)

- [ASP.NET MVC &amp; WebApi 中实现 Cors 来让 Ajax 可以跨域访问 （转载） - PowerCoder - 博客园](https://www.cnblogs.com/OpenCoder/p/6890703.html)
- [ajax 跨域，这应该是最全的解决方案了 - 程序生涯 - SegmentFault 思否](https://segmentfault.com/a/1190000012469713)
- [jquery ajax 跨域访问 webservice 配置 - Ace001 - 博客园](https://www.cnblogs.com/xuejianxiyang/p/5369346.html)
- [Calling ASP NET Web API service in a cross domain using jQuery ajax](https://www.youtube.com/watch?v=WKZLVqwpoiE)

### 1. .NET 允许 AJAX 跨域访问

- [.NET 允许 AJAX 跨域访问 - chengmodelong 的专栏 - CSDN 博客](https://blog.csdn.net/chengmodelong/article/details/88955737)
- [jquery ajax 跨域访问 webservice 配置 - Ace001 - 博客园](https://www.cnblogs.com/xuejianxiyang/p/5369346.html)
- [jquery ajax 跨域请求 webservice webconfig 配置 - 狼来了 - 博客园](https://www.cnblogs.com/wolfocme110/p/4434020.html)

### 0. Access-Control-Allow-Origin

- Ajax 跨域问题及解决方案
- [Ajax 跨域问题及解决方案 - 炭烧生蚝 - 博客园](https://www.cnblogs.com/tanshaoshenghao/p/10799042.html)
- [Enabling Cross-Origin Requests in ASP.NET Web API 2](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api)

```c#
Install-Package Microsoft.AspNet.WebApi.Cors
```

```c#
- 其实只要配置webServer
<system.webServer>
    <httpProtocol>
      <customHeaders>
        <add name="Access-Control-Allow-Methods" value="OPTIONS,POST,GET" />
        <add name="Access-Control-Allow-Headers" value="x-requested-with,content-type" />
        <add name="Access-Control-Allow-Origin" value="*" />
      </customHeaders>
    </httpProtocol>

</system.webServer>
```

- 详细配置

```c#
<configuration>
    <system.web>
      <compilation debug="true" targetFramework="4.0" />
      <webServices>
        <protocols>
          <add name="HttpGet"/>
          <add name="HttpPost"/>
        </protocols>
      </webServices>

    </system.web>
  <system.webServer>
    <httpProtocol>
    <customHeaders>
      <add name="Access-Control-Allow-Methods" value="OPTIONS,POST,GET"/>
      <add name="Access-Control-Allow-Headers" value="x-requested-with,content-type"/>
      <add name="Access-Control-Allow-Origin" value="*" />
    </customHeaders>
  </httpProtocol>
  <modules>
    <add name="MyHttpModule" type="WebServiceDemo.MyHttpModule"/>
  </modules>
  </system.webServer>
</configuration>
```

### 2. 如果想选定的网站可能跨域访问，修改配置如下

```c#
<add name="Access-Control-Allow-Origin" value="http://domain1.com, http://domain2.com" />
```

### 3. 在现代浏览器中，为了数据的安全，所有请求被严格限制在同一域名下，如果需要调用不同站点的数据，需要通过跨域来解决

- [AngularJS SQL | 菜鸟教程](https://www.runoob.com/angularjs/angularjs-sql.html)

```c#
// 以下的 PHP 代码运行使用的网站进行跨域访问。
// PHP 和 MySql 代码实例
<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("myServer", "myUser", "myPassword", "Northwind");

$result = $conn->query("SELECT CompanyName, City, Country FROM Customers");

$outp = "";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "") {$outp .= ",";}
    $outp .= '{"Name":"'  . $rs["CompanyName"] . '",';
    $outp .= '"City":"'   . $rs["City"]        . '",';
    $outp .= '"Country":"'. $rs["Country"]     . '"}';
}
$outp ='{"records":['.$outp.']}';
$conn->close();

echo($outp);
?>

// ASP.NET, VB 和 MS Access 代码实例
<%@ Import Namespace="System.IO"%>
<%@ Import Namespace="System.Data"%>
<%@ Import Namespace="System.Data.OleDb"%>
<%
Response.AppendHeader("Access-Control-Allow-Origin", "*")
Response.AppendHeader("Content-type", "application/json")
Dim conn As OleDbConnection
Dim objAdapter As OleDbDataAdapter
Dim objTable As DataTable
Dim objRow As DataRow
Dim objDataSet As New DataSet()
Dim outp
Dim c
conn = New OledbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=Northwind.mdb")
objAdapter = New OledbDataAdapter("SELECT CompanyName, City, Country FROM Customers", conn)
objAdapter.Fill(objDataSet, "myTable")
objTable=objDataSet.Tables("myTable")

outp = ""
c = chr(34)
for each x in objTable.Rows
if outp <> "" then outp = outp & ","
outp = outp & "{" & c & "Name"    & c & ":" & c & x("CompanyName") & c & ","
outp = outp &       c & "City"    & c & ":" & c & x("City")        & c & ","
outp = outp &       c & "Country" & c & ":" & c & x("Country")     & c & "}"
next

outp ="{" & c & "records" & c & ":[" & outp & "]}"
response.write(outp)
conn.close
%>
```
