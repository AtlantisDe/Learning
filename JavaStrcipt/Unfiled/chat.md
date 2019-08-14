# chat

## demo

### WeChat

```c#
<span oncopy="javascript:window.location.href='weixin://'">

function WeChat(WeChat)
{
    window.location.href ="mqqwpa://im/chat?chat_type=wpa&uin="+WeChat+"&version=1&src_type=web&web_src=oicqzone.com";
}
```

### QQ

```c#
function QQ(QQ)
{
    window.location.href ="mqqwpa://im/chat?chat_type=wpa&uin="+QQ+"&version=1&src_type=web&web_src=oicqzone.com";
}
```
