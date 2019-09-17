# Frame

## 操作

### 代码一

```c#
<input type="hidden" id="suppId" value="" />

$(window.frames["frmHcInStorage"].document).find("#suppId").val(this.value());

console.log("PPP:" + $(window.frames["frmHcInStorage"].document).find("#suppId").val());
```

### 个数

```c#
$(window.frames["frmHcInStorage"].document)
$(window.frames[0])
window.frames.length
$(window.frames[0].document).find("#google_translate_element")
$(window.frames[0].document).find("#:0.targetLanguage")
$(window.frames[0]).removeAttr("style");
$('/html/body/iframe').removeAttr("style");

```
