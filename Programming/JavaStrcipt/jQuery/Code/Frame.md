# Frame

## 操作

### 0. QuickStart

```c#
window.frames[3].document.frames.length
window.frames[3].frames[0].dataCache
window.frames[3].frames[1].dataCache
``` 

### 1. 代码一

```c#
<input type="hidden" id="suppId" value="" />

$(window.frames["frmHcInStorage"].document).find("#suppId").val(this.value());

console.log("PPP:" + $(window.frames["frmHcInStorage"].document).find("#suppId").val());
```

### 2. 个数

```c#
$(window.frames["frmHcInStorage"].document)
$(window.frames[0])
window.frames.length
$(window.frames[0].document).find("#google_translate_element")
$(window.frames[0].document).find("#:0.targetLanguage")
$(window.frames[0]).removeAttr("style");
$('/html/body/iframe').removeAttr("style");

```
