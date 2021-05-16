# DOM

## 常用

### 1. Printing the DOM

```c#
chrome --headless --disable-gpu --dump-dom https://www.chromestatus.com/
chrome --headless --disable-gpu --dump-dom https://www.Baidu.com/

chrome --headless --disable-gpu --dump-dom https://www.Baidu.com/
```

### 2.remote-debugging-port

```c#
chrome --headless --disable-gpu --remote-debugging-port=9222 https://www.Baidu.com/
```

### 3. Note Debug

```c#
D:\Tmp\GoogleCache

–disk-cache-dir=”D:\Tmp\GoogleCache“

chrome  --disable-gpu --dump-dom https://www.chromestatus.com/

chrome  --disable-gpu --print-to-pdf https://www.chromestatus.com/


chrome --headless --remote-debugging-port=9222 --blink-settings=imagesEnabled=false
chrome  --remote-debugging-port=9222 --blink-settings=imagesEnabled=false

chrome  --disable-gpu --blink-settings=imagesEnabled=false https://www.baidu.com

chrome  --disable-gpu --lang=zh-CN --blink-settings=imagesEnabled=false,--disable-plugins=false https://www.baidu.com

chrome --remote-debugging-port=9222 https://www.baidu.com
chrome --headless --remote-debugging-port=9222 https://www.baidu.com
http://localhost:9222

```
