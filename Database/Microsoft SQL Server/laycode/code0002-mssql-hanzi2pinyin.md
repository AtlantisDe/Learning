# MSSQL

## sql汉字转拼音

```sql
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[fn_GetPinyin](@words nvarchar(2000))
returns varchar(8000)
as 
begin 
declare @word nchar(1)
declare @pinyin varchar(8000)
declare @i int 
declare @words_len int 
declare @unicode int 
set @i = 1 
set @words = ltrim(rtrim(@words)) 
set @words_len = len(@words) 
while (@i <= @words_len) --循环取字符 
begin 
set @word = substring(@words, @i, 1) 
set @unicode = unicode(@word) 
set @pinyin = ISNULL(@pinyin+space(1),'')+ 
(case when unicode(@word) between 19968 and 19968+20901 then 
(select top 1 py from ( 
select 'a' as py,N'厑' as word 
union all select 'ai',N'靉' 
union all select 'an',N'黯' 
union all select 'ang',N'醠' 
union all select 'ao',N'驁' 
union all select 'ba',N'欛' 
union all select 'bai',N'瓸' --韛兡瓸 
union all select 'ban',N'瓣' 
union all select 'bang',N'鎊' 
union all select 'bao',N'鑤' 
union all select 'bei',N'鐾' 
union all select 'ben',N'輽' 
union all select 'beng',N'鏰' 
union all select 'bi',N'鼊' 
union all select 'bian',N'變' 
union all select 'biao',N'鰾' 
union all select 'bie',N'彆' 
union all select 'bin',N'鬢' 
union all select 'bing',N'靐' 
union all select 'bo',N'蔔' 
union all select 'bu',N'簿' 
union all select 'ca',N'囃' 
union all select 'cai',N'乲' --縩乲 
union all select 'can',N'爘' 
union all select 'cang',N'賶' 
union all select 'cao',N'鼜' 
union all select 'ce',N'簎' 
union all select 'cen',N'笒' 
union all select 'ceng',N'乽' --硛硳岾猠乽 
union all select 'cha',N'詫' 
union all select 'chai',N'囆' 
union all select 'chan',N'顫' 
union all select 'chang',N'韔' 
union all select 'chao',N'觘' 
union all select 'che',N'爡' 
union all select 'chen',N'讖' 
union all select 'cheng',N'秤' 
union all select 'chi',N'鷘' 
union all select 'chong',N'銃' 
union all select 'chou',N'殠' 
union all select 'chu',N'矗' 
union all select 'chuai',N'踹' 
union all select 'chuan',N'鶨' 
union all select 'chuang',N'愴' 
union all select 'chui',N'顀' 
union all select 'chun',N'蠢' 
union all select 'chuo',N'縒' 
union all select 'ci',N'嗭' --賜嗭
union all select 'cong',N'謥'
union all select 'cou',N'輳' 
union all select 'cu',N'顣' 
union all select 'cuan',N'爨' 
union all select 'cui',N'臎' 
union all select 'cun',N'籿' 
union all select 'cuo',N'錯' 
union all select 'da',N'橽' 
union all select 'dai',N'靆' 
union all select 'dan',N'饏' 
union all select 'dang',N'闣' 
union all select 'dao',N'纛' 
union all select 'de',N'的' 
union all select 'den',N'扽' 
union all select 'deng',N'鐙'
union all select 'di',N'螮' 
union all select 'dia',N'嗲' 
union all select 'dian',N'驔' 
union all select 'diao',N'鑃' 
union all select 'die',N'嚸' --眰嚸 
union all select 'ding',N'顁' 
union all select 'diu',N'銩' 
union all select 'dong',N'霘' 
union all select 'dou',N'鬭' 
union all select 'du',N'蠹' 
union all select 'duan',N'叾' --籪叾 
union all select 'dui',N'譵' 
union all select 'dun',N'踲' 
union all select 'duo',N'鵽' 
union all select 'e',N'鱷' 
union all select 'en',N'摁' 
union all select 'eng',N'鞥' 
union all select 'er',N'樲' 
union all select 'fa',N'髮' 
union all select 'fan',N'瀪' 
union all select 'fang',N'放' 
union all select 'fei',N'靅' 
union all select 'fen',N'鱝' 
union all select 'feng',N'覅' 
union all select 'fo',N'梻' 
union all select 'fou',N'鴀' 
union all select 'fu',N'猤' --鰒猤 
union all select 'ga',N'魀' 
union all select 'gai',N'瓂' 
union all select 'gan',N'灨' 
union all select 'gang',N'戇' 
union all select 'gao',N'鋯' 
union all select 'ge',N'獦' 
union all select 'gei',N'給' 
union all select 'gen',N'搄' 
union all select 'geng',N'堩' --亙堩啹喼嗰 
union all select 'gong',N'兣' --熕贑兝兣 
union all select 'gou',N'購' 
union all select 'gu',N'顧' 
union all select 'gua',N'詿' 
union all select 'guai',N'恠' 
union all select 'guan',N'鱹' 
union all select 'guang',N'撗' 
union all select 'gui',N'鱥' 
union all select 'gun',N'謴' 
union all select 'guo',N'腂' 
union all select 'ha',N'哈' 
union all select 'hai',N'饚' 
union all select 'han',N'鶾' 
union all select 'hang',N'沆' 
union all select 'hao',N'兞' 
union all select 'he',N'靏' 
union all select 'hei',N'嬒' 
union all select 'hen',N'恨' 
union all select 'heng',N'堼' --堼囍 
union all select 'hong',N'鬨' 
union all select 'hou',N'鱟' 
union all select 'hu',N'鸌' 
union all select 'hua',N'蘳' 
union all select 'huai',N'蘾' 
union all select 'huan',N'鰀' 
union all select 'huang',N'鎤' 
union all select 'hui',N'顪' 
union all select 'hun',N'諢' 
union all select 'huo',N'夻' 
union all select 'ji',N'驥' 
union all select 'jia',N'嗧' 
union all select 'jian',N'鑳' 
union all select 'jiang',N'謽' 
union all select 'jiao',N'釂' 
union all select 'jie',N'繲' 
union all select 'jin',N'齽' 
union all select 'jing',N'竸' 
union all select 'jiong',N'蘔' 
union all select 'jiu',N'欍' 
union all select 'ju',N'爠' 
union all select 'juan',N'羂' 
union all select 'jue',N'钁' 
union all select 'jun',N'攈' 
union all select 'ka',N'鉲' 
union all select 'kai',N'乫' --鎎乫 
union all select 'kan',N'矙' 
union all select 'kang',N'閌' 
union all select 'kao',N'鯌' 
union all select 'ke',N'騍' 
union all select 'ken',N'褃' 
union all select 'keng',N'鏗' --巪乬唟厼怾 
union all select 'kong',N'廤' 
union all select 'kou',N'鷇' 
union all select 'ku',N'嚳' 
union all select 'kua',N'骻' 
union all select 'kuai',N'鱠' 
union all select 'kuan',N'窾' 
union all select 'kuang',N'鑛' 
union all select 'kui',N'鑎' 
union all select 'kun',N'睏' 
union all select 'kuo',N'穒' 
union all select 'la',N'鞡' 
union all select 'lai',N'籟' 
union all select 'lan',N'糷' 
union all select 'lang',N'唥' 
union all select 'lao',N'軂' 
union all select 'le',N'餎' 
union all select 'lei',N'脷' --嘞脷 
union all select 'leng',N'睖' 
union all select 'li',N'瓈' 
union all select 'lia',N'倆' 
union all select 'lian',N'纞' 
union all select 'liang',N'鍄' 
union all select 'liao',N'瞭' 
union all select 'lie',N'鱲' 
union all select 'lin',N'轥' --轥拎 
union all select 'ling',N'炩' 
union all select 'liu',N'咯' --瓼甅囖咯 
union all select 'long',N'贚' 
union all select 'lou',N'鏤' 
union all select 'lu',N'氇' 
union all select 'lv',N'鑢' 
union all select 'luan',N'亂' 
union all select 'lue',N'擽' 
union all select 'lun',N'論' 
union all select 'luo',N'鱳' 
union all select 'ma',N'嘛' 
union all select 'mai',N'霢' 
union all select 'man',N'蘰' 
union all select 'mang',N'蠎' 
union all select 'mao',N'唜' 
union all select 'me',N'癦' --癦呅 
union all select 'mei',N'嚜' 
union all select 'men',N'們' 
union all select 'meng',N'霥' --霿踎 
union all select 'mi',N'羃' 
union all select 'mian',N'麵' 
union all select 'miao',N'廟' 
union all select 'mie',N'鱴' --鱴瓱 
union all select 'min',N'鰵' 
union all select 'ming',N'詺' 
union all select 'miu',N'謬' 
union all select 'mo',N'耱' --耱乮 
union all select 'mou',N'麰' --麰蟱 
union all select 'mu',N'旀' 
union all select 'na',N'魶' 
union all select 'nai',N'錼' 
union all select 'nan',N'婻' 
union all select 'nang',N'齉' 
union all select 'nao',N'臑' 
union all select 'ne',N'呢' 
union all select 'nei',N'焾' --嫩焾 
union all select 'nen',N'嫩' 
union all select 'neng',N'能' --莻嗯鈪銰啱 
union all select 'ni',N'嬺' 
union all select 'nian',N'艌' 
union all select 'niang',N'釀' 
union all select 'niao',N'脲' 
union all select 'nie',N'钀' 
union all select 'nin',N'拰' 
union all select 'ning',N'濘' 
union all select 'niu',N'靵' 
union all select 'nong',N'齈' 
union all select 'nou',N'譳' 
union all select 'nu',N'搙' 
union all select 'nv',N'衄' 
union all select 'nue',N'瘧' 
union all select 'nuan',N'燶' --硸黁燶郍 
union all select 'nuo',N'桛' 
union all select 'o',N'鞰' --毮夞乯鞰 
union all select 'ou',N'漚' 
union all select 'pa',N'袙' 
union all select 'pai',N'磗' --鎃磗 
union all select 'pan',N'鑻' 
union all select 'pang',N'胖' 
union all select 'pao',N'礮' 
union all select 'pei',N'轡' 
union all select 'pen',N'喯' 
union all select 'peng',N'喸' --浌巼闏乶喸 
union all select 'pi',N'鸊' 
union all select 'pian',N'騙' 
union all select 'piao',N'慓' 
union all select 'pie',N'嫳' 
union all select 'pin',N'聘' 
union all select 'ping',N'蘋' 
union all select 'po',N'魄' 
union all select 'pou',N'哛' --兺哛 
union all select 'pu',N'曝' 
union all select 'qi',N'蟿' 
union all select 'qia',N'髂' 
union all select 'qian',N'縴' 
union all select 'qiang',N'瓩' --羻兛瓩 
union all select 'qiao',N'躈' 
union all select 'qie',N'籡' 
union all select 'qin',N'藽' 
union all select 'qing',N'櫦' 
union all select 'qiong',N'瓗' 
union all select 'qiu',N'糗' 
union all select 'qu',N'覻' 
union all select 'quan',N'勸' 
union all select 'que',N'礭' 
union all select 'qun',N'囕' 
union all select 'ran',N'橪' 
union all select 'rang',N'讓' 
union all select 'rao',N'繞' 
union all select 're',N'熱' 
union all select 'ren',N'餁' 
union all select 'reng',N'陾' 
union all select 'ri',N'馹' 
union all select 'rong',N'穃' 
union all select 'rou',N'嶿' 
union all select 'ru',N'擩' 
union all select 'ruan',N'礝' 
union all select 'rui',N'壡' 
union all select 'run',N'橍' --橍挼 
union all select 'ruo',N'鶸' 
union all select 'sa',N'栍' --櫒栍 
union all select 'sai',N'虄' --簺虄 
union all select 'san',N'閐' 
union all select 'sang',N'喪' 
union all select 'sao',N'髞' 
union all select 'se',N'飋' --裇聓 
union all select 'sen',N'篸' 
union all select 'seng',N'縇' --閪縇 
union all select 'sha',N'霎' 
union all select 'shai',N'曬' 
union all select 'shan',N'鱔' 
union all select 'shang',N'緔' 
union all select 'shao',N'潲' 
union all select 'she',N'欇' 
union all select 'shen',N'瘮' 
union all select 'sheng',N'賸' 
union all select 'shi',N'瓧' --鰘齛兙瓧 
union all select 'shou',N'鏉' 
union all select 'shu',N'虪' 
union all select 'shua',N'誜' 
union all select 'shuai',N'卛' 
union all select 'shuan',N'腨' 
union all select 'shuang',N'灀' 
union all select 'shui',N'睡' 
union all select 'shun',N'鬊' 
union all select 'shuo',N'鑠' 
union all select 'si',N'乺' --瀃螦乺 
union all select 'song',N'鎹' 
union all select 'sou',N'瘶' 
union all select 'su',N'鷫' 
union all select 'suan',N'算' 
union all select 'sui',N'鐩' 
union all select 'sun',N'潠' 
union all select 'suo',N'蜶' 
union all select 'ta',N'襨' --躢襨 
union all select 'tai',N'燤' 
union all select 'tan',N'賧' 
union all select 'tang',N'燙' 
union all select 'tao',N'畓' --討畓 
union all select 'te',N'蟘' 
union all select 'teng',N'朰' --霯唞朰 
union all select 'ti',N'趯' 
union all select 'tian',N'舚' 
union all select 'tiao',N'糶' 
union all select 'tie',N'餮' 
union all select 'ting',N'乭' --濎乭 
union all select 'tong',N'憅' 
union all select 'tou',N'透' 
union all select 'tu',N'鵵' 
union all select 'tuan',N'褖' 
union all select 'tui',N'駾' 
union all select 'tun',N'坉' 
union all select 'tuo',N'籜' 
union all select 'wa',N'韤' 
union all select 'wai',N'顡' 
union all select 'wan',N'贎' 
union all select 'wang',N'朢' 
union all select 'wei',N'躛' 
union all select 'wen',N'璺' 
union all select 'weng',N'齆' 
union all select 'wo',N'齷' 
union all select 'wu',N'鶩' 
union all select 'xi',N'衋' 
union all select 'xia',N'鏬' 
union all select 'xian',N'鼸' 
union all select 'xiang',N'鱌' 
union all select 'xiao',N'斆' 
union all select 'xie',N'躞' 
union all select 'xin',N'釁' 
union all select 'xing',N'臖' 
union all select 'xiong',N'敻' 
union all select 'xiu',N'齅' 
union all select 'xu',N'蓿' 
union all select 'xuan',N'贙' 
union all select 'xue',N'瀥' 
union all select 'xun',N'鑂' 
union all select 'ya',N'齾' 
union all select 'yan',N'灩' 
union all select 'yang',N'樣' 
union all select 'yao',N'鑰' 
union all select 'ye',N'岃' --鸈膶岃 
union all select 'yi',N'齸' 
union all select 'yin',N'檼' 
union all select 'ying',N'譍' 
union all select 'yo',N'喲' 
union all select 'yong',N'醟' 
union all select 'you',N'鼬' 
union all select 'yu',N'爩' 
union all select 'yuan',N'願' 
union all select 'yue',N'鸙' 
union all select 'yun',N'韻' 
union all select 'za',N'雥' 
union all select 'zai',N'縡' 
union all select 'zan',N'饡' 
union all select 'zang',N'臟' 
union all select 'zao',N'竈' 
union all select 'ze',N'稄' 
union all select 'zei',N'鱡' 
union all select 'zen',N'囎' 
union all select 'zeng',N'贈' 
union all select 'zha',N'醡' 
union all select 'zhai',N'瘵' 
union all select 'zhan',N'驏' 
union all select 'zhang',N'瞕' 
union all select 'zhao',N'羄' 
union all select 'zhe',N'鷓' 
union all select 'zhen',N'黮' 
union all select 'zheng',N'證' 
union all select 'zhi',N'豒' 
union all select 'zhong',N'諥' 
union all select 'zhou',N'驟' 
union all select 'zhu',N'鑄' 
union all select 'zhua',N'爪' 
union all select 'zhuai',N'跩' 
union all select 'zhuan',N'籑' 
union all select 'zhuang',N'戅' 
union all select 'zhui',N'鑆' 
union all select 'zhun',N'稕' 
union all select 'zhuo',N'籱' 
union all select 'zi',N'漬' --漬唨 
union all select 'zong',N'縱' 
union all select 'zou',N'媰' 
union all select 'zu',N'謯' 
union all select 'zuan',N'攥' 
union all select 'zui',N'欈' 
union all select 'zun',N'銌' 
union all select 'zuo',N'咗') t 
where word >= @word collate Chinese_PRC_CS_AS_KS_WS 
order by word ASC) else @word end) 
set @i = @i + 1 
end 
return @pinyin 
END

GO
```