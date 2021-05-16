# JavaScript Snippet Pack

- [JavaScript&#32;Snippet&#32;Pack&#32;&#32;-&#32;Visual&#32;Studio&#32;Marketplace](https://marketplace.visualstudio.com/items?itemName=akamud.vscode-javascript-snippet-pack)

## 常用

```c#
Console
[cd] console.dir
console.dir(${1});
[ce] console.error
console.error(${1});
[ci] console.info
console.info(${1});
[cl] console.log
console.log(${1});
[cw] console.warn
console.warn(${1});
[de] debugger
debugger;
DOM
[ae] addEventListener
${1:document}.addEventListener('${2:load}', function(e) {
 ${3:// body}
});
[ac] appendChild
${1:document}.appendChild(${2:elem});
[rc] removeChild
${1:document}.removeChild(${2:elem});
[cel] createElement
${1:document}.createElement(${2:elem});
[cdf] createDocumentFragment
${1:document}.createDocumentFragment();
[ca] classList.add
${1:document}.classList.add('${2:class}');
[ct] classList.toggle
${1:document}.classList.toggle('${2:class}');
[cr] classList.remove
${1:document}.classList.remove('${2:class}');
[gi] getElementById
${1:document}.getElementById('${2:id}');
[gc] getElementsByClassName
${1:document}.getElementsByClassName('${2:class}');
[gt] getElementsByTagName
${1:document}.getElementsByTagName('${2:tag}');
[ga] getAttribute
${1:document}.getAttribute('${2:attr}');
[sa] setAttribute
${1:document}.setAttribute('${2:attr}', ${3:value});
[ra] removeAttribute
${1:document}.removeAttribute('${2:attr}');
[ih] innerHTML
${1:document}.innerHTML = '${2:elem}';
[tc] textContent
${1:document}.textContent = '${2:content}';
[qs] querySelector
${1:document}.querySelector('${2:selector}');
[qsa] querySelectorAll
${1:document}.querySelectorAll('${2:selector}');
Loop
[fe] forEach
${1:array}.forEach(function(item) {
 ${2:// body}
});
Function
[fn] function
function ${1:methodName} (${2:arguments}) {
 ${3:// body}
}
[afn] anonymous function
function(${1:arguments}) {
 ${2:// body}
}
[pr] prototype
${1:object}.prototype.${2:method} = function(${3:arguments}) {
 ${4:// body}
}
[iife] immediately-invoked function expression
(function(${1:window}, ${2:document}) {
 ${3:// body}
})(${1:window}, ${2:document});
[call] function call
${1:method}.call(${2:context}, ${3:arguments})
[apply] function apply
${1:method}.apply(${2:context}, [${3:arguments}])
[ofn] function as a property of an object
${1:functionName}: function(${2:arguments}) {
 ${3:// body}
}
JSON
[jp] JSON.parse
JSON.parse(${1:obj});
[js] JSON.stringify
JSON.stringify(${1:obj});
Timer
[si] setInterval
setInterval(function() {
 ${0:// body}
}, ${1:1000});
[st] setTimeout
setTimeout(function() {
 ${0:// body}
}, ${1:1000});
Misc
[us] use strict
'use strict';
[al] alert
alert('${1:msg}');
[co] confirm
confirm('${1:msg}');
[pm] prompt
prompt('${1:msg}');
```
