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














































