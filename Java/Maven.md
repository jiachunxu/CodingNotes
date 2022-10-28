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

> 【1】POM工程 POM工程是逻辑工程。用在父级工程或聚合工程中。用来做jar包的版本控制。

> 【2】JAR工程 将会打包成jar，用作jar包使用。即常见的本地工程 ---> Java Project。

> 【3】WAR工程 将会打包成war，发布在服务器上的工程。

### Maven项目结构

> ❀ src/main/java 这个目录下储存java源代码

> ❀ src/main/resources 储存主要的资源文件。比如xml配置文件和properties文件

> ❀ src/test/java 储存测试用的类，比如JUNIT的测试一般就放在这个目录下面 因为测试类本身实际是不属于项目的，所以放在任何一个包下都显得很尴尬，所以maven专门创建了一个测试包 用于存放测试的类

> ❀ src/test/resources 可以自己创建你，储存测试环境用的资源文件

> ❀ src 包含了项目所有的源代码和资源文件，以及其他项目相关的文件。

> ❀ target 编译后内容放置的文件夹

> ❀ pom.xml 是Maven的基础配置文件。配置项目和项目之间关系，包括配置依赖关系等等

> > 结构图：
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
> -- test 测试时使用，自己写测试类或junit工具等
>
> --java 储存测试用的类
>
> pom.xml 整个maven项目所有配置内容。

### POM模式-Maven工程关系

> Maven工具基于POM（Project Object Model，项目对象模型）模式实现的。
>
>在Maven中每个项目都相当于是一个对象，对象（项目）和对象（项目）之间是有关系的。关系包含了：依赖、继承、聚合，实现Maven项目可以更加方便的实现导jar包、拆分项目等效果。

#### 依赖

- 【1】依赖关系：
  > 即A工程开发或运行过程中需要B工程提供支持，则代表A工程依赖B工程。 在这种情况下，需要在A项目的pom.xml文件中增加下属配置定义依赖关系。

  > 通俗理解：就是导jar包。

  > B工程可以是自己的项目打包后的jar包，也可以是中央仓库的jar包。


- 【2】如何注入依赖呢？
  > 在pom.xml文件 根元素project下的 dependencies标签中，配置依赖信息，内可以包含多个 dependence元素，以声明多个依赖。每个依赖dependence标签都应该包含以下元素：groupId, artifactId, version


- 【3】依赖的好处：

  > 省去了程序员手动添加jar包的操作，省事！！

  > 可以帮我们解决jar包冲突问题：

---

- 依赖的传递性
  > 传递性依赖是Maven2.0的新特性。

  > 假设你的项目依赖于一个库，而这个库又依赖于其他库。Maven会隐式的把这些库间接依赖的库也加入到你的项目中。

  > 这个特性是靠解析从远程仓库中获取的依赖库的项目文件实现的。一般的，这些项目的所有依赖都会加入到项目中，或者从父项目继承，或者通过传递性依赖。

  > 如果A依赖了B，那么C依赖A时会自动把A和B都导入进来。
- 两个原则
    - (1)第一原则：最短路径优先原则
      > “最短路径优先”意味着项目依赖关系树中路径最短的版本会被使用。

      > 例如，假设A、B、C之间的依赖关系是A->B->C->D(2.0)  和A->E->(D1.0)，那么D(1.0)会被使用，因为A通过E到D的路径更短。
    - (2)第二原则：最先声明原则
      > 依赖路径长度是一样的的时候，第一原则不能解决所有问题，

      > 在maven2.0.8及之前的版本中，这是不确定的，但是maven2.0.9开始，为了尽可能避免构建的不确定性，在POM中依赖声明的顺序决定了谁会被解析使用。顺序最靠前的那个依赖优胜。

- 排除依赖
  > exclusions： 用来排除传递性依赖,可配置多个exclusion标签，每个exclusion标签里面对应的有groupId, artifactId, version三项基本元素。注意：不用写版本号。

- 依赖范围
    - compile
      > 这是默认范围。如果没有指定，就会使用该依赖范围。表示该依赖在编译和运行时都生效。
    - provided
      > 已提供依赖范围。编译和测试项目的时候需要该依赖，但在运行项目的时候，剔除。

    - runtime
      > runtime范围表明编译时不需要生效，而只在运行时生效。
    - system
      > 系统范围与provided类似，显式指定一个本地系统路径的JAR，此类依赖应该一直有效，Maven不会去仓库中寻找。但是，使用system范围依赖时必须通过systemPath元素显式地指定依赖文件的路径。
    - test
      > test范围表明使用此依赖范围的依赖，只在编译测试代码和运行测试的时候需要，应用的正常运行不需要此类依赖。
    - import
      > import范围只适用于pom文件中的<dependencyManagement>部分。表明指定的POM必须使用<dependencyManagement>部分的依赖。 注意：import只能用在dependencyManagement的scope里。

