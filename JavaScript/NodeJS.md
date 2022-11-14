# NodeJS

> Node.js 是一个基于 Chrome V8 引擎的 JavaScript 运行环境。

[NodeJS官网]( https://nodejs.org/zh-cn/)

# NodeJS 作用

- 基于 [Express](http://www.expressjs.com.cn/) 框架，可以快速构建 Web 应用
- 基于 [Electron](https://electronjs.org/) 框架，可以构建跨平台的桌面应用
- 基于 [restify](http://restify.com/) 框架，可以快速构建 API 接口项目
- 读写和操作数据库、创建实用的命令行工具辅助前端开发、etc…

# Node 命令

- node –v
  > 查看版本号

# fs 文件系统模块

> fs 模块是 Node.js 官方提供的、用来操作文件的模块。

## 导入fs模块

```js
const fs = require('fs')
```

## fs的方法

### fs.readFile()

> fs.readFile(path[, options], callback)

> 参数1：读取文件的存放路径
>
> 参数2：读取文件时候采用的编码格式，一般默认指定 utf8
>
> 参数3：回调函数，拿到读取失败和成功的结果 err  dataStr

```js
const fs = require('fs')

fs.readFile('./files/11.txt', 'utf8', function (err, dataStr) {
    if (err) {
        return console.log('读取文件失败！' + err.message)
    }
    console.log('读取文件成功！' + dataStr)
})
```

### fs.writeFile()

> fs.writeFile(file,data[, options], callback)

> 参数1：必选参数，需要指定一个文件路径的字符串，表示文件的存放路径。
>
> 参数2：必选参数，表示要写入的内容
>
> 参数3：可选参数，表示以什么格式写入文件内容，默认值是 utf8。
>
> 参数4：必选参数，文件写入完成后的回调函数。

```js
const fs = require('fs')

fs.writeFile('./files/3.txt', 'ok123', function (err) {

    if (err) {
        return console.log('文件写入失败！' + err.message)
    }
    console.log('文件写入成功！')
})
```

# path 路径模块

> path 模块是 Node.js 官方提供的、用来处理路径的模块。

## 导入 path 模块

```js
const fs = require('path')
```

## path 的方法

> __dirname 表示当前文件所处的目录

### path.join([...paths])

> 用来将多个路径片段拼接成一个完整的路径字符串

> 返回值: string

```js
const path = require('path')
const fs = require('fs')

//注意：  ../ 会抵消前面的路径
const pathStr = path.join('/a', '/b/c', '../', './d', 'e')
console.log(pathStr)  // \a\b\d\e

fs.readFile(__dirname + '/files/1.txt')

fs.readFile(path.join(__dirname, './files/1.txt'), 'utf8', function (err, dataStr) {
    if (err) {
        return console.log(err.message)
    }
    console.log(dataStr)
})
```

> **注意**：涉及到路径拼接的操作，都要使用 path.join() 方法进行处理。不要直接使用 + 进行字符串的拼接。

### path.basename()

> 用来从路径字符串中，将文件名解析出来

> path.basename(path[, ext])

> path： string 必选参数，表示一个路径的字符串
>
> ext： string 可选参数，表示文件扩展名
>
> 返回：string 表示路径中的最后一部分

```js
const path = require('path')

const fpath = '/a/b/c/index.html'

const fullName = path.basename(fpath)
console.log(fullName) //index.html

const nameWithoutExt = path.basename(fpath, '.html')
console.log(nameWithoutExt) // index
```

### path.extname()

> 可以获取路径中的扩展名部分

---

# http 模块

```js
// 1. 导入 http 模块
const http = require('http')
// 2. 创建 web 服务器实例
const server = http.createServer()
// 3. 为服务器实例绑定 request 事件，监听客户端的请求
server.on('request', function (req, res) {
    console.log('Someone visit our web server.')
})
// 4. 启动服务器
server.listen(8080, function () {
    console.log('server running at http://127.0.0.1:8080')
})
```

## req请求对象

```js
const http = require('http')
const server = http.createServer()
// req 是请求对象，包含了与客户端相关的数据和属性
server.on('request', (req, res) => {
    // req.url 是客户端请求的 URL 地址
    const url = req.url
    // req.method 是客户端请求的 method 类型
    const method = req.method
    const str = `Your request url is ${url}, and request method is ${method}`
    console.log(str)
    // 调用 res.end() 方法，向客户端响应一些内容
    res.end(str)
})
server.listen(80, () => {
    console.log('server running at http://127.0.0.1')
})
```

- req.url
  > req.url 是客户端请求的 URL 地址

- req.method
  > req.method 是客户端请求的 method 类型

## res响应对象

- res.end([str])
  > 调用 res.end() 方法，向客户端响应一些内容

### 解决中文乱码

> res.setHeader('Content-Type', 'text/html; charset=utf-8')


---

# 模块化

> 模块化是指解决一个复杂问题时，自顶向下逐层把系统划分成若干模块的过程。对于整个系统来说，模块是可组合、分解和更换的单元。


> 编程领域中的模块化，就是遵守固定的规则，把一个大文件拆成独立并互相依赖的多个小模块。


> 把代码进行模块化拆分的好处：

> - ① 提高了代码的复用性
> - ② 提高了代码的可维护性
> - ③ 可以实现按需加载

## 模块化规范

> 模块化规范就是对代码进行模块化的拆分与组合时，需要遵守的那些规则。

> **模块化规范的好处**：大家都遵守同样的模块化规范写代码，降低了沟通的成本，极大方便了各个模块之间的相互调用，利人利己。

### Node.js 中的模块化规范

> Node.js 遵循了 CommonJS 模块化规范，CommonJS 规定了模块的特性和各模块之间如何相互依赖。

> CommonJS 规定：
>  - ① 每个模块内部，module 变量代表当前模块。
>  - ② module 变量是一个对象，它的 exports 属性（即 module.exports）是对外的接口。
>  - ③ 加载某个模块，其实是加载该模块的 module.exports 属性。require() 方法用于加载模块。

## Node.js 中模块的分类

- 内置模块（内置模块是由 Node.js 官方提供的，例如 fs、path、http 等）
- 自定义模块（用户创建的每个 .js 文件，都是自定义模块）
- 第三方模块（由第三方开发出来的模块，并非官方提供的内置模块，使用前需要先下载

### 加载模块

> require([str])

> **注意**：使用 require() 方法加载其它模块时，会执行被加载模块中的代码。

### 模块作用域

> 和函数作用域类似，在自定义模块中定义的变量、方法等成员，只能在当前模块内被访问，这种模块级别的访问限制，叫做模块作用域。

#### 模块作用域的好处

> 防止了全局变量污染的问题

### 向外共享模块作用域中的成员

#### module 对象

> 里面存储了和当前模块有关的信息

```
Module{
  id: '.',
  path: '路径(不包括文件名)',
  exports: {
  },
  filename: '全路径名',
  loaded: false,
  children: [],
  paths: []
}
```

#### module.exports 对象

> 在自定义模块中，可以使用 module.exports 对象，将模块内的成员共享出去，供外界使用。

> 外界用 require() 方法导入自定义模块时，得到的就是 module.exports 所指向的对象。

#### 共享成员时的注意点

> 使用 require() 方法导入模块时，导入的结果，永远以 module.exports 指向的对象为准。

#### exports 对象

> 由于 module.exports 比较复杂，为了简化向外共享成员的代码，Node 提供了 exports 对象。

> exports 和 module.exports 指向同一个对象。最终共享的结果，还是以 module.exports 指向的对象为准。

> **注意**：为了防止混乱，建议不要在同一个模块中同时使用 exports 和 module.exports

## npm与包

### 包

> Node.js 中的第三方模块又叫做包。

### 包下载

[npm官网](https://www.npmjs.com/)

[下载地址](https://registry.npmjs.org/)

	//npm 版本
	npm -v
	
	//npm安装包命令
	npm install 包名称
	//简写
	npm i 包名称
	// 安装指定版本的包, 通过 @ 符号指定具体的版本
	npm i moment @2.22.2

### 初次装包

> 在项目文件夹下多一个叫做 node_modules 的文件夹和 package-lock.json 的配置文件

> **node_modules** 文件夹用来存放所有已安装到项目中的包。require() 导入第三方包时，就是从这个目录中查找并加载包。

> **package-lock.json** 配置文件用来记录 node_modules 目录下的每一个包的下载信息，例如包的名字、版本号、下载地址等。

### 包的语义化版本规范

> 包的版本号是以“点分十进制”形式进行定义的，总共有三位数字，例如 2.24.0
> - 第1位数字：大版本
> - 第2位数字：功能版本
> - 第3位数字：Bug修复版本

### 包管理配置文件

> package.json

> 记录与项目有关的一些配置信息。例如：
> - 项目的名称、版本号、描述等
> - 项目中都用到了哪些包
> - 哪些包只在**开发期间**会用到
> - 那些包在**开发和部署时**都需要用到

> **注意**：今后在项目开发中，一定要把 node_modules 文件夹，添加到 .gitignore 忽略文件中

#### 快速创建 package.json

`npm init -y`


> 注意：
> - 上述命令只能在英文的目录下成功运行！所以，项目文件夹的名称一定要使用英文命名，不要使用中文，不能出现空格。
> - 运行 `npm install` 命令安装包的时候，npm 包管理工具会自动把包的名称和版本号，记录到package.json 中。

#### dependencies 节点

> 专门用来记录您使用 `npm install` 命令安装了哪些包。

#### 一次性安装所有的包

`npm install`

`npm i`

#### 卸载包

`npm uninstall`

> **注意**：npm uninstall 命令执行成功后，会把卸载的包，自动从 package.json 的 dependencies 中移除掉。

#### 切换镜像

> [淘宝镜像网站](https://www.npmmirror.com/)

	//全局设置
	//查看当前的下包镜像源
	npm config get registry
	//将下包的镜像源切换为淘宝镜像源
	npm config set registry=https://registry.npmmirror.com
	//检查镜像源是否下载成功
	npm config get registry
	
	
	//或者
	//单次使用
	npm install 包名--registry=https://registry.npmmirror.com

#### nrm

> 可以快速查看和切换下包的镜像源。

> npm i nrm -g
> //全局安装nrm工具

> `nrm ls`
> 参看所有可用镜像

> `npm use taobao`  
> 切taobao换镜像源

#### 包的分类

- 项目包
  > 安装到项目的 node_modules 目录中的包
	- 开发依赖包(被记录到 devDependencies 节点中的包，只在开发期间会用到)
	- 核心依赖包(被记录到 dependencies 节点中的包，在开发期间和项目上线之后都会用到)

> `npm i 包名 -D` //开发依赖包 devDependencies 节点中的包

> `npm i 包名`    //核心依赖包 dependencies 节点中的包

- 全局包

> 在执行 `npm install` 命令时，如果提供了 -g 参数，则会把包安装为全局包。

> 全局包会被安装到 C:\Users\用户目录\AppData\Roaming\npm\node_modules 目录下。


`npm i 包名 -g        `

`npm uninstall 包名 -g `


> 注意：
> - ① 只有工具性质的包，才有全局安装的必要性。因为它们提供了好用的终端命令。
> - ② 判断某个包是否需要全局安装后才能使用，可以参考官方提供的使用说明即可。

### 规范的包结构

- ① 包必须以单独的目录而存在
- ② 包的顶级目录下要必须包含 package.json 这个包管理配置文件
- ③ package.json 中必须包含 name，version，main 这三个属性，分别代表包的名字、版本号、包的入口

### 编写包的文档说明

> 包根目录中的 README.md 文件，是包的使用说明文档。

> 包含以下项内容：安装方式、导入方式、方法说明、开源协议

## 发布包

- 注册账号
- 登录 npm 账号
  > npm login

> **注意**: 包服务器必须为官方服务器

- 包发布
  > npm publish
- 删除已发布的包
  > npm unpublish 包名 --force

> 注意：
> - ① npm unpublish 命令只能删除 72 小时以内发布的包
> - ② npm unpublish 删除的包，在 24 小时内不允许重复发布
> - ③ 发布包的时候要慎重，尽量不要往 npm 上发布没有意义的包！

## 模块的加载机制

### 优先从缓存中加载

> 模块在第一次加载后会被缓存。 这也意味着多次调用 require() 不会导致模块的代码被执行多次。

> **注意**：不论是内置模块、用户自定义模块、还是第三方模块，它们都会优先从缓存中加载，从而提高模块的加载效率。

### 内置模块的加载机制

> 内置模块是由 Node.js 官方提供的模块，内置模块的加载优先级最高。

> 例如，require('fs') 始终返回内置的 fs 模块，即使在 node_modules 目录下有名字相同的包也叫做 fs。

### 自定义模块的加载机制

> 使用 require() 加载自定义模块时，必须指定以 ./ 或 ../ 开头的路径标识符。在加载自定义模块时，如果没有指定 ./ 或 ../这样的路径标识符，则 node 会把它当作内置模块或第三方模块进行加载。


> 同时，在使用 require() 导入自定义模块时，如果省略了文件的扩展名，则 Node.js 会按顺序分别尝试加载以下的文件：
> - ① 按照确切的文件名进行加载
> - ② 补全 .js 扩展名进行加载
> - ③ 补全 .json 扩展名进行加载
> - ④ 补全 .node 扩展名进行加载
> - ⑤ 加载失败，终端报错

### 第三方模块的加载机制

> 如果传递给 require() 的模块标识符不是一个内置模块，也没有以 ‘./’ 或 ‘../’ 开头，则 Node.js 会从当前模块的父目录开始，尝试从 /node_modules 文件夹中加载第三方模块。

> 如果没有找到对应的第三方模块，则移动到再上一层父目录中，进行加载，直到文件系统的根目录

```js
//例如，假设在
//'C:\Users\itheima\project\foo.js'
//文件里调用了require('tools')，则Node.js会按以下顺序查找：
// ① C:\Users\itheima\project\node_modules\tools
// ② C:\Users\itheima\node_modules\tools
// ③ C:\Users\node_modules\tools
// ④ C:\node_modules\tools
```

### 目录作为模块

> 当把目录作为模块标识符，传递给 require() 进行加载的时候，有三种加载方式：
> - 在被加载的目录下查找一个叫做 package.json 的文件，并寻找 main 属性，作为 require() 加载的入口
> - 如果目录里没有 package.json 文件，或者 main 入口不存在或无法解析，则 Node.js 将会试图加载目录下的 index.js 文件。
> - 如果以上两步都失败了，则 Node.js 会在终端打印错误消息，报告模块的缺失：Error: Cannot find module 'xxx'

# Express

> Express 是基于 Node.js 平台，快速、开放、极简的 Web 开发框架。

## 安装

`npm i express@4.17.1`

## 创建基本的 Web 服务器

```js
// 1. 导入 express
const express = require('express')
// 2. 创建 web 服务器
const app = express()
// 3. 启动 web 服务器
//调用app.listen(端口号，启动成功后的回调函数)，启动服务器
app.listen(80, () => {
    console.log('express server running at http://127.0.0.1')
})

```

## 监听请求

```js
app.get('请求URL', function (req, res) {
    /*处理函数*/
})

app.post('请求URL', function (req, res) {
    /*处理函数*/
})

```

## 响应内容

> res.send([响应内容])

```js
// 监听客户端的 GET 和 POST 请求，并向客户端响应具体的内容
app.get('/user', (req, res) => {
    // 调用 express 提供的 res.send() 方法，向客户端响应一个 JSON 对象
    res.send({name: 'zs', age: 20, gender: '男'})
})
```

## 获取 URL 中携带的查询参数

> 通过 req.query 对象，可以访问到客户端通过查询字符串的形式，发送到服务器的参数

```js
app.get('/', (req, res) => {
    // 通过 req.query 可以获取到客户端发送过来的 查询参数
    // 注意：默认情况下，req.query 是一个空对象
    console.log(req.query)
    res.send(req.query)
})
```

## 获取 URL 中的动态参数

> 通过 req.params 对象，可以访问到 URL 中，通过 : 匹配到的动态参数

```js
// 注意：这里的 :id 是一个动态的参数
app.get('/user/:ids/:username', (req, res) => {
    // req.params 是动态匹配到的 URL 参数，默认也是一个空对象
    console.log(req.params)
    res.send(req.params)
})
```

## 托管静态资源

> express.static()

> 通过如下代码就可以将 public 目录下的图片、CSS 文件

```js
app.use(express.static('public'))
```

> **注意**：Express 在指定的静态目录中查找文件，并对外提供资源的访问路径。因此，存放静态文件的目录名不会出现在 URL 中。

### 托管多个静态资源目录

> 托管多个静态资源目录,请多次调用 express.static() 函数
>
> 访问静态资源文件时，express.static() 函数会根据目录的添加顺序查找所需的文件。

## nodemon

[nodemon官网](https://www.npmjs.com/package/nodemon)
> 当代码被修改后，nodemon 会自动帮我们重启项目，极大方便了开发和调试。

### 安装nodemon

`npm install -g nodemon`

### 使用 nodemon

`nodemon app.js`

## Express 路由

> 在 Express 中，路由指的是客户端的请求与服务器处理函数之间的映射关系。

`app.METHOD(PATH，HANDLER)`

> 路由匹配的注意点：
> - ① 按照定义的先后顺序进行匹配
> - ② 请求类型和请求的URL同时匹配成功，才会调用对应的处理函数

### 简单路由

```js
const express = require('express')
const app = express()

// 挂载路由
app.get('/', (req, res) => {
    res.send('hello world.')
})
app.post('/', (req, res) => {
    res.send('Post Request.')
})

app.listen(80, () => {
    console.log('http://127.0.0.1')
})
```

### 模块化路由

> 为了方便对路由进行模块化的管理，Express 不建议将路由直接挂载到 app 上，推荐将路由抽离为单独的模块。
>
> - ① 创建路由模块对应的 .js 文件
> - ② 调用 express.Router() 函数创建路由对象
> - ③ 向路由对象上挂载具体的路由
> - ④ 使用 module.exports 向外共享路由对象
> - ⑤ 使用 app.use() 函数注册路由模块

```js
//这是路由模块
// 1. 导入 express
const express = require('express')
// 2. 创建路由对象
const router = express.Router()
// 3. 挂载具体的路由
router.get('/user/list', (req, res) => {
    res.send('Get user list.')
})
router.post('/user/add', (req, res) => {
    res.send('Add new user.')
})
// 4. 向外导出路由对象
module.exports = router
```

```js
const express = require('express')
const app = express()
// 1. 导入路由模块
const router = require('./03.router')
// 2. 注册路由模块
app.use('/api', router)
// 注意： app.use() 函数的作用，就是来注册全局中间件
app.listen(80, () => {
    console.log('http://127.0.0.1')
})
```

## 什么是Express 中间件

> 中间件（Middleware ），特指业务流程的中间处理环节

> Express 的中间件，本质上就是一个 function 处理函数

> **注意**：中间件函数的形参列表中，必须包含 next 参数。而路由处理函数中只包含 req 和 res。

```js
const mw = function (req, res, next) {
    //中间逻辑
    next();
}
```

### next 函数的作用

> next 函数是实现多个中间件连续调用的关键，它表示把流转关系转交给下一个中间件或路由

### 全局生效的中间件

> 通过调用 app.use(中间件函数)，即可定义一个全局生效的中间件

```js
// 定义一个最简单的中间件函数
const mw = function (req, res, next) {
    console.log('这是最简单的中间件函数')
    // 把流转关系，转交给下一个中间件或路由
    next()
}

// 将 mw 注册为全局生效的中间件
app.use(mw)
```

### 中间件的作用

> 多个中间件之间，共享同一份 req 和 res。基于这样的特性，我们可以在上游的中间件中，统一为 req 或 res对象添加自定义的属性或方法，供下游的中间件或路由进行使用。


> 可以使用 app.use() 连续定义多个全局中间件。客户端请求到达服务器之后，会按照中间件定义的先后顺序依次进行调用

### 局部生效的中间件

> 不使用 app.use() 定义的中间件，叫做局部生效的中间件

```js
// 导入 express 模块
const express = require('express')
// 创建 express 的服务器实例
const app = express()
// 1. 定义中间件函数
const mw1 = (req, res, next) => {
    console.log('调用了局部生效的中间件')
    next()
}
// 2. 创建路由
app.get('/', mw1, (req, res) => {
    res.send('Home page.')
})
app.get('/user', (req, res) => {
    res.send('User page.')
})
// 调用 app.listen 方法，指定端口号并启动web服务器
app.listen(80, function () {
    console.log('Express server running at http://127.0.0.1')
})
```

### 定义多个局部中间件

```js
app.get('/', [mw1, mw2], (req, res) => {
    res.send('Home page.')
})
//两种等价
app.get('/', mw1, mw2, (req, res) => {
    res.send('Home page.')
})
```

### 中间件的5个使用注意事项

- ① 一定要在路由之前注册中间件
- ② 客户端发送过来的请求，可以连续调用多个中间件进行处理
- ③ 执行完中间件的业务代码之后，不要忘记调用 next() 函数
- ④ 为了防止代码逻辑混乱，调用 next() 函数后不要再写额外的代码
- ⑤ 连续调用多个中间件时，多个中间件之间，共享 req 和 res 对象

### 中间件的分类

> 为了方便大家理解和记忆中间件的使用，Express 官方把常见的中间件用法，分成了 5 大类，分别是：
> - ① 应用级别的中间件
> - ② 路由级别的中间件
> - ③ 错误级别的中间件
> - ④ Express 内置的中间件
> - ⑤ 第三方的中间件

#### 应用级别的中间件

> 通过 app.use() 或 app.get() 或 app.post() ，绑定到 app 实例上的中间件，叫做应用级别的中间件

#### 路由级别的中间件

> 绑定到 express.Router() 实例上的中间件，叫做路由级别的中间件。它的用法和应用级别中间件没有任何区别。只不过，应用级别中间件是绑定到 app 实例上，路由级别中间件绑定到 router 实例上

```js
var app = express()
var router = express.Router()
// 路由级别的中间件
router.use(function (req, res, next) {
    console.log('Time: ', Date.now())
    next()
}
app.use('/', router)
```

#### 错误级别的中间件

> 专门用来捕获整个项目中发生的异常错误，从而防止项目异常崩溃的问题

> **格式**：错误级别中间件的 function 处理函数中，必须有 4 个形参，形参顺序从前到后，分别是 (err, req, res, next)。

> **注意**：错误级别的中间件，必须注册在所有路由之后！

```js
//定义错误级别的中间件，捕获整个项目的异常错误，从而防止程序的崩溃
app.use((err, req, res, next) => {
    console.log('发生了错误！' + err.message)
    res.send('Error：' + err.message)
})
```

#### Express 内置的中间件

> 自 Express 4.16.0 版本开始，Express 内置了 3 个常用的中间件，极大的提高了 Express 项目的开发效率和体验：
> - ① express.static 快速托管静态资源的内置中间件，例如： HTML 文件、图片、CSS 样式等（无兼容性）
> - ② express.json 解析 JSON 格式的请求体数据（有兼容性，仅在 4.16.0+ 版本中可用）
> - ③ express.urlencoded 解析 URL-encoded 格式的请求体数据（有兼容性，仅在 4.16.0+ 版本中可用）

```js
const express = require('express')
const app = express()
// 注意：除了错误级别的中间件，其他的中间件，必须在路由之前进行配置
// 通过 express.json() 这个中间件，解析表单中的 JSON 格式的数据
app.use(express.json())
// 通过 express.urlencoded() 这个中间件，来解析 表单中的 url-encoded 格式的数据
app.use(express.urlencoded({extended: false}))

app.post('/user', (req, res) => {
    // 在服务器，可以使用 req.body 这个属性，来接收客户端发送过来的请求体数据
    // 默认情况下，如果不配置解析表单数据的中间件，则 req.body 默认等于 undefined
    console.log(req.body)
    res.send('ok')
})
app.post('/book', (req, res) => {
    // 在服务器端，可以通过 req,body 来获取 JSON 格式的表单数据和 url-encoded 格式的数据
    console.log(req.body)
    res.send('ok')
})
app.listen(80, function () {
    console.log('Express server running at http://127.0.0.1')
})
```

#### 第三方的中间件

> 非 Express 官方内置的，而是由第三方开发出来的中间件，叫做第三方中间件。在项目中，大家可以按需下载并配置第三方中间件，从而提高项目的开发效率。

> 例如：在 express@4.16.0 之前的版本中，经常使用 body-parser 这个第三方中间件，来解析请求体数据。使用步骤如下：

> - ① 运行 npm install body-parser 安装中间件
> - ② 使用 require 导入中间件
> - ③ 调用 app.use() 注册并使用中间件
>
> **注意**：Express 内置的 express.urlencoded 中间件，就是基于 body-parser 这个第三方中间件进一步封装出来的。

### 自定义解析表单数据的中间件

```js
const express = require('express')
const app = express()
// 导入 Node.js 内置的 querystring 模块
const qs = require('querystring')
// 这是解析表单数据的中间件
app.use((req, res, next) => {
    // 定义中间件具体的业务逻辑
    // 1. 定义一个 str 字符串，专门用来存储客户端发送过来的请求体数据
    let str = ''
    // 2. 监听 req 的 data 事件
    req.on('data', (chunk) => {
        str += chunk
    })
    // 3. 监听 req 的 end 事件
    req.on('end', () => {
        // 在 str 中存放的是完整的请求体数据
        // TODO: 把字符串格式的请求体数据，解析成对象格式
        const body = qs.parse(str)
        req.body = body
        next()
    })
})
app.post('/user', (req, res) => {
    res.send(req.body)
})
app.listen(80, function () {
    console.log('Express server running at http://127.0.0.1')
})
```

## CORS 跨域资源共享

> 解决接口跨域问题的方案主要有两种：
> - ① CORS（主流的解决方案，推荐使用）
> - ② JSONP（有缺陷的解决方案：只支持 GET 请求）

### 使用 cors 中间件解决跨域问题

> cors 是 Express 的一个第三方中间件。通过安装和配置 cors 中间件，可以很方便地解决跨域问题。

> - ① 运行 npm install cors 安装中间件
> - ② 使用 const cors = require('cors') 导入中间件
> - ③ 在路由之前调用 app.use(cors()) 配置中间件

# 什么是 CORS

> CORS （Cross-Origin Resource Sharing，跨域资源共享）由一系列 HTTP 响应头组成，这些 HTTP 响应头决定浏览器是否阻止前端 JS 代码跨域获取资源。

> 浏览器的同源安全策略默认会阻止网页“跨域”获取资源。但如果**接口服务器配置了 CORS 相关的 HTTP 响应头**，就可以解除浏览器端的跨域访问限制。

### CORS 的注意事项

- ① CORS 主要在服务器端进行配置。客户端浏览器无须做任何额外的配置，即可请求开启了 CORS 的接口。
- ② CORS 在浏览器中有兼容性。只有支持 XMLHttpRequest Level2 的浏览器，才能正常访问开启了 CORS 的服务端接口（例如：IE10+、Chrome4+、FireFox3.5+）。

### CORS 响应头部 - Access-Control-Allow-Origin

```
Access-Control-Allow-Origin: <origin> | *

 其中，origin 参数的值指定了允许访问该资源的外域 URL。
 * 表示允许来自任何域的请求
 
下面将只允许来自 http://itcast.cn 的请求	 
res.setHeader('Access-Control-Allow-Origin', 'http:/litcast.cn')
```

### CORS 响应头部 - Access-Control-Allow-Headers

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

### CORS 响应头部 - Access-Control-Allow-Methods

> 默认情况下，CORS 仅支持客户端发起 GET、POST、HEAD 请求。

> 如果客户端希望通过 PUT、DELETE 等方式请求服务器的资源，则需要在服务器端，通过 Access-Control-Alow-Methods来指明实际请求所允许使用的 HTTP 方法。

```
//只允许POST、GET、DELETE、HEAD请求方法
res.setHeader('Access-Control-Allow-Methods','POST，GET，DELETE，HEAD')
//允许所有的 HTTP请求方法
res.setHeader('Access-Control-Allow-Methods', '*')
```

##  CORS请求的分类
- ① 简单请求
- ② 预检请求

### 简单请求
> 同时满足以下两大条件的请求，就属于简单请求
- ① 请求方式：GET、POST、HEAD 三者之一
- ② HTTP 头部信息不超过以下几种字段：无自定义头部字段、Accept、Accept-Language、Content-Language、DPR、
  Downlink、Save-Data、Viewport-Width、Width 、Content-Type（只有三个值application/x-www-form-
  urlencoded、multipart/form-data、text/plain）

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












