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

### Ajax的典型应用场景

- 用户名检测:注册用户时，通过ajax的形式，动态检测用户名是否被占用
- 搜索提示:当输入搜索关键字时，通过ajax的形式，动态加载搜索提示列表
- 数据分页显示:当点击页码值的时候，通过ajax的形式，根据页码值动态刷新表格的数据
- 数据的增删改查:数据的添加、删除、修改、查询操作，都需要通过ajax的形式，来实现数据的交互

### jQuery中的Ajax
> 浏览器中提供的XMLHttpRequest用法比较复杂，所以jQuery对 XMLHttpRequest进行了封装，提供了-系列Ajax相关的函数，极大地降低了Ajax的使用难度。

> jQuery 中发起Ajax请求最常用的三个方法如下:
>
> - $.get()
> - $.post()
> - $.ajax()

#### $.get()
`$.get (ur1, [data], [callback])`

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221117212245.png)

#### $.post()

`$.post (ur1,[data] , [callback])`

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221117212612.png)

#### $.ajax()
> 相比于$.get()和$.post()函数，jQuery中提供的$.ajax()函数，是一个功能比较综合的函数，它允许我们对Ajax请求进行更详细的配置。

```js
$.ajax({
    type: '', //请求的方式，例如 GET 或 POST
    url: '', //请求URL地址
    data: { }, //请求携带数据
    success: function (res) { } //请求成功回调函数
})
```

## 接口
> 使用Ajax请求数据时，被请求的URL地址，就叫做数据接口(简称接口)。同时，每个接口必须有请求方式。

### 接口测试工具

- [PostMan](https://www.postman.com/downloads/)
- [Apifox](https://www.apifox.cn/)
- [Apipost](https://www.apipost.cn/)

### 接口文档
> 接口文档，顾名思义就是接口的说明文档，它是我们调用接口的依据。好的接口文档包含了对接口URL，参数以及输出内容的说明，我们参照接口文档就能方便的知道接口的作用，以及接口如何进行调用。


#### 妾口文档的组成部分
- 接口名称:用来标识各个接口的简单说明，如登录接口，获取图书列表接口等。
- 接口URL:接口的调用地址。
- 调用方式:接口的调用方式，如GET或 POST。
- 参数格式:接口需要传递的参数，每个参数必须包含参数名称、参数类型、是否必选、参数说明这4项内容。
- 响应格式:接口的返回值的详细描述，一般包含数据名称、数据类型、说明3项内容。
- 返回示例(可选)∶通过对象的形式，例举服务器返回数据的结构。
