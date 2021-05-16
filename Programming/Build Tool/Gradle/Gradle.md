# Gradle

- [Gradle 简介 w3cschool](https://www.w3cschool.cn/gradle/6qo51htq.html)
- [Gradle Build Tool](https://gradle.org/)
- [Gradle | Releases](https://gradle.org/releases/)
- Java (JRE) for Consumers
- Java (JDK) for Developers

## 简介

```C#
// Gradle是一个基于Apache Ant和Apache Maven概念的项目自动化构建开源工具。它使用一种基于Groovy的特定领域语言(DSL)来声明项目设置，抛弃了基于XML的各种繁琐配置。
// 面向Java应用为主。当前其支持的语言限于Java、Groovy、Kotlin和Scala，计划未来将支持更多的语言。

// Gradle是一个基于JVM的构建工具，是一款通用灵活的构建工具，支持maven， Ivy仓库，支持传递性依赖管理，而不需要远程仓库或者是pom.xml和ivy.xml配置文件，基于Groovy，build脚本使用Groovy编写。

// Gradle 需要 1.5 或更高版本的 JDK.Gradle 自带了 Groovy 库，所以不需要安装 Groovy。Gradle 会忽略已经安装的 Groovy。Gradle 会使用 ptah (这里的"path"应该是指 PATH 环境变量。[Rover12421]译注) 中的 JDK(可以使用 java -version 检查)。当然，你可以配置 JAVA_HOME 环境变量来指向 JDK 的安装目录。
```

## official

- [Gradle Build Tool](https://gradle.org/)
- [Gradle | Installation](https://gradle.org/install/)

## Downloads

- [Oracle Software Downloads | Oracle](https://www.oracle.com/downloads/)

## 教程

- [Gradle 教程](https://www.w3cschool.cn/gradle/)

## Prerequisites--安装先决条件[Java JDK or JRE]

- Gradle runs on all major operating systems and requires only a Java JDK or JRE version 8 or higher to be installed. To check, run java -version:

```shell
java -version
```

## 安装

- [Gradle | Installation](https://gradle.org/install/#with-a-package-manager)

1. Java JDK or JRE version 8 or higher to be installed.

   > java version "1.8.0_211"

2. Windows Releases ZIP

   > [Gradle | Releases | Download: binary-only or complete](https://gradle.org/releases/)

3. 配置环境变量

   - D:\Program Files\gradle-5.4.1\bin
   - D:\Program Files\gradle-4.10.1\bin

4. 测试安装

   > gradle -v

## 各个版本安装升级

- [android studio gradle 两种更新方法更新 - 罗锐原 - 博客园](https://www.cnblogs.com/luoruiyuan/p/6527995.html)
- [使用 Gradle 任务视图](https://blog.csdn.net/lvhjean/article/details/80997726)

## 官网地址和 gradle 各版本下载地址

- gradle-4.10.1-all.zip
- [官网](http://gradle.org/release-candidate/)
- [各版本下载地址](http://services.gradle.org/distributions)
