# ES6 模块化

## 回顾：node.js 中如何实现模块化

> node.js 遵循了 CommonJS 的模块化规范。
>
> - 导入其它模块使用 require() 方法
> - 模块对外共享成员使用 module.exports 对象

## 前端模块化规范的分类

> 在 ES6 模块化规范诞生之前，JavaScript 社区已经尝试并提出了 AMD、CMD、CommonJS 等模块化规范。

> 这些由社区提出的模块化标准，还是存在一定的差异性与局限性、并不是浏览器与服务器通用的模块化标准，

- AMD 和 CMD 适用于浏览器端的 Javascript 模块化
- CommonJS 适用于服务器端的 Javascript 模块化

> 太多的模块化规范给开发者增加了学习的难度与开发的成本。因此，大一统的 ES6 模块化规范诞生了！

## ES6 模块化规范

> ES6 模块化规范是浏览器端与服务器端通用的模块化开发规范。

> ES6 模块化规范中定义：
>
> - 每个 js 文件都是一个独立的模块
> - 导入其它模块成员使用 import 关键字
> - 向外共享模块成员使用 export 关键字

### 在 node.js 中体验 ES6 模块化

> node.js 中默认仅支持 CommonJS 模块化规范，若想基于 node.js 体验与学习 ES6 的模块化语法，可以按照如下两个步骤进行配置：
>
> - 确保安装了 v14.15.1 或更高版本的 node.js
> - 在 package.json 的根节点中添加 "type": "module" 节点

### ES6 模块化的基本语法

> ES6 的模块化主要包含如下 3 种用法：
>
> - 默认导出与默认导入
> - 按需导出与按需导入
> - 直接导入并执行模块中的代码

#### 默认导出

> 默认导出的语法： export default 默认导出的成员

```js
let n1 = 10
let n2 = 20

function show() {
}

export default {
    n1,
    show
}
```

#### 默认导入

> 默认导入的语法： import 接收名称 from '模块标识符'

```js
import m1 from './01.默认导出.js'

console.log(m1)
```

#### 默认导出的注意事项

> 每个模块中，只允许使用唯一的一次 export default，否则会报错！

#### 默认导入的注意事项

> 默认导入时的接收名称可以任意名称，只要是合法的成员名称即可

#### 按需导出

> 按需导出的语法： export 按需导出的成员

```js
export let s1 = 'aaa'
export let s2 = 'ccc'

export function say() {
}

export default {
    a: 20
}
```

#### 按需导入

> 按需导入的语法： import { s1 } from '模块标识符'

> 可用 as 重命名

```js
import info, {s1, s2 as str2, say} from './03.按需导出.js'

console.log(s1)
console.log(str2)
console.log(say)
console.log(info)
```

#### 按需导出与按需导入的注意事项

- 每个模块中可以使用多次按需导出
- 按需导入的成员名称必须和按需导出的名称保持一致
- 按需导入时，可以使用 as 关键字进行重命名
- 按需导入可以和默认导入一起使用

#### 直接导入并执行模块中的代码

> 如果只想单纯地执行某个模块中的代码，并不需要得到模块中向外共享的成员。此时，可以直接导入并执行模块代码

```js
import './05.直接运行模块中的代码.js'
```

# Promise

## 回调地狱

> 在回调函数中写回调函数

> 多层回调嵌套

## 如何解决回调地狱的问题

> 为了解决回调地狱的问题，ES6（ECMAScript 2015）中新增了 Promise 的概念。

## Promise 的基本概念

- Promise 是一个构造函数
  - 我们可以创建 Promise 的实例 const p = new Promise()
  - new 出来的 Promise 实例对象，代表一个异步操作
- Promise.prototype 上包含一个 .then() 方法
  - 每一次 new Promise() 构造函数得到的实例对象，
  - 都可以通过原型链的方式访问到 .then() 方法，例如 p.then()
- .then() 方法用来预先指定成功和失败的回调函数
  - p.then(成功的回调函数，失败的回调函数)
  - p.then(result => { }, error => { })
  - 调用 .then() 方法时，成功的回调函数是必选的、失败的回调函数是可选的

### 基于 then-fs 读取文件内容

> 由于 node.js 官方提供的 fs 模块仅支持以回调函数的方式读取文件，不支持 Promise 的调用方式。
>
> 因此，需要先运行如下的命令，安装 then-fs 这个第三方包，从而支持我们基于 Promise 的方式读取文件的内容

```npm
npm install then-fs
```

### then-fs 的基本使用

> 调用 then-fs 提供的 readFile() 方法，可以异步地读取文件的内容，它的返回值是 Promise 的实例对象。
>
> 因此可以调用 .then() 方法为每个 Promise 异步操作指定成功和失败之后的回调函数。

```js
// 无法保证文件的读取顺序
import thenFs from 'then-fs'

thenFs.readFile('./files/1.txt', 'utf8').then((r1) => {
    console.log(r1)
})
thenFs.readFile('./files/2.txt', 'utf8').then((r2) => {
    console.log(r2)
})
thenFs.readFile('./files/3.txt', 'utf8').then((r3) => {
    console.log(r3)
})
```

### .then() 方法的特性

> 如果上一个 .then() 方法中返回了一个新的 Promise 实例对象，则可以通过下一个 .then() 继续进行处理。
>
> 通过 .then() 方法的链式调用，就解决了回调地狱的问题。

### 基于 Promise 按顺序读取文件的内容

```js
import thenFs from 'then-fs'

thenFs
    .readFile('./files/11.txt', 'utf8')
    .catch((err) => {
        console.log(err.message)
    })
    .then((r1) => {
        console.log(r1)
        return thenFs.readFile('./files/2.txt', 'utf8')
    })
    .then((r2) => {
        console.log(r2)
        return thenFs.readFile('./files/3.txt', 'utf8')
    })
    .then((r3) => {
        console.log(r3)
    })

```

















































































































































