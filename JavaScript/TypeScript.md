# TypeScript

> TypeScript（简称：TS）是 JavaScript 的超集（JS 有的 TS 都有）。
>
> TypeScript = Type + JavaScript（在 JS 基础之上，为 JS 添加了类型支持）。
>
> TypeScript 是微软开发的开源编程语言，可以在任何运行 JavaScript 的地方运行。

## TypeScript 初体验

### 安装编译TS 的工具包

> npm i -g typescript

### 验证是否安装成功：

> tsc –v（查看typescript 的版本）

### 编译并运行 TS 代码

- 创建 hello.ts 文件（注意：TS 文件的后缀名为 .ts）。
- 将 TS 编译为 JS：在终端中输入命令，`tsc hello.ts`（此时，在同级目录中会出现一个同名的 JS 文件）。
- 执行 JS 代码：在终端中输入命令，`node hello.js`。

> 注意：由TS 编译生成的 JS 文件，代码中就没有类型信息了。

### 简化运行TS 的步骤

> 问题描述：每次修改代码后，都要重复执行两个命令，才能运行 TS 代码，太繁琐。

> 简化方式：使用 ts-node 包，直接在 Node.js 中执行 TS 代码。

> 安装命令：npm i -g ts-node（ts-node 包提供了 ts-node 命令）。

> 使用方式：ts-node hello.ts。

> 解释：ts-node 命令在内部偷偷的将TS -> JS，然后，再运行 JS 代码。

# TypeScript 常用类型

## JS 已有类型

- 原始类型：number / string / boolean / null / undefined / symbol。
- 对象类型：object（包括，数组、对象、函数等对象）。

``` ts
let age: number = 18

let myName: string = '刘老师'

let isLoading: boolean = false

let a: null = null

let b: undefined = undefined

let s: symbol = Symbol()
```

### 数组类型

``` ts
let numbers: number[] = [1, 3, 5]
let numbers1: Array<number> = [1, 3, 5]
let b: boolean[] = [true, false]
// 联合类型：
// 添加小括号，表示：首先是数组，然后，这个数组中能够出现 number 或 string 类型的元素
let arr: (number | string)[] = [1, 3, 5, 'a', 'b']

// 不添加小括号，表示：arr1 既可以是 number 类型，又可以是 string[]
let arr1: number | string[] = ['a', 'b']
let arr2: number | string[] = 123
```

### 函数类型

``` ts
// 1. 单独指定参数、返回值类型：

function add1(num1: number, num2: number): number {
    return num1 + num2
}

const add2 = (num1: number, num2: number): number => {
    return num1 + num2
}


//2. 同时指定参数、返回值类型：
const add: (num1: number, num2: number) => number = (num1, num2) => {
    return num1 + num2
}

// void
function greet(name: string): void {
    console.log('Hello', name)
}


// 可选参数
function mySlice(start: number, end?: number): void {
    console.log('起始索引：', start, '结束索引：', end)
}
```

### 对象类型

``` ts
let person1: { name: string; age: number; sayHi(): void; greet(name: string): void } = {
    name: '刘老师',
    age: 18,
    sayHi() {
    },
    greet(name) {
    }
}

let person: {
    name: string
    age: number
    // sayHi(): void
    sayHi: () => void
    greet(name: string): void
} = {
    name: '刘老师',
    age: 18,
    sayHi() {
    },
    greet(name) {
    }
}

// 对象可选属性
function myAxios(config: { url: string; method?: string }) {
}

myAxios({
    url: ''
})

```

## TS 新增类型

- 联合类型、自定义类型（类型别名）、接口、元组、字面量类型、枚举、void、any 等。

### 联合类型

``` ts
let arr: (number | string)[] = [1, 3, 5, 'a', 'b']
```

### 类型别名

``` ts
type CustomArray = (number | string)[]

let arr: CustomArray = [1, 3, 5, 'a', 'b']
let arr1: CustomArray = [1, 'x', 2, 'y']
```

### 接口

``` ts
let person0: { name: string; age: number; sayHi(): void } = {
    name: '刘老师',
    age: 18,
    sayHi() {
    }
}

let person1: { name: string; age: number; sayHi(): void }


interface IPerson {
    name: string
    age: number

    sayHi(): void
}

let person: IPerson = {
    name: '刘老师',
    age: 18,
    sayHi() {
    }
}
```

### 接口 vs 类型别名

``` ts
// 接口：
interface IPerson {
    name: string
    age: number

    sayHi(): void
}

// 类型别名
type IPerson = {
    name: string
    age: number
    sayHi(): void
}

let person: IPerson = {
    name: '刘老师',
    age: 18,
    sayHi() {
    }
}
```

### 接口继承

