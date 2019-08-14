# Translate

- [使用 google 语言 api 来实现整个网站的翻译 - 曾经沧海　云淡风轻 - 博客园](https://www.cnblogs.com/yifenghong/p/4522949.html)
- [谷歌大神 Jeff Dean：谷歌翻译 API 付费服务已获利 - 人工智能 - 电子发烧友网](http://www.elecfans.com/rengongzhineng/636406.html)
- [这是真的，Google 翻译的 API 真的关闭了-腾讯云资讯](https://cloud.tencent.com/info/aa73e69f1b1f8f14ccdd15f0e8666ef2.html)
- [快速入门：使用客户端库](https://cloud.google.com/translate/docs/quickstart-client-libraries)
- [GoogleCloudPlatform/dotnet-docs-samples](https://github.com/GoogleCloudPlatform/dotnet-docs-samples/blob/2ec373efac86f3e589ff98ac8abf5d28b29b1578/translate/api/QuickStart/Program.cs)

## Official

### Google.Cloud.Translation.V2

- [Cloud Translation API](https://console.developers.google.com/apis/library/translate.googleapis.com?filter=category:machine-learning&project=fluid-mote-240115&folder&organizationId)
- [Google.Cloud.Translation.V2 | Google.Cloud.Translation.V2](https://googleapis.github.io/google-cloud-dotnet/docs/Google.Cloud.Translation.V2/)
- [Google Cloud Client Libraries for .NET | Google Cloud APIs](https://googleapis.github.io/google-cloud-dotnet/docs/index.html)

### js

- includedLanguages: 'en,zh-CN,hr,cs,da,nl,fr,de,el,iw,hu,ga,it,ja,ko,pt,ro,ru,sr,es,th,vi',

```js

<div id="google_translate_element"></div>

  <script>
    function googleTranslateElementInit() {
      new google.translate.TranslateElement({
        pageLanguage: 'it',
        layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
      }, 'google_translate_element');
    }

    function googleTranslateElementInit() {
      new google.translate.TranslateElement({
        pageLanguage: 'zh-CN',
        includedLanguages: 'en,ja',
        autoDisplay: true,
        gaTrack: true,
        gaId: 'UA-4334041-9',
        layout: google.translate.TranslateElement.InlineLayout.SIMPLE
      }, 'google_translate_element');
    }
  </script>
  <script src="http://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
```
