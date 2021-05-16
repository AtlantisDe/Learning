# getElementsByText

- [How to get element by innerText](https://stackoverflow.com/questions/3813294/how-to-get-element-by-innertext)

## 常用代码

```c#
function getElementsByText(str, tag = "a") {
  return Array.prototype.slice
    .call(document.getElementsByTagName(tag))
    .filter((el) => el.textContent.trim() === str.trim());
}

function getElementsByText(str, tag = "a") {
  var items = document.getElementsByTagName(tag);
  if (!items) {
    return null;
  }
  return Array.prototype.slice
    .call(items)
    .filter((el) => el.textContent.trim() === str.trim());
}

// Usage

getElementsByText("Text here"); // second parameter is optional tag (default "a")
// if you're looking through different tags i.e. span or button

getElementsByText("Text here", "span");
getElementsByText("Text here", "button");

getElementsByText("Text Demo", "li")[0];

// The default value tag = 'a' will need Babel for old browsers
```

## 拓展代码

```c#
function getElementsByTextSParentobject(Parentobject, str, tag = "a") {
  return Array.prototype.slice
    .call(Parentobject.getElementsByTagName(tag))
    .filter((el) => el.textContent.trim() === str.trim());
}

function getElementsByTextSParentobject(Parentobject, str, tag = "a") {
  if (!Parentobject) {
    return null;
  }
  var items = Parentobject.getElementsByTagName(tag);
  if (!items) {
    return null;
  }
  return Array.prototype.slice
    .call(items)
    .filter((el) => el.textContent.trim() === str.trim());
}

// Usage

getElementsByTextSParentobject(Pobject, "Text here");
getElementsByTextSParentobject(Pobject, "Text here", "span");
getElementsByTextSParentobject(Pobject, "Text here", "button");
getElementsByTextSParentobject(Pobject, "Text Demo", "li")[0];
```
