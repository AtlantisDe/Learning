# Java

- [Java SE - Downloads | Oracle Technology Network | Oracle](https://www.oracle.com/technetwork/java/javase/downloads/index.html)
- JRE 是 Java Runtime Environment 缩写

## JDK，JRE 和 JVM

- JRE： Java Runtime Environment
- 中文名称叫做 JAVA 运行环境，包含了 JAVA 虚拟机 JVM( java virtual machine)，JAVA 基础类库，构成了 JAVA 程序运行所需要的软件环境，有了 JRE 只可以运行而不可以编写 JAVA 程序。
- JDK：Java Development Kit
- 中文名称叫做 java 开发工具包，包含了 JAVA 编译器 javac，调试分析工具 jconsole，jvisualvm 等。有了 JDK，就可以编写 JAVA 程序。
- JVM:java virtual machine
- JAVA 虚拟机是整个 java 实现跨平台的最核心的部分。每一个 JAVA 文件都会被编译成.class 文件再交由 JVM 运行，JVM 作为 JAVA 文件和操作系统的中间人，将 JAVA 文件解释给本地系统执行，使.class 文件不直接与操作系统对应，可以容易地实现跨平台。

## Java JDK or JRE 安装[示例]

- [Java (JRE) for Consumers](http://java.com/download)
- [Java (JDK) for Developers](https://www.oracle.com/technetwork/java/javase/downloads/)

- 当前安装 JDK 版本: jdk-12.0.1_windows-x64_bin.exe
- 当前安装 JRE 版本: jre-8u211-windows-x64.exe

## 一键安装批处理

- [一键安装 JDK 和 JRE 并自动配置 Java 环境变量 - 唐传林的博客 - CSDN 博客](https://blog.csdn.net/tang_chuanlin/article/details/80240672)

## 一键安装失败,手动安装好了

```shell
D:\Program Files\Java\jdk-12.0.1\
D:\Program Files\Java\jre1.8.0_211
```

## 效验安装

```shell
java -version
```

## jdk 版本与 jre 版本

```text
C:\Users\SpaceX>java -version
java version "1.8.0_211"
Java(TM) SE Runtime Environment (build 1.8.0_211-b12)
Java HotSpot(TM) 64-Bit Server VM (build 25.211-b12, mixed mode)
```

## 环境变量

```shell
JAVA_HOME C:\Java\jdk1.8
JAVA_HOME D:\Program Files\Java\jdk-12.0.1
```

## 变量设置参数如下：

- 变量设置参数如下：

```shell
变量名：JAVA_HOME
变量值：C:\Program Files (x86)\Java\jdk1.8.0_91        // 要根据自己的实际路径配置
变量名：CLASSPATH
变量值：.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;         //记得前面有个"."
变量名：Path

变量值：%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;
```

## Java8 Java9 区别

```text
java 版本1.8 = java版本8
同理
java 版本1.7 = java版本7
结论就是：
1.n. = n
```
