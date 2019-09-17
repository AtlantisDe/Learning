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
- [Adding Google Translate to a web site](https://stackoverflow.com/questions/12243818/adding-google-translate-to-a-web-site)

### 1. js

- af,sq,ar,hy,az,eu,be,bn,bg,ca,zh-CN,zh-TW,hr,cs,da,nl,eo,et,tl,fi,fr,gl,ka,de,el,gu,ht,iw,hi,hu,is,id,ga,it,ja,kn,ko,la,lv,lt,mk,ms,mt,no,fa,pl,pt,ro,ru,sr,sk,sl,es,sw,sv,ta,te,th,tr,uk,ur,vi,cy,yi
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

### 2. js

```js
af
sq
ar
hy
az
eu
be
bn
bg
ca
zh-CN
zh-TW
hr
cs
da
nl
eo
et
tl
fi
fr
gl
ka
de
el
gu
ht
iw
hi
hu
is
id
ga
it
ja
kn
ko
la
lv
lt
mk
ms
mt
no
fa
pl
pt
ro
ru
sr
sk
sl
es
sw
sv
ta
te
th
tr
uk
ur
vi
cy
yi

<div class="translate">
<div id="google_translate_element">
<div dir="ltr" class="skiptranslate goog-te-gadget">
<div id=":0.targetLanguage">
<select class="goog-te-combo">
<option value="">Select Language</option>
<option value="af">Afrikaans</option>
<option value="sq">Albanian</option>
<option value="ar">Arabic</option>
<option value="hy">Armenian</option>
<option value="az">Azerbaijani</option>
<option value="eu">Basque</option>
<option value="be">Belarusian</option>
<option value="bn">Bengali</option>
<option value="bg">Bulgarian</option>
<option value="ca">Catalan</option>
<option value="zh-CN">Chinese (Simplified)</option>
<option value="zh-TW">Chinese (Traditional)</option>
<option value="hr">Croatian</option>
<option value="cs">Czech</option>
<option value="da">Danish</option>
<option value="nl">Dutch</option>
<option value="eo">Esperanto</option>
<option value="et">Estonian</option>
<option value="tl">Filipino</option>
<option value="fi">Finnish</option>
<option value="fr">French</option>
<option value="gl">Galician</option>
<option value="ka">Georgian</option>
<option value="de">German</option>
<option value="el">Greek</option>
<option value="gu">Gujarati</option>
<option value="ht">Haitian Creole</option>
<option value="iw">Hebrew</option>
<option value="hi">Hindi</option>
<option value="hu">Hungarian</option>
<option value="is">Icelandic</option>
<option value="id">Indonesian</option>
<option value="ga">Irish</option>
<option value="it">Italian</option>
<option value="ja">Japanese</option>
<option value="kn">Kannada</option>
<option value="ko">Korean</option>
<option value="la">Latin</option>
<option value="lv">Latvian</option>
<option value="lt">Lithuanian</option>
<option value="mk">Macedonian</option>
<option value="ms">Malay</option>
<option value="mt">Maltese</option>
<option value="no">Norwegian</option>
<option value="fa">Persian</option>
<option value="pl">Polish</option>
<option value="pt">Portuguese</option>
<option value="ro">Romanian</option>
<option value="ru">Russian</option>
<option value="sr">Serbian</option>
<option value="sk">Slovak</option>
<option value="sl">Slovenian</option>
<option value="es">Spanish</option>
<option value="sw">Swahili</option>
<option value="sv">Swedish</option>
<option value="ta">Tamil</option>
<option value="te">Telugu</option>
<option value="th">Thai</option>
<option value="tr">Turkish</option>
<option value="uk">Ukrainian</option>
<option value="ur">Urdu</option>
<option value="vi">Vietnamese</option>
<option value="cy">Welsh</option>
<option value="yi">Yiddish</option>
</select>
</div>
Powered by <span style="white-space: nowrap;"><a class="goog-logo-link" href="http://translate.google.com" target="_blank"><img style="padding-right: 3px;" src="http://www.google.com/images/logos/google_logo_41.png" width="37" height="13">Translate</a></span></div></div>
                <script>
                    function googleTranslateElementInit() {
                        new google.translate.TranslateElement({
                            pageLanguage: 'en'
                        }, 'google_translate_element');
                    }
                </script>
            </div
```
