# Ajax

## 服务器
> 上网过程中，负责存放和对外提供资源的电脑，叫做服务器。

## 客户端
> 上网过程中，负责获取和消费资源的电脑，叫做客户端。

## URL地址
> URL(全称是UniformResourceLocator)中文叫统一资源定位符，用于标识互联网上每个资源的唯一存放位置。

> 浏览器只有通过URL地址，才能正确定位资源的存放位置，从而成功访问到对应的资源。

### URL地址的组成部分
- 客户端与服务器之间的通信协议
- 存有该资源的服务器名称
- 资源在服务器上具体的存放位置

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221117210010.png)

## 客户端与服务器的通信过程

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221117210312.png)

注意
- 客户端与服务器之间的通信过程，分为请求-处理-响应三个步骤。
- 网页中的每一个资源，都是通过请求–处理-响应的方式从服务器获取回来的。

## 服务器对外提供的资源
- 文字内容
- image 图片
- audio 音频
- video 视频
- 数据

### 数据是网页的灵魂
- HTML是网页的骨架
- cSS是网页的颜值
- Javascript是网页的行为
- 数据，则是网页的灵魂

> 骨架、颜值、行为皆为数据服务

> 数据，在网页中无处不在


### 网页中如何请求数据

- 如果要在网页中请求服务器上的数据资源，则需要用到XMLHttpRequest对象。
- XMLHttpRequest(简称xhr）是浏览器提供的js成员，通过它，可以请求服务器上的数据资源。
- 最简单的用法var xhrObj = new XMLHttpRequest())


## 什么是Ajax

> Ajax的全称是Asynchronous Javascript And XML(异步JavaScript和XML)。

> 通俗的理解:在网页中利用XMLHttpRequest对象和服务器进行数据交互的方式，就是Ajax。







