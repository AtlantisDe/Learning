# Flag

## args

### 1. Images

- [How to disable images to download? · Issue #1147 · kblok/puppeteer-sharp](https://github.com/kblok/puppeteer-sharp/issues/1147)

```c#
const browser = await puppeteer.launch({
    args: [
      '--blink-settings=imagesEnabled=false'
    ]
});


options.Args = new string[1] { "--blink-settings=imagesEnabled=false" };

if (e.Request.ResourceType == PuppeteerSharp.ResourceType.Image)
{
    e.Request.AbortAsync();
}
else
{
    e.Request.ContinueAsync();
}


from selenium import webdriver

options = webdriver.ChromeOptions()
prefs = {'profile.default_content_setting_values': {'cookies': 2, 'images': 2, 'javascript': 2,
                            'plugins': 2, 'popups': 2, 'geolocation': 2,
                            'notifications': 2, 'auto_select_certificate': 2, 'fullscreen': 2,
                            'mouselock': 2, 'mixed_script': 2, 'media_stream': 2,
                            'media_stream_mic': 2, 'media_stream_camera': 2, 'protocol_handlers': 2,
                            'ppapi_broker': 2, 'automatic_downloads': 2, 'midi_sysex': 2,
                            'push_messaging': 2, 'ssl_cert_decisions': 2, 'metro_switch_to_desktop': 2,
                            'protected_media_identifier': 2, 'app_banner': 2, 'site_engagement': 2,
                            'durable_storage': 2}}
options.add_experimental_option('prefs', prefs)
options.add_argument("start-maximized")
options.add_argument("disable-infobars")
options.add_argument("--disable-extensions")
driver = webdriver.Chrome(chrome_options=options, executable_path=r'C:\Utility\BrowserDrivers\chromedriver.exe')
driver.get('https://play.google.com/store')
```
