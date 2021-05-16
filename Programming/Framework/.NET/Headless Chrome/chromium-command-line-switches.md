# chromium-command-line-switches

- [List of Chromium Command Line Switches &laquo; Peter Beverloo](https://peter.sh/experiments/chromium-command-line-switches/)
- [Python 爬虫杂记 - Chrome Headless](https://www.jianshu.com/p/779b8b23e08f)

```shell
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

chrome_options = Options()
# 无头模式启动
chrome_options.add_argument('--headless')
# 谷歌文档提到需要加上这个属性来规避bug
chrome_options.add_argument('--disable-gpu')
# 初始化实例
driver= webdriver.Chrome(chrome_options=chrome_options）
# 请求百度
driver.get("http://www.baidu.com")


–user-data-dir=”[PATH]”
# 指定用户文件夹User Data路径，可以把书签这样的用户数据保存在系统分区以外的分区

　　–disk-cache-dir=”[PATH]“
# 指定缓存Cache路径

　　–disk-cache-size=
# 指定Cache大小，单位Byte

　　–first run
# 重置到初始状态，第一次运行

　　–incognito
# 隐身模式启动

　　–disable-javascript
# 禁用Javascript

　　--omnibox-popup-count="num"
# 将地址栏弹出的提示菜单数量改为num个

　　--user-agent="xxxxxxxx"
# 修改HTTP请求头部的Agent字符串，可以通过about:version页面查看修改效果

　　--disable-plugins
# 禁止加载所有插件，可以增加速度。可以通过about:plugins页面查看效果

　　--disable-javascript
# 禁用JavaScript，如果觉得速度慢在加上这个

　　--disable-java
# 禁用java

　　--start-maximized
# 启动就最大化

　　--no-sandbox
# 取消沙盒模式

　　--single-process
# 单进程运行

　　--process-per-tab
# 每个标签使用单独进程

　　--process-per-site
# 每个站点使用单独进程

　　--in-process-plugins
# 插件不启用单独进程

　　--disable-popup-blocking
# 禁用弹出拦截

　　--disable-plugins
# 禁用插件

　　--disable-images
# 禁用图像

　　--incognito
# 启动进入隐身模式

　　--enable-udd-profiles
# 启用账户切换菜单

　　--proxy-pac-url
# 使用pac代理 [via 1/2]

　　--lang=zh-CN
# 设置语言为简体中文

　　--disk-cache-dir
# 自定义缓存目录

　　--disk-cache-size
# 自定义缓存最大值（单位byte）

　　--media-cache-size
# 自定义多媒体缓存最大值（单位byte）

　　--bookmark-menu
# 在工具 栏增加一个书签按钮

　　--enable-sync
# 启用书签同步
```
