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

## 查询字符串(get请求)

> 查询字符串(URL参数）是指在URL的末尾加上用于向服务器发送信息的字符串(变量)。

> 格式:将英文的?放在URL的末尾，然后再加上**参数=值**，想加上多个参数的话，使用&符号进行分隔。将想要发送给服务器的数据添加到URL中。|

## URL编码与解码

### URL编码

> URL地址中，只允许出现英文相关的字母、标点符号、数字，因此，在URL地址中不允许出现中文字符。

> 如果URL中需要包含中文这样的字符，则必须对中文字符进行编码（转义)。

> URL编码的原则:使用安全的字符(没有特殊用途或者特殊意义的可打印字符）去表示那些不安全的字符。

> URL编码原则的通俗理解:使用英文字符去表示非英文字符。

### 编解码 API

- encodeURI()编码的函数
- decodeURI()解码的函数

```js
var str = '黑马程序员'
var str2 = encodeURI(str)
console.log(str2)

console.log('----------')
var str3 = decodeURI('%E9%BB%91%E9%A9%AC')
console.log(str3)
```

### URL编码的注意事项

> 由于浏览器会自动对URL地址进行编码操作，因此，大多数情况下，程序员不需要关心URL地址的编码与解码操作。

> 更多关于URL编码的知识(https://blog.csdn.net/Lxd_0111/article/details/78028889)

## 数据交换格式

> 数据交换格式，就是服务器端与客户端之间进行数据传输与交换的格式。

> 前端领域，经常提及的**两种**数据交换格式分别是**XML和JSON**。其中XML用的非常少，重点学习JSON。

### XML

> XML的英文全称是Extensible Markup Language，即可扩展标记语言。因此，XML和HTML类似,也是一种标记语言。

```xml

<note>
    <to>ls</to>
    <from>zs</from>
    <heading>通知</ heading>
    <body>晚上开会</body>
</note>
```

#### XML 和 HTML 的区别

> XML和HTML虽然都是标记语言，但是，它们两者之间没有任何的关系。
> - HTML被设计用来描述网页上的内容，是网页内容的载体
> - XML被设计用来传输和存储数据，是数据的载体

#### XML的缺点

- XML格式臃肿，和数据无关的代码多，体积大，传输效率低
- 在Javascript中解析XML比较麻烦

### JSON

> JSON 的英文全称是JavaScript Object Notation，即“JavaScript对象表示法”。
>
>JSON就是Javascript对象和数组的字符串表示法，它使用文本表示一个JS对象或数组的信息，因此，**JSON的本质是字符串**。

> **作用**:JSON是一种轻量级的文本数据交换格式，在作用上类似于XML，专门用于存储和传输数据，但是JSON 比XML更小、更快、更易解析。

> **现状**:JSON是在2001年开始被推广和使用的数据格式，到现今为止，JSON已经成为了主流的数据交换格式。

#### JSON的两种结构

#### 对象结构

> 对象结构在JSON中表示为{}括起来的内容。数据结构为`{key: value, key: value, ...}`
> 的键值对结构。其中，key必须是使用英文的双引号包裹的字符串，value的数据类型可以是**数字、字符串、布尔值、null、数组、对象**
> 6种类型。

#### 数组结构

> 数组结构:数组结构在JSON中表示为[]括起来的内容。数据结构为[ "java " , "javascript",30, true ... ] 。数组中数据的类型可以是
**数字、字符串、布尔值、null、数组、对象**6种类型。

#### JSON语法注意事项

- 性名必须使用双引号包裹
- 符串类型的值必须使用双引号包裹
- JSON中不允许使用单引号表示字符串
- JSON中不能写注释
- JSON的最外层必须是对象或数组格式
- **不能**使用undefined或函数作为JSON的值

---

- > JSON的作用:在计算机与网络之间存储和传输数据。
- > JSON的本质:用字符串来表示Javascript 对象数据或数组数据

---

#### JSON和JS对象的互转

- JSON 转 JS对象
  - JSON.parse()
- JS对象 转 JSON
  - JSON.stringify()

### 序列化和反序列化

> 把数据对象转换为字符串的过程，叫做序列化，例如:调用JSON.stringify()函数的操作，叫做JSON序列化。
>
> 把字符串转换为数据对象的过程，叫做反序列化，例如:调用JSON.parse()函数的操作，叫做JSON反序列化。



---

## 什么是Ajax

> Ajax的全称是Asynchronous Javascript And XML(异步JavaScript和XML)。

> 通俗的理解:在网页中利用XMLHttpRequest对象和服务器进行数据交互的方式，就是Ajax。

### Ajax的典型应用场景

- 用户名检测:注册用户时，通过ajax的形式，动态检测用户名是否被占用
- 搜索提示:当输入搜索关键字时，通过ajax的形式，动态加载搜索提示列表
- 数据分页显示:当点击页码值的时候，通过ajax的形式，根据页码值动态刷新表格的数据
- 数据的增删改查:数据的添加、删除、修改、查询操作，都需要通过ajax的形式，来实现数据的交互

## XMLHttpRequest

> XMLHttpRequest(简称xhr)是浏览器提供的Javascript对象，通过它，可以请求服务器上的数据资源。jQuery 中的Ajax函数，就是基于xhr
> 对象封装出来的。

### 使用 xhr 发起 GET 请求

- 创建xhr 对象
- 调用xhr.open()函数
- 调用xhr.send()函数
- 监听xhr.onreadystatechange事件

``` js
// 1. 创建 XHR 对象
var xhr = new XMLHttpRequest()
// 2. 调用 open 函数
xhr.open('GET', 'http://www.liulongbin.top:3006/api/getbooks?id=1')
// 3. 调用 send 函数
xhr.send()
// 4. 监听 onreadystatechange 事件
xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
        // 获取服务器响应的数据
        console.log(xhr.responseText)
    }
}
```

### xhr对象的readyState属性

> XMLHttpRequest对象的readyState属性，用来表示当前Ajax请求所处的状态。每个Ajax请求必然处于期中中的一个

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221117215539.png)

### 使用 xhr 发起 POST 请求

- 创建xhr对象
- 调用xhr.open()函数
- 设置Content-Type属性(固定写法)
- 调用xhr.send()函数，同时指定要发送的数据
- 监听xhr.onreadystatechange.事件

``` js
// 1. 创建 xhr 对象
var xhr = new XMLHttpRequest()
// 2. 调用 open 函数
xhr.open('POST', 'http://www.liulongbin.top:3006/api/addbook')
// 3. 设置 Content-Type 属性
xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
// 4. 调用 send 函数
xhr.send('bookname=水浒传&author=施耐庵&publisher=上海图书出版社')
// 5. 监听事件
xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
        console.log(xhr.responseText)
    }
}
```

## XMLHttpRequest Level2的新特性

### 旧版XMLHttpRequest的缺点

- 只支持文本数据的传输，无法用来读取和上传文件
- 传送和接收数据时，没有进度信息，只能提示有没有完成

### XMLHttpRequest Level2的新功能

- 可以设置HTTP请求的时限
- 可以使用FormData 对象管理表单数据
- 可以上传文件
- 可以获得数据传输的进度信息

### 设置HTTP请求时限

> 有时，Ajax作很耗时，而且无法预知要花多少时间。如果网速很慢，用户可能要等很久。新版本的XMLHttpRequest对象，增加了 timeout
> 属性，可以设置HTTP请求的时限

> 过了这个时限，就自动停止HTTP请求。与之配套的还有一个timeout事件

``` js
var xhr = new XMLHttpRequest()
xhr.timeout = 30
// 设置超时以后的处理函数
xhr.ontimeout = function () {
    console.log('请求超时了！')
}
xhr.open('GET', 'http://www.liulongbin.top:3006/api/getbooks')
xhr.send()
xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
        console.log(xhr.responseText)
    }
}
```

### FormData对象管理表单数据

> Ajax操作往往用来提交表单数据。为了方便表单处理，HTML5新增了一个FormData对象，可以模拟表单操作

``` js
// 1. 创建 FormData 实例
var fd = new FormData()
// 2. 调用 append 函数，向 fd 中追加数据
fd.append('uname', 'zs')
fd.append('upwd', '123456')
var xhr = new XMLHttpRequest()
xhr.open('POST', 'http://www.liulongbin.top:3006/api/formdata')
xhr.send(fd)
xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
        console.log(JSON.parse(xhr.responseText))
    }
}
```

### FormData对象获取网页表单的值

```html

<body>
<form id="form1">
    <input type="text" name="uname" autocomplete="off"/>
    <input type="password" name="upwd"/>
    <button type="submit">提交</button>
</form>
<script>
    // 1. 通过 DOM 操作，获取到 form 表单元素
    let form = document.querySelector('#form1');

    form.addEventListener('submit', function (e) {
        // 阻止表单的默认提交行为
        e.preventDefault()

        // 创建 FormData，快速获取到 form 表单中的数据
        let fd = new FormData(form);

        let xhr = new XMLHttpRequest();
        xhr.open('POST', 'http://www.liulongbin.top:3006/api/formdata')
        xhr.send(fd)

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                console.log(JSON.parse(xhr.responseText))
            }
        }
    })
</script>
</body>
```

### 上传文件

> 新版XMLHttpRequest对象，不仅可以发送文本信息，还可以上传文件。

- 定义UI结构
- 验证是否选择了文件
- 向FormData中追加文件
- 使用xhr发起上传文件的请求
- 监听onreadystatechange事件

``` js
// 1. 获取到文件上传按钮
var btnUpload = document.querySelector('#btnUpload')
// 2. 为按钮绑定单击事件处理函数
btnUpload.addEventListener('click', function () {
    // 3. 获取到用户选择的文件列表
    var files = document.querySelector('#file1').files
    if (files.length <= 0) {
        return alert('请选择要上传的文件！')
    }
    var fd = new FormData()
    // 将用户选择的文件，添加到 FormData 中
    fd.append('avatar', files[0])
    var xhr = new XMLHttpRequest()
    xhr.open('POST', 'http://www.liulongbin.top:3006/api/upload/avatar')
    xhr.send(fd)
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var data = JSON.parse(xhr.responseText)
            if (data.status === 200) {
                // 上传成功
                document.querySelector('#img').src = 'http://www.liulongbin.top:3006' + data.url
            } else {
                // 上传失败
                console.log('图片上传失败！' + data.message)
            }
        }
    }
})
```

### 显示上传进度

> 新版本的XMLHttpRequest对象中，可以通过监听xhr.upload.onprogress,事件，来获取到文件的上传进度。

``` js
// 创建 XHR 对象
var xhr = new XMLHttpRequest()
// 监听 xhr.upload 的 onprogress 事件
xhr.upload.onprogress = function (e) {
    // e.lengthComputable 是一个布尔值，表示当前上传的资源是否具有可计算的长度
    if (e.lengthComputable) {
        // e.loaded 已传输的字节
        // e.total  需传输的总字节
        var percentComplete = Math.ceil((e.loaded / e.total) * 100)
    }
}
```

## jQuery中的Ajax

> 浏览器中提供的XMLHttpRequest用法比较复杂，所以jQuery对 XMLHttpRequest进行了封装，提供了-系列Ajax相关的函数，极大地降低了Ajax的使用难度。

> jQuery 中发起Ajax请求最常用的三个方法如下:
>
> - $.get()
> - $.post()
> - $.ajax()

### $.get()

`$.get (ur1, [data], [callback])`

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221117212245.png)

