# XMLcode

```xml
<!-- 写法一 -->
<add name="Clr4IntegratedAppPool" managedRuntimeVersion="v4.0" managedPipelineMode="Integrated" CLRConfigFile="%IIS_USER_HOME%\config\aspnet.config" autoStart="true">
    <processModel identityType="LocalSystem" />
</add>
<!-- 写法二 -->
<add name="Clr4IntegratedAppPool" managedRuntimeVersion="v4.0" managedPipelineMode="Integrated" CLRConfigFile="%IIS_USER_HOME%\config\aspnet.config" autoStart="true"/>
<!-- 注意写法注意闭合标签/和没有/ 最后需要一个</add>标签 -->
```
