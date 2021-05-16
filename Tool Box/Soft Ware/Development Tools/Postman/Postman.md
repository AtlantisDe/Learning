# Postman

- [Download Postman App](https://www.getpostman.com/downloads/)

## 0. 插件

- [Chrome Web Store](https://chrome.google.com/webstore/search/postman?utm_source=chrome-ntp-icon)
- [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop/related?hl=en)

```c#

```

## 1. 安装先决条件

- Java

```C#
// 好像win10似乎不用安装环境了,直接安装..,..?反正自己安装下一步就成功了.
```

## 2. 文章

- [Postman 安装与使用 - 虫师 - 博客园](https://www.cnblogs.com/fnng/p/9136434.html)

## 3. Skill

### 1. postman curl to request

- [Simulate a specific CURL in PostMan](https://stackoverflow.com/questions/27957943/simulate-a-specific-curl-in-postman)

```c#
// A simpler approach would be:

// 1. Open POSTMAN
// 3. Click on "import" tab on the upper left side.
// 4. Select the Raw Text option and paste your cURL command.
// 5. Hit import and you will have the command in your Postman builder!
// 6. Click Send to post the command

// Hope this helps!"
```

### 2. Converting a POSTMAN request to Curl

- [Converting a POSTMAN request to Curl](https://stackoverflow.com/questions/49432735/converting-a-postman-request-to-curl)

```c#
点击请求--->Headers---->Code 即可..
```

### 3. Managing environments

- [Managing environments](https://learning.postman.com/docs/sending-requests/managing-environments/)
- [Using variables](https://learning.postman.com/docs/sending-requests/variables/)

```c#
var={{my_variable}}

Defining variables in scripts
You can set variables programmatically in your request scripts.

Use pm.globals to define a global variable:

pm.globals.set("variable_key", "variable_value");
Use pm.collectionVariables to define a collection variable:

pm.collectionVariables.set("variable_key", "variable_value");
Use pm.environment to define an environment variable (in the currently selected environment):

pm.environment.set("variable_key", "variable_value");

```
