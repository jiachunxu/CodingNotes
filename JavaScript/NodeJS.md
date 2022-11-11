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

  























