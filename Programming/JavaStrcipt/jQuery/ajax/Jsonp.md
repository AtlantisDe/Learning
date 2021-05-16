# WebApiContrib.Formatting.Jsonp

- [Calling ASP NET Web API service in a cross domain using jQuery ajax](https://www.youtube.com/watch?v=WKZLVqwpoiE)
- [WebApiContrib.Formatting.Jsonp 3.0.2](https://www.nuget.org/packages/WebApiContrib.Formatting.Jsonp/3.0.2?_src=template)
- [跨域问题的三种解决方案*网络*薛三岁-CSDN 博客](https://blog.csdn.net/xuebaibaibai/article/details/81052570)

## 常用

- [JSONP demystified: What it is and why it exists - LogRocket Blog](https://blog.logrocket.com/jsonp-demystified-what-it-is-and-why-it-exists/)

```c#
$.getJSON(
  "http://run.plnkr.co/plunks/v8xyYN64V4nqCshgjKms/data-1.json",
  function(json) { console.log(json); }
);
// If you try that out in your browser with an open console, you will see a message similar to the one above. So what can we do?

// A Possible Workaround
var script = $("<script />", {
    src: "http://run.plnkr.co/plunks/v8xyYN64V4nqCshgjKms/data-1.json",
    type: "application/json"
  }
);

$("head").append(script);

// Enter JSONP
// jsonCallback 
function jsonCallback(json){
  console.log(json);
}

$.ajax({
  url: "http://run.plnkr.co/plunks/v8xyYN64V4nqCshgjKms/data-2.json",
  dataType: "jsonp"
});

// 3rd Party APIs
function logResults(json){
  console.log(json);
}

$.ajax({
  url: "https://api.github.com/users/jeresig",
  dataType: "jsonp",
  jsonpCallback: "logResults"
});

// This can also be written as:
$.getJSON("https://api.github.com/users/jeresig?callback=?",function(json){
  console.log(json);
});
```
