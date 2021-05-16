# 百度提供站内搜索

- [Getting Title at 47:55](https://zn.baidu.com/)
- [百度站长社区\_百度站长平台 - Powered by Discuz!](http://bbs.zhanzhang.baidu.com/forum.php)

## 代码细节

### 1. POST 信息

```c#
/*加入这个标识头部:默认请求JSON*/
request.Headers.TryAddWithoutValidation("x-request-by", "baidu.ajax");

request.Headers.TryAddWithoutValidation("User-Agent", "curl/7.12.1");

```

### 2. 查询域名推送

```c#
:start
@echo off
color 0A
title 查询域名是否支持推送
@echo 【查询域名是否支持推送】
@echo 请输入网址：
set /P url=""
@echo 请输入token：
set /P token=""
@echo.
@echo 查询%url%是否支持普通推送,Token为：%token%
curl -H 'Content-Type:text/plain' --data-binary "https://%url%/index.html" "http://data.zz.baidu.com/urls?site=https://%url%&token=%token%"
@echo.
@echo 查询%url%是否支持MIP推送,Token为：%token%
curl -H 'Content-Type:text/plain' --data-binary "https://%url%/index.html" "http://data.zz.baidu.com/urls?site=https://%url%&token=%token%&type=mip"
@echo.
@echo https://%url%----%token%>>D:token.txt
if  %errorlevel%==0 (
   echo  保存成功!
)  else  (
   echo  保存失败!
)
@echo.
pause
goto start

```

### 3. Curl 推送

```c#

```
