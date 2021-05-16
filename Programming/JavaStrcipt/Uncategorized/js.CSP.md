# "网页安全政策"（Content Security Policy，缩写 CSP）

- [&#39; xxxxxxxxxxxxx&quot; 浏览器安全问题 - Hwangzhiyoung - 博客园](https://www.cnblogs.com/Hwangzhiyoung/p/9146740.html)
- [内容安全策略( CSP )](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/CSP)

## 常用

```c#
// 威胁 :跨站脚本攻击 数据包嗅探攻击
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; img-src https://*; child-src 'none';">
```
