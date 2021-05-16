# SwitchyOmega

- [FelisCatus/SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)
- [Error Happened](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif)
- [FelisCatus/SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega/releases)

## 常用

- SwitchyOmega_Chromium.crx

- [离线下载 FelisCatus/SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega/releases)

```c#
- chrome://extensions/
- [Proxy SwitchyOmega 收藏猫](https://pictureknow.com/extension?id=c751ccedaa7e41a1b885b0a63b2a9e17)

```

## 通配符配置

```c#
*.google.com
*.github.com
*.googleusercontent.com
```

## 常用情景模式

```c#
情景模式： GitHub Proxy
情景模式： auto switch
```

```c#
[SwitchyOmega Conditions]
@with result

*.google.com +GitHub Proxy
*.github.com +GitHub Proxy
*.googleusercontent.com +GitHub Proxy
*.githubassets.com +GitHub Proxy
*.githubusercontent.com +GitHub Proxy
*.fastly.net +GitHub Proxy

* +direct

```
