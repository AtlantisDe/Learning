# Sina Finance

- [新浪股票接口获取历史数据*wqy161109 *股票历史数据接口](https://blog.csdn.net/wqy161109/article/details/80052716)
- [数据接口-免费版（股票数据 API）*李明*获得股票排名数据接口](https://blog.csdn.net/llingmiao/article/details/79941066)
- [gaoooyuk/FuturesSpeculator](https://github.com/gaoooyuk/FuturesSpeculator/wiki/Data)
- [腾讯股票接口](https://blog.csdn.net/luanpeng825485697/article/details/78442062)
- [雪球股票数据接口 - CSDN](https://www.csdn.net/gather_20/MtTagg1sNDM0NDUtYmxvZwO0O0OO0O0O.html)

## 0. 基础知识

### 0. A 股

```c#
A股是在内地上市的股票。
沪深A股
```

### 1. K 线图

- [股票 K 线图 蜡烛图](https://blog.csdn.net/wowocpp/article/details/88372264)
- [股票行情中，日均线是怎样算出来的？](http://licai.cofool.com/ask/qa_128360.html)

```c#
// 5天均线的值=最近连续5个交易日收盘价之和1/5
// 股票中K线,阴线,阳线,十字线,指标分析用英文
K （shaped)line
negative line
positive line
cross line
index analysis



// 可将Ｋ线分为极阴、极阳,小阴、小阳,中阴中阳和大阴、大阳等线型

```

### 2. 股票 PE 动

- [股票 PE 动](https://zhidao.baidu.com/question/204553024840607365.html)
- [股市指标 PE【动】是什么意思？\_叩富网](http://licai.cofool.com/ask/qa_6808.html)
- [请问股票中的 PE[动]是什么意思？高好还是低好？](https://zhidao.baidu.com/question/125222753.html)

```c#
// PE 就 是PRICE EARNING RATIO ， 中 文 译 为 本 益 比 。
// PE 的 算 法 简bai 单 ， 我 们 只 需 要 把 一 只 股 票 的 股 价 除 以 它 的 每 股 净 利 就 可 得 到 它 的 本 益 比PE 。

(PE ＝ PRICE / EARNING PER SHARE)

// 举 个 例 子 ：MIECO 的 股 本 是210 million 。1999 年 它 的 净 盈 利 是21 million 。 净 盈 利 就 是after tax profit 。
// 所 以 它 的 每 股 净 利EARNING PER SHARE (EPS) 就 是0.10 。

EPS = EARNING / NO. OF SHARES
EPS = 21 / 210
EPS ＝ 0.10

// 23/2/2001 它 的 股 价 是0.86 $ 。

PRICE = 0.86

// PE 的 算 法 就 是 ：
PE = PRICE / EPS
PE = 0.86 / 0.10

```

### 3. 中国股市开盘时间

```c#

// 中国的股市开盘时间是周一到周五，早上从9：30–11：30，下午收盘时间：13：00–15：00，中国所有地方都一样。

// 中国香港股市开盘和收盘时间为：上午10：00——12：30；下午2：30——4：00；中国台湾股市开盘为：上午9：00——下午1：30。

// 2018年股市休市时间:

// 元旦：2018年元旦是1月1日星期一。2018年元旦放假安排：12月30日至1日放假调休，共3天。1月2日（星期二）正常上班。股市休市时间：12月30日至1日。春节：2018年春节是2月16日星期五。

```

## 1. 常用

```c#
// 腾讯接口
http://data.gtimg.cn/flashdata/hushen/latest/daily/sz002400.js?maxage=1000&visitDstTime=1

http://suggest3.sinajs.cn/suggest/type=&key=sz

http://hq.sinajs.cn/list=sz002400

http://stock2.finance.sina.com.cn/futures/api/json.php/IndexService.getInnerFuturesDailyKLine?symbol=M0

// 新浪股票接口：
// （参数：股票编号、分钟间隔（5、15、30、60）、均值（5、10、15、20、25）、查询个数点（最大值242））
http://money.finance.sina.com.cn/quotes_service/api/json_v2.php/CN_MarketData.getKLineData?symbol=sz002400&scale=60&ma=25&datalen=10
http://money.finance.sina.com.cn/quotes_service/api/json_v2.php/CN_MarketData.getKLineData?symbol=sz002400&scale=60&ma=25&datalen=200

// 新浪接口 最近二十天左右的每5分钟数据
// 腾讯股票接口、和讯网股票接口、新浪股票接口、雪球股票数据、网易股票数据
http://money.finance.sina.com.cn/quotes_service/api/json_v2.php/CN_MarketData.getKLineData?symbol=sz000001&scale=5&ma=5&datalen=1023


// 方法3：
http://money.finance.sina.com.cn/quotes_service/api/json_v2.php/CN_MarketData.getKLineData?symbol=[市场][股票代码]&scale=[周期]&ma=no&datalen=[长度]

// 返回数据：XLS文件；股票历史成交明细。
方法5：http://market.finance.sina.com.cn/downxls.php?date=[日期]&symbol=[市场][股票代码]
http://market.finance.sina.com.cn/downxls.php?date=2015-06-15&symbol=sz002095


// 获取2015-06-15日期的深圳市长002095数据。

// 方法6：
http://market.finance.sina.com.cn/pricehis.php?symbol=[市场][股票代码]&startdate=[开始日期]&enddate=[结束日期]
// 返回数据：HTML文本；指定日期范围内的股票分价表。
http://market.finance.sina.com.cn/pricehis.php?symbol=sh600900&startdate=2011-08-17&enddate=2011-08-19

```

## 2. 导航

- [Getting Title at 18:28](https://www.cnblogs.com/xuliangxing/p/8492705.html)
- [Getting Title at 18:40](https://www.cnblogs.com/utank/p/4555588.html)
- [股票代码 - 许愿瓶 666666 - 博客园](https://www.cnblogs.com/xyp666/p/9233926.html)
- [行情中心](http://vip.stock.finance.sina.com.cn/mkt/)
- [行情](http://finance.sina.com.cn/stockradar/config.html)

```c#
// 创业板：创业板的代码是300打头的股票代码

// 沪市A股：沪市A股的代码是以600、601或603打头

// 沪市B股：沪市B股的代码是以900打头

// 深市A股：深市A股的代码是以000打头

// 深圳B股：深圳B股的代码是以200打头

// 中小板：中小板的代码是002打头

// 新股申购：沪市新股申购的代码是以730打头；深市新股申购的代码与深市股票买卖代码一样

// 配股代码：沪市以700打头，深市以080打头 权证，沪市是580打头 深市是031打头

// 千股千评
http://vip.stock.finance.sina.com.cn/q/go.php/vInvestConsult/kind/qgqp/index.phtml

http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getHQNodes

http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getRTHKStockData?page=1&num=5&sort=changepercent&asc=0&node=qbgg_hk

http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getFundNetData?page=1&num=5&sort=date&asc=0&node=open_fund

http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getHQNodeData?page=1&num=40&sort=symbol&asc=1&node=sw2_510100&symbol=&_s_r_a=init
```

## 3. 东方财富

- [行情中心 财富网](http://quote.eastmoney.com/center/gridlist.html#hs_a_board)
- [容百科技 688005](http://quote.eastmoney.com/basic/kcbh5chart-iframe.html?code=688005&market=1&type=k)
- [1 常见的 HTTP 股票数据接口整理 腾讯 新浪 网易 2019-08-02_CalmReason](https://blog.csdn.net/calmreason/article/details/94536985)

```c#
https://push2his.eastmoney.com/api/qt/stock/kline/get?secid=0.002400&cb=fsdata1599998370&klt=101&fqt=0&lmt=80&end=20200913&iscca=1&fields1=f1%2Cf2%2Cf3%2Cf4%2Cf5&fields2=f51%2Cf52%2Cf53%2Cf54%2Cf55%2Cf56%2Cf57%2Cf59&ut=f057cbcbce2a86e2866ab8877db1d059&forcect=1&fsdata1599998370=fsdata1599998370


https://push2his.eastmoney.com/api/qt/stock/kline/get?secid=1.000001&cb=fsdata1599998125&klt=101&fqt=0&lmt=125&end=20200913&iscca=1&fields1=f1%2Cf2%2Cf3%2Cf4%2Cf5&fields2=f51%2Cf52%2Cf53%2Cf54%2Cf55%2Cf56%2Cf57%2Cf59&ut=f057cbcbce2a86e2866ab8877db1d059&forcect=1&fsdata1599998125=fsdata1599998125


https://push2his.eastmoney.com/api/qt/stock/kline/get?secid=0.002400&cb=fsdata1599998370&klt=101&fqt=0&lmt=80&end=20200913&iscca=1&fields1=f1,f2,f3,f4,f5&fields2=f51,f52,f53,f54,f55,f56,f57,f59&ut=f057cbcbce2a86e2866ab8877db1d059&forcect=1&fsdata1599998370=fsdata1599998370


https://push2his.eastmoney.com/api/qt/stock/kline/get?secid=1.000001&cb=fsdata1599998125&klt=101&fqt=0&lmt=125&end=20200913&iscca=1&fields1=f1,f2,f3,f4,f5&fields2=f51,f52,f53,f54,f55,f56,f57,f59&ut=f057cbcbce2a86e2866ab8877db1d059&forcect=1&fsdata1599998125=fsdata1599998125


https://push2his.eastmoney.com/api/qt/stock/kline/get?secid=0.002400&cb=fsdata1599998370&klt=101&fqt=0&lmt=80&end=20200913&iscca=1&fields1=f1,f2,f3,f4,f5&fields2=f51,f52,f53,f54,f55,f56,f57,f59&ut=f057cbcbce2a86e2866ab8877db1d059

https://push2his.eastmoney.com/api/qt/stock/kline/get?secid=0.002400&cb=fsdata1599998370&klt=101&fqt=0&lmt=80&end=20200913&iscca=1&fields1=f1,f2,f3,f4,f5&fields2=f51,f52,f53,f54,f55,f56,f57,f59&ut=

```

## 4. 网易股票接口

- [沪深行情 网易财经](http://quotes.money.163.com/stock)
- [从网易接口获得股票的历史信息 - 逆火狂飙 - 博客园](https://www.cnblogs.com/heyang78/p/12355539.html)
- [获取股票历史数据（网易 163 行情接口） 心无挂碍-CSDN 博客](https://blog.csdn.net/weixin_44766484/article/details/105802794)

```c#

```

## 7. 证券宝

- [证券宝](http://baostock.com/baostock/index.php)

```c#

```

## 8. Tushare 大数据社区

- [Tushare 大数据社区](https://tushare.pro/)

```c#

```

## 9. 项目

- [Getting Title at 7:46](https://github.com/waditu/tushare)
- [Getting Title at 8:04](https://github.com/tomhans2/TuSharePro)

## 10. 资讯综合站点收集

- [DDX 在线-实时 DDX 指标查询 DDE BBD 股票池 超赢决策 股票内参 股票网](http://www.ddxzx.com/)

## 2. QuickStart

- [Futu OpenAPI 介绍 | Futu API 文档 v5.2](https://openapi.futunn.com/futu-api-doc/)
- [Futu OpenAPI 介绍 | Futu API 文档 v5.2](https://openapi.futunn.com/futu-api-doc/intro/intro.html)
- [moomoo, your one-stop investment platform!](https://www.moomoo.com/)
- [下载 | FUTU Open API](https://www.futunn.com/download/OpenAPI)

```c#

```

## 11. 富途牛牛

- [下载 | 富途牛牛 for Windows](https://www.futunn.com/download/windows?lang=zh-CN)
- [交易员必备！玩转富途牛牛的 3 个小技巧*玩转富途牛牛*腾讯视频](https://v.qq.com/x/cover/z7xbcmqplp26gim/x0904my3q9r.html)
- [如何进行模拟交易？-富途牛牛帮助中心](https://support.futunn.com/zh-cn/topic29)
- [Getting Title at 56:23](https://m-match.futunn.com/simulate?lang=zh-cn#/account)

```c#

```
