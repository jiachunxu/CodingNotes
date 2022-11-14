# 什么是 CORS

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

# JSONP 接口

> 概念：浏览器端通过 `<script>` 标签的 src 属性，请求服务器上的数据，同时，服务器返回一个函数的调用。这种请求数据的方式叫做 JSONP。

> 特点：
> - ① JSONP 不属于真正的 Ajax 请求，因为它没有使用 XMLHttpRequest 这个对象。
> - ② JSONP 仅支持 GET 请求，不支持 POST、PUT、DELETE 等请求。

## JSONP 注意事项

> 如果项目中已经配置了 CORS 跨域资源共享，为了防止冲突，必须在配置 CORS 中间件之前声明 JSONP 的接口。否则JSONP 接口会被处理成开启了 CORS 的接口。

## 实现 JSONP 接口的步骤

- ① 获取客户端发送过来的回调函数的名字
- ② 得到要通过 JSONP 形式发送给客户端的数据
- ③ 根据前两步得到的数据，拼接出一个函数调用的字符串
- ④ 把上一步拼接得到的字符串，响应给客户端的 <script> 标签进行解析执行

```js
app.get('/api/jsonp', (req, res) => {

    // 1．获取客户端发送过来的回调函数的名字const
    funcName = req.query.callback1l
    // 2．得到要通过JSONP形式发送给客户端的数据const
    data = {name: 'zs', age: 22}
    // 3．根据前两步得到的数据，拼接出一个函数调用的字符串
    const scriptstr = `${funcName}(${JSON.stringify(data)})`
    // 4．把上一步拼接得到的字符串，响应给客户端的 < script > 标签进行解析执行
    res.send(scriptstr)
})
```

## 在网页中使用 jQuery 发起 JSONP 请求

> 调用 $.ajax() 函数，提供 JSONP 的配置选项，从而发起 JSONP 请求

```js
$('#btnJSONP').on('click', function () {
    $.ajax({
        method: 'GET',
        url: "http:/ /127.0.0.1/api/jsonp'，
        dataType: 'jsonp',// 表示要发起JSONP的请求success
        success: function (res) {
            console.log(res)
        }
    })
})
```

# nginx反向代理