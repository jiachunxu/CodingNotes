
# 同源策略
> 同源策略(英文全称Same origin policy）是浏览器提供的一个安全功能。

> MDN官方给定的概念:同源策略限制了从同一个源加载的文档或脚本如何与来自另一个源的资源进行交互。这是一个用于隔离潜在恶意文件的重要安全机制。

> 通俗的理解:浏览器规定，A网站的JavaScript，不允许和非同源的网站C之间，进行资源的交互
> - 无法读取非同源网页的Cookie、LocalStorage和IndexedDB
> - 无法接触非同源网页的DOM
> - 无法向非同源地址发送Ajax请求

# 跨域
> 同源指的是两个URL的**协议、域名、端口**一致，反之，则是跨域。

> 出现跨域的根本原因:浏览器的同源策略不允许非同源的URL之间进行资源的交互。

> **注意**: 浏览器允许发起跨域请求，但是，跨域请求回来的数据，会被浏览器拦截，无法被页面获取到!

## 如何实现跨域数据请求

- JSONP: 出现的早，兼容性好（兼容低版本IE)。是前端程序员为了解决跨域问题，被迫想出来的一种临时解决方案。缺点是只支持GET请求，不支持POST请求。
- CORS: 出现的较晚，它是W3C标准，属于跨域 Ajax请求的根本解决方案。支持GET和POST请求。缺点是不兼容某些低版本的浏览器。


# JSONP 
> 由于浏览器同源策略的限制，网页中无法通过Ajax请求非同源的接口数据。但是`<script>`标签不受浏览器同源策略的影响，可以通过src属性，请求非同源的js 脚本。

> 因此，JSONP的实现原理，就是通过`<script>`标签的src属性，请求跨域的数据接口，并通过函数调用的形式,接收跨城接响市同来的数据。

> 特点：
> - JSONP 不属于真正的 Ajax 请求，因为它没有使用 XMLHttpRequest 这个对象。
> - JSONP 仅支持 GET 请求，不支持 POST、PUT、DELETE 等请求。

## JSONP 注意事项

> 如果项目中已经配置了 CORS 跨域资源共享，为了防止冲突，必须在配置 CORS 中间件之前声明 JSONP 的接口。否则JSONP 接口会被处理成开启了 CORS 的接口。

## 实现 JSONP 接口的步骤

- ① 获取客户端发送过来的回调函数的名字
- ② 得到要通过 JSONP 形式发送给客户端的数据
- ③ 根据前两步得到的数据，拼接出一个函数调用的字符串
- ④ 把上一步拼接得到的字符串，响应给客户端的 <script> 标签进行解析执行


## 简单的JSONP

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
</head>
<body>
  <script>
    function abc(data) {
      console.log('JSONP响应回来的数据是：')
      console.log(data)
    }
  </script>
  
  <script src="http://ajax.frontend.itheima.net:3006/api/jsonp?callback=abc&name=ls&age=30">
    
  </script>
</body>
</html>
```

## 在网页中使用 jQuery 发起 JSONP 请求

> 调用 $.ajax() 函数，提供 JSONP 的配置选项，从而发起 JSONP 请求

```js
$('#btnJSONP').on('click', function () {
    $.ajax({
        method: 'GET',
        url: "http:/ /127.0.0.1/api/jsonp'，
        dataType: 'jsonp',// 表示要发起JSONP的请求success
        jsonp: 'callback',//发送到服务器的参数名称, 默认值为 callback
        jsonpCallback: 'abc',//自定义回答函数名称, 默认值为 JQueryxxx
        success: function (res) {
            console.log(res)
        }
    })
})
```



# CORS

> CORS （Cross-Origin Resource Sharing，跨域资源共享）由一系列 HTTP 响应头组成，这些 HTTP 响应头决定浏览器是否阻止前端 JS 代码跨域获取资源。

> 浏览器的同源安全策略默认会阻止网页“跨域”获取资源。但如果**接口服务器配置了 CORS 相关的 HTTP 响应头**，就可以解除浏览器端的跨域访问限制。

## CORS 的注意事项

- ① CORS 主要在服务器端进行配置。客户端浏览器无须做任何额外的配置，即可请求开启了 CORS 的接口。
- ② CORS 在浏览器中有兼容性。只有支持 XMLHttpRequest Level2 的浏览器，才能正常访问开启了 CORS 的服务端接口（例如：IE10+、Chrome4+、FireFox3.5+）。


## CORS 响应头
### Access-Control-Allow-Origin

```
Access-Control-Allow-Origin: <origin> | *

 其中，origin 参数的值指定了允许访问该资源的外域 URL。
 * 表示允许来自任何域的请求
 
下面将只允许来自 http://itcast.cn 的请求	 
res.setHeader('Access-Control-Allow-Origin', 'http:/litcast.cn')
```

### Access-Control-Allow-Headers

> 默认情况下，CORS 仅支持客户端向服务器发送如下的 9 个请求头：
>
> Accept、Accept-Language、Content-Language、DPR、Downlink、Save-Data、Viewport-Width、Width 、Content-Type （值仅限于text/plain、multipart/form-data、application/x-www-form-urlencoded 三者之一）
>
> 如果客户端向服务器发送了额外的请求头信息，则需要在服务器端，通过 Access-Control-Allow-Headers 对额外 的请求头进行声明，否则这次请求会失败！

```
//允许客户端额外向服务器发送Content-Type请求头和X-Custom-Header请求头
//注意:多个请求头之间使用英文的逗号进行分割
res.setHeader('Access-Control-Allow-Headers' ,Content-Type，X-Custom-Header')
```

### Access-Control-Allow-Methods

> 默认情况下，CORS 仅支持客户端发起 GET、POST、HEAD 请求。

> 如果客户端希望通过 PUT、DELETE 等方式请求服务器的资源，则需要在服务器端，通过 Access-Control-Allow-Methods来指明实际请求所允许使用的 HTTP 方法。

```
//只允许POST、GET、DELETE、HEAD请求方法
res.setHeader('Access-Control-Allow-Methods','POST，GET，DELETE，HEAD')
//允许所有的 HTTP请求方法
res.setHeader('Access-Control-Allow-Methods', '*')
```

## CORS请求的分类

- ① 简单请求
- ② 预检请求

### 简单请求

> 同时满足以下两大条件的请求，就属于简单请求

- ① 请求方式：GET、POST、HEAD 三者之一
- ② HTTP 头部信息不超过以下几种字段：无自定义头部字段、Accept、Accept-Language、Content-Language、DPR、 Downlink、Save-Data、Viewport-Width、Width
  、Content-Type（只有三个值application/x-www-form- urlencoded、multipart/form-data、text/plain）

### 预检请求

> 只要符合以下任何一个条件的请求，都需要进行预检请求

- ① 请求方式为 GET、POST、HEAD 之外的请求 Method 类型
- ② 请求头中包含自定义头部字段
- ③ 向服务器发送了 application/json 格式的数据

> 在浏览器与服务器正式通信之前，浏览器会先发送 OPTION 请求进行预检，以获知服务器是否允许该实际请求，所以这一次的 OPTION 请求称为“预检请求”。
>
> 服务器成功响应预检请求后，才会发送真正的请求，并且携带真实数据。

### 简单请求和预检请求的区别

> 简单请求的特点：客户端与服务器之间只会发生一次请求。

> 预检请求的特点：客户端与服务器之间会发生两次请求，OPTION 预检请求成功之后，才会发起真正的请求。



# nginx反向代理