### $.post()

`$.post (ur1,[data] , [callback])`

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221117212612.png)

### $.ajax()

> 相比于$.get()和$.post()函数，jQuery中提供的$.ajax()函数，是一个功能比较综合的函数，它允许我们对Ajax请求进行更详细的配置。

``` js
$.ajax({
    type: '', //请求的方式，例如 GET 或 POST
    url: '', //请求URL地址
    data: {}, //请求携带数据
    success: function (res) {
    } //请求成功回调函数
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

## axios

> Axios是专注于网络数据请求的库。

> 相比于原生的XMLHttpRequest 对象，axios简单易用。

> 相比于jQuery，axios更加轻量化，只专注于网络数据请求。

### axios发起GET请求

`axios.get('url', { params: { /*参数*/ } }).then(callback)`

``` js
var url = 'http://www.liulongbin.top:3006/api/get'
var paramsObj = {name: 'zs', age: 20}
axios.get(url, {params: paramsObj}).then(function (res) {
    console.log(res.data)
})
```

### axios发起POST请求

` axios.post('url', { /*参数*/ }).then(callback)`

``` js
 //   请求的 URL 地址
var url = 'http://www.liulongbin.top:3006/api/post'
//   要提交到服务器的数据
var dataObj = {location: '北京', address: '顺义'}
//   调用 axios.post() 发起 POST 请求
axios.post(url, dataObj).then(function (res) {
    //   res.data 是服务器返回的数据
    var result = res.data
    console.log(result)
})
```

### 直接使用axios发起请求

``` js
 axios({
        method: '请求类型',
        url: '请求的URL地址',
        data:/*POST数据*/
    },
    params : { /*GET参数*/ }
})
.then(callback)
```

示例

``` js
document.querySelector('#btn3').addEventListener('click', function () {
    var url = 'http://www.liulongbin.top:3006/api/get'
    var paramsData = {name: '钢铁侠', age: 35}
    axios({
        method: 'GET',
        url: url,
        params: paramsData
    }).then(function (res) {
        console.log(res.data)
    })
})

