# ajax-object-send

## 流程事项

### 1.格式:基础格式

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

### 2.格式:AJAX 提交格式

- 注意这里参数对应的是实体类型里的字段参数
- 与传入后台 API 参数名称没有任何关系

```js
layui.$.ajax({
  dataType: "json",
  data: { host: host, demoitem: demoitem, workeritem: workeritem }
  //   ....
});
```

## 其它通讯基类说明

```c#

public class api_s2c_Regkeyitem : Module.Aleseo.Api.Main.Entity.ApiBase.Root
{
    public Module.Regmanagement.Main.Entity.DB.Models.regkeyitem regkeyitem { get; set; }


}
public class api_c2s_Regkeyitem : Module.Aleseo.Api.Main.Entity.ApiRequestPackageBase.Root
{
    public Module.Regmanagement.Main.Entity.DB.Models.regkeyitem regkeyitem { get; set; }

}

```