#### 继承

> 如果A工程继承B工程，则代表A工程默认依赖B工程依赖的所有资源，且可以应用B工程中定义的所有资源信息。

> 被继承的工程（B工程）只能是POM工程。

> 注意：在父项目中放在<dependencyManagement>中的内容时不被子项目继承，不可以直接使用,放在<dependencyManagement>中的内容主要目的是进行版本管理。里面的内容在子项目中依赖时坐标只需要填写<group id>和<artifact id>即可。（注意：如果子项目不希望使用父项目的版本，可以明确配置version）。

#### 聚合

> 当我们开发的工程拥有2个以上模块的时候，每个模块都是一个独立的功能集合。开发的时候每个平台都可以独立编译，测试，运行。这个时候我们就需要一个聚合工程。

> 在创建聚合工程的过程中，总的工程必须是一个POM工程（Maven Project）（聚合项目必须是一个pom类型的项目，jar项目war项目是没有办法做聚合工程的），各子模块可以是任意类型模块（Maven Module）。

> 前提：继承。 聚合包含了继承的特性。

> 聚合时多个项目的本质还是一个项目。这些项目被一个大的父项目包含。且这时父项目类型为pom类型。同时在父项目的pom.xml中出现<modules>表示包含的所有子模块。

> 总项目：一般总项目：POM项目

### 常见插件

#### 编译器插件

> 【1】 settings.xml文件中配置全局编译器插件： 找到profiles节点，在里面加入profile节点：

```xml

<profile>
    <!-- 定义的编译器插件ID，全局唯一，名字随便起 -->
    <id>jdk-1.7</id>
    <!-- 插件标记，activeByDefault ：true默认编译器，jdk提供编译器版本 -->
    <activation>
        <activeByDefault>true</activeByDefault>
        <jdk>1.7</jdk>
    </activation>
    <!-- 配置信息source-源信息，target-字节码信息，compilerVersion-编译过程版本 -->
    <properties>
        <maven.compiler.source>1.7</maven.compiler.source>
        <maven.compiler.target>1.7</maven.compiler.target>
        <maven.compiler.compilerVersion>1.7</maven.compiler.compilerVersion>
    </properties>
</profile>
```

> 【2】配置编译器插件：pom.xml配置片段

```xml
<!-- 配置maven的编译插件 -->
<build>
    <plugins>
        <!--JDK编译插件 -->
        <plugin>
            <!--插件坐标 -->
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.2</version>
            <!-- -->
            <configuration>
                <!-- 源代码使用JDK版本-->
                <source>1.7</source>
                <!-- 源代码编译为class文件的版本，要保持跟上面版本一致-->
                <target>1.7</target>
                <encoding>UTF-8</encoding>
            </configuration>
        </plugin>
    </plugins>
</build>
```

#### 资源拷贝插件

> Maven在打包时默认只将src/main/resources里的配置文件拷贝到项目中并做打包处理，而非resource目录下的配置文件在打包时不会添加到项目中。

> 我现在想把非resources下面的文件也打包到classes下面配置：

```xml

<build>
    <resources>
        <resource>
            <directory>src/main/java</directory>
            <includes>
                <include>**/*.xml</include>
            </includes>
        </resource>
        <resource>
            <directory>src/main/resources</directory>
            <includes>
                <include>**/*.xml</include>
                <include>**/*.properties</include>
            </includes>
        </resource>
    </resources>
</build>
```

### 常见命令

- mvn install
  > 本地安装， 包含编译，打包，安装到本地仓库
- mvn clean
  > 清除已编译信息。删除工程中的target目录。
- mvn compile
  > 只编译。 javac命令
- mvn package
  > 打包。 包含编译，打包两个功能。

---
> install和package的区别：


> package命令完成了项目编译、单元测试、打包功能，但没有把打好的可执行jar包（war包或其它形式的包）布署到本地maven仓库和远程maven私服仓库

> install命令完成了项目编译、单元测试、打包功能，同时把打好的可执行jar包（war包或其它形式的包）布署到本地maven仓库，但没有布署到远程maven私服仓库