# Flag

## 1. prevent Chrome headless from loading images

- [how to prevent Chrome headless from loading images](https://stackoverflow.com/questions/48773031/how-to-prevent-chrome-headless-from-loading-images)

```c#
chrome --headless --remote-debugging-port=9222 --blink-settings=imagesEnabled=false
```
