## Maven仓库

- [远程仓库](https://mvnrepository.com/)

### 仓库配置

#### 配置本地仓库

```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">
    <!-- 本地仓库配置 -->
    <localRepository>具体本地仓库位置</localRepository>
    <!-- 省略，具体信息参考后续内容。 -->
</settings>
```

#### 配置镜像仓库配置

```xml

<mirror>
    <!-- 指定镜像ID（可自己改名） -->
    <id>nexus-aliyun</id>
    <!-- 匹配中央仓库（阿里云的仓库名称，不可以自己起名，必须这么写）-->
    <mirrorOf>central</mirrorOf>
    <!-- 指定镜像名称（可自己改名）  -->
    <name>Nexus aliyun</name>
    <!-- 指定镜像路径（镜像地址） -->
    <!--  阿里云镜像  -->
    <url>http://maven.aliyun.com/nexus/content/groups/public</url>
</mirror>
```

### JDK配置

```xml

<profile>
    <!-- settings.xml中的id不能随便起的 -->
    <!-- 告诉maven我们用jdk1.8 -->
    <id>jdk-1.8</id>
    <!-- 开启JDK的使用 -->
    <activation>
        <activeByDefault>true</activeByDefault>
        <jdk>1.8</jdk>
    </activation>
    <properties>
        <!-- 配置编译器信息 -->
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
        <maven.compiler.compilerVersion>1.8</maven.compiler.compilerVersion>
    </properties>
</profile>
```

### Maven工程类型

>【1】POM工程
POM工程是逻辑工程。用在父级工程或聚合工程中。用来做jar包的版本控制。

>【2】JAR工程
将会打包成jar，用作jar包使用。即常见的本地工程 ---> Java Project。

>【3】WAR工程
将会打包成war，发布在服务器上的工程。


### Maven项目结构
> ❀ src/main/java  这个目录下储存java源代码

> ❀ src/main/resources   储存主要的资源文件。比如xml配置文件和properties文件

> ❀ src/test/java
储存测试用的类，比如JUNIT的测试一般就放在这个目录下面
因为测试类本身实际是不属于项目的，所以放在任何一个包下都显得很尴尬，所以maven专门创建了一个测试包
用于存放测试的类

> ❀ src/test/resources 可以自己创建你，储存测试环境用的资源文件

> ❀ src
包含了项目所有的源代码和资源文件，以及其他项目相关的文件。

> ❀ target
编译后内容放置的文件夹

> ❀ pom.xml
是Maven的基础配置文件。配置项目和项目之间关系，包括配置依赖关系等等

>> 结构图：
> 
> --MavenDemo 项目名
> 
> --.idea 项目的配置，自动生成的，无需关注。
> 
> --src
> 
> -- main 实际开发内容
> 
> --java 写包和java代码，此文件默认只编译.java文件
> 
> --resource 所有配置文件。最终编译把配置文件放入到classpath中。
> 
> -- test  测试时使用，自己写测试类或junit工具等
> 
> --java 储存测试用的类
> 
> pom.xml 整个maven项目所有配置内容。

### POM模式-Maven工程关系
> Maven工具基于POM（Project Object Model，项目对象模型）模式实现的。
> 
>在Maven中每个项目都相当于是一个对象，对象（项目）和对象（项目）之间是有关系的。关系包含了：依赖、继承、聚合，实现Maven项目可以更加方便的实现导jar包、拆分项目等效果。


#### 依赖
#### 继承
#### 聚合