document.querySelector('#btn4').addEventListener('click', function () {
    axios({
        method: 'POST',
        url: 'http://www.liulongbin.top:3006/api/post',
        data: {
            name: '娃哈哈',
            age: 18,
            gender: '女'
        }
    }).then(function (res) {
        console.log(res.data)
    })
})
```

### 使用 await async简化使用 axios

``` js
document.querySelector('#btnGET').addEventListener('click', async function () {
    /* 
    axios.get('url地址', {
      // GET 参数
      params: {}
    })
     */

    const {data: res} = await axios.get('http://www.liulongbin.top:3006/api/getbooks', {
        params: {id: 1}
    })
    console.log(res)
})

document.querySelector('#btnPOST').addEventListener('click', async function () {
    // axios.post('url', { /* POST 请求体数据 */ })
    const {data: res} = await axios.post('http://www.liulongbin.top:3006/api/post', {name: 'zs', gender: '女'})
    console.log(res)
})
```

# 节流和防抖

## 防抖

> 防抖策略(debounce)是当事件被触发后，延迟 n秒后再执行回调，如果在这n秒内事件又被触发，则重新计时。

> 实现方法: 每次新操作,清除定时器

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221117235601.png)

## 节流

> 节流策略(throttle)，顾名思义，可以减少一段时间内事件的触发频率。

> 实现方法: 判断节流定时器是否存在,存在,不操作


![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221117235711.png)

### 节流阀

> 节流阀为空，表示可以执行下次操作;不为空，表示不能执行下次操作。
>
> 当前操作执行完，必须将节流阀重置为空，表示可以执行下次操作了。
>
> 每次执行操作前，必须先判断节流阀是否为空。

### 防抖和节流的区别

- 防抖:如果事件被频繁触发，防抖能保证只有最有一次触发生效!前面N多次的触发都会被忽略!
- 节流:如果事件被频繁触发，节流能够减少事件触发的频率，因此，节流是有选择性地执行一部分事件!
