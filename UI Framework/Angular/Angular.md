# Angular

- Angular 是一款优秀的前端 JS 框架，已经被用于 Google 的多款产品当中。

- [介绍 Angular7 最新功能，或许你就开始喜欢上它](https://baijiahao.baidu.com/s?id=1618389718123024252&wfr=spider&for=pc)
- [Angular 在国内就这么不受待见？ - V2EX](https://www.v2ex.com/t/492229)

## 中文

- [Angular - 特性与优点](https://www.angular.cn/features)
- [Angular - 关于中文版](https://www.angular.cn/translations/cn/home)

## 先决条件

```shell
node -v    #查看node版本
npm -v      #查看npm版本
```

## 因为 angular-cli 是用 typescript 写的，所以要先装这两个

```shell
npm install -g typescript typings
```

## 第一步：安装 Angular CLI

- 要想使用 npm 来安装 CLI，请打开终端/控制台窗口，并输入下列命令

```shell
npm install -g @angular/cli
```

## 安装后看看

```shell
ng -v
```

## 如果你之前安装失败过，最好在安装 angular-cli 之前先卸载干净，用以下两句

```shell
npm uninstall -g angular-cli
npm cache clean
```

## 卸载新版本

```shell
npm uninstall @angular/cli
```

## 可能新版本会提示使用 npm cache verify 删除，可能删除不成功，强制删除

- 其他失败原因可能缺少 python 环境等。

```shell
npm cache verify --force
```
