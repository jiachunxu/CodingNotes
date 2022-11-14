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