``` ts
interface Point2D {
    x: number
    y: number
}

// interface Point3D { x: number; y: number; z: number }

// 使用 继承 实现复用：
interface Point3D extends Point2D {
    z: number
}

let p3: Point3D = {
    x: 1,
    y: 0,
    z: 0
}
```

### 元组

> 元组类型可以确切地标记出有多少个元素，以及每个元素的类型

``` ts
let position: [number, string] = [39, '114']
```

### 字面量类型

> 使用模式：字面量类型配合联合类型一起使用。
>
> 使用场景：用来表示一组明确的可选值列表。

``` ts
let str1 = 'Hello TS'

const str2: 'Hello TS' = 'Hello TS'

let age: 18 = 18

function changeDirection(direction: 'up' | 'down' | 'left' | 'right') {
}

changeDirection('left')
```

### 枚举

> 注意：枚举成员是有值的，默认为：从 0 开始自增的数值。

> 字符串枚举必须指定初始值

``` ts
enum Direction {
    Up,
    Down,
    Left,
    Right
}

// 数字枚举
enum Direction {
    Up = 10,
    Down,// 11
    Left, // 12
    Right //13
}

enum Direction {
    Up = 2,
    Down = 4,
    Left = 8,
    Right = 16
}

// 字符串枚举：
enum Direction {
    Up = 'UP',
    Down = 'DOWN',
    Left = 'LEFT',
    Right = 'RIGHT'
}

function changeDirection(direction: Direction) {
}

changeDirection(Direction.Left)
```

### 枚举原理

``` js
var Direction;
(function (Direction) {
    Direction["Up"] = "UP";
    Direction["Down"] = "DOWN";
    Direction["Left"] = "LEFT";
    Direction["Right"] = "RIGHT";
})(Direction || (Direction = {}));

function changeDirection(direction) {
}

changeDirection(Direction.Up);

```

### any 类型

> 原则：不推荐使用any！这会让 TypeScript 变为 “AnyScript”（失去 TS 类型保护的优势）

> 具有 any 类型的情况：
>
> 1 声明变量不提供类型也不提供默认值
>
> 2 函数参数不加类型。

> 注意：因为不推荐使用 any，所以，这两种情况下都应该提供类型！

``` ts
let obj: any = {x: 0}

// 访问不存在的属性 或者 赋值
// obj.aaa
// obj.aaa = 10

// 当作函数调用
// obj()

// 赋值给其他类型的变量
// let n: number = obj

// --

// let a
// a = 1
// a = ''
// a()

// function add(num1, num2) {}
// add(1, 2)
// add(1, '2')
// add(1, false)
```

## typeof

``` ts
console.log(typeof 'Hello TS') // string

let p = {x: 1, y: 2}

function formatPoint(point: typeof p) {
}

// function formatPoint(point: { x: number; y: number }) {}
formatPoint({x: 1, y: 100})

// --

let num: typeof p.x

function add(num1: number, num2: number) {
    return num1 + num2
}

let ret: typeof add(1, 2)
```

## 类型推论

> 在 TS 中，某些没有明确指出类型的地方，TS 的类型推论机制会帮助提供类型。

> 发生类型推论的 2 种常见场景
>
> 1 声明变量并初始化时
>
> 2 决定函数返回值时。

``` ts
// 声明变量并立即初始化值，此时，可以省略类型注解
let age = 18

// age = ''

// 注意：如果声明变量但没有立即初始化值，此时，还必须手动添加类型注解
let a: number

a = 19

// a = ''

function add(num1: number, num2: number) {
    return num1 + num2
}

add(1, 3)

console.log('object')
```

## 类型断言

> 有时候你会比TS 更加明确一个值的类型，此时，可以使用类型断言来指定更具体的类型。

> getElementById 方法返回值的类型是 HTMLElement，该类型只包含所有标签公共的属性或方法，不包含a标签特有的 href 等属性。
>
> 因此，这个类型太宽泛（不具体），无法操作href 等 a 标签特有的属性或方法。

> 解决方式：这种情况下就需要使用类型断言指定更加具体的类型。

- 使用as关键字实现类型断言。
- 关键字as 后面的类型是一个更加具体的类型（HTMLAnchorElement 是HTMLElement 的子类型）。
- 通过类型断言，aLink 的类型变得更加具体，这样就可以访问a 标签特有的属性或方法了。
- 另一种语法，使用 <> 语法，这种语法形式不常用知道即可

``` ts
const aLink = document.getElementById('link') as HTMLAnchorElement
const aLink2 = <HTMLAnchorElement>document.getElementById('link')
aLink.href
```

> 技巧：在浏览器控制台，通过console.dir() 打印DOM 元素，在属性列表的最后面，即可看到该元素的类型。
























































