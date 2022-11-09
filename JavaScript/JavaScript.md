# 初识 JavaScript

- JS 的组成
    - ECMAScript(JavaScript语法)
    - DOM(页面文档对象模型)
    - BOM(浏览器对象模型)


- ECMAScript

> ECMAScript 是由ECMA 国际（ 原欧洲计算机制造商协会）进行标准化的一门编程语言，这种语言在万维网上应用广泛，它往往被称为 JavaScript(网景公司) 或 JScript(微软公司)，但实际上后两者是 ECMAScript 语言的实现和扩展。

> ECMAScript：ECMAScript 规定了JS的编程语法和基础核心知识，是所有浏览器厂商共同遵守的一套JS语法工业标准。

> [MDN](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/JavaScript_technologies_overview)

- DOM ——文档对象模型

> 文档对象模型（Document Object Model，简称DOM），是W3C组织推荐的处理可扩展标记语言的标准编程接口。 通过 DOM 提供的接口可以对页面上的各种元素进行操作（大小、位置、颜色等）。

- BOM ——浏览器对象模型

> BOM (Browser Object Model，简称BOM) 是指浏览器对象模型，它提供了独立于内容的、可以与浏览器窗口进行互动的对象结构。通过BOM可以操作浏览器窗口，比如弹出框、控制浏览器跳转、获取分辨率等。


---

## JS 有3种书写位置，分别为行内、内嵌和外部。

- 行内式 JS

```html
<input type="button" value="点我试试" onclick="alert('Hello World')"/>
```

> 注意单双引号的使用：在HTML中我们推荐使用双引号, JS 中我们推荐使用单引号

- 内嵌 JS

```html

<script>
    alert('Hello World~!');
</script>
```

- 外部 JS文件

```html

<script src="my.js"></script>
```

> 引用外部 JS文件的 script 标签中间不可以写代码

---

## 注释

- 单行注释

```javascript
    // 用来注释单行文字
```

- 多行注释

```js
    /*
    多行注释
    多行注释
    */
```

---

## 输出语句

|  方法   | 说明  |归属  |
|  ----  | ----  |----  |
| alert(msg)  | 浏览器弹出警示框 |浏览器 |
| console.log(msg)  | 浏览器控制台打印输出信息 |浏览器 |
| prompt(info)  | 浏览器弹出输入框，用户可以输入 |浏览器 |

> **注意**：alert() 主要用来显示消息给用户，console.log() 用来给程序员自己看运行时的消息。

---

# 变量

- 声明变量

```js
    var age; // 声明一个 名称为age 的变量
```

> **var** 是一个 JS关键字，用来声明变量( variable 变量的意思 )。使用该关键字声明变量后，计算机会自动为变量分配内存空间，不需要程序员管

- 赋值

```js
    age = 10; // 给 age 这个变量赋值为 10
```

- 变量的初始化

```js
    var age = 18; // 声明变量同时赋值为 18
```

- 更新变量

```js
    var age = 18;
age = 81; // 最后的结果就是81因为18 被覆盖掉了
```

- 同时声明多个变量

```js
    var age = 10, name = 'zs', sex = 2;
```

## 声明变量特殊情况

|  情况   | 说明  |结果  |
|  ----  | ----  |----  |
|var age ; console.log (age);| 只声明 不赋值 |undefined |
| console.log(age)  | 不声明 不赋值 直接使用 |报错 |
|age = 10; console.log (age);|不声明 只赋值 |10 |

- 变量命名规范
    - 由字母(A-Za-z)、数字(0-9)、下划线(_)、美元符号( $ )组成
    - 严格区分大小写
    - 不能以数字开头
    - 不能 是关键字、保留字
    - 变量名必须有意义
    - 遵守驼峰命名法(小驼峰)

---

# 数据类型

> JavaScript 是一种弱类型或者说动态语言

## JS 把数据类型分为两类：

- 简单数据类型 （Number,String,Boolean,Undefined,Null）
- 复杂数据类型 （Object)

## 简单数据类型（基本数据类型）

|简单数据类型|说明|默认值|
|---|---|---|
|Number|数字型,包含整型值和浮点型值，如21、0.21|0|
|Boolean|布尔值类型，如true. false，等价于1和0|false|
|String|字符串类型，如"张三”|""|
|Undefined|var a;声明了变量a但是没有给值|undefined|
|Null|var a = null;声明了变量a为空值|null|

### 数字型 Number

- **数字型进制**

> 最常见的进制有二进制、八进制、十进制、十六进制

```js
    // 1.八进制数字序列范围：0~7
var num1 = 07; // 对应十进制的7
var num2 = 01
9; // 对应十进制的19
var num3 = 0
8; // 对应十进制的8
// 2.十六进制数字序列范围：0~9以及A~F
var num = 0xA;
```

> 在JS中八进制前面加0，十六进制前面加 0x

- **数字型范围**

    - 最大值：`Number.MAX_VALUE`，这个值为： 1.7976931348623157e+308
    - 最小值：`Number.MIN_VALUE`，这个值为：5e-32


- **数字型三个特殊值**

    - `Infinity` : 大于任何数值
    - `-Infinity` : 小于任何数值
    - `NaN` : Not a number，代表一个非数值

- **isNaN()**

> 用来判断一个变量是否为非数字的类型，返回 true 或者 false

> **isNaN(x)**   :    `x是数字返回false,x不是数字返回true`

### 字符串型 String

> 字符串型可以是引号中的任意文本，其语法为 双引号 "" 和 单引号''

> HTML 标签里面的属性使用的是双引号，**JS** 这里我们更**推荐使用单引号**。

- 字符串引号嵌套
  > JS 可以用单引号嵌套双引号 ，或者用双引号嵌套单引号 (外双内单，外单内双)

- 字符串转义符
  > 转义符都是 \ 开头的，常用的转义符及其说明如下：

|转义符|解释说明|
|---|---|
|\n|换行, n 是 newline 的意思|
|\\|斜杠 \|
|\'|' 单引号|
|\"|" 双引号|
|\t|tab 缩进|
|\b|空格 ，b 是 blank的意思|

- 字符串长度
  > 通过字符串的 **length 属性**可以获取整个字符串的长度

```js
var strMsg = "我是帅气多金的程序猿！"
alert(strMsg.length); // 显示 11
````

- 字符串拼接
    - 多个字符串之间可以使用 + 进行拼接，**字符串 + 任何类型 = 拼接之后的新字符串**
    - 拼接前会把与字符串相加的任何类型转成字符串，再拼接成一个新的字符串

### 布尔型 Boolean

> 布尔类型有两个值：true 和 false

> 布尔型和数字型相加的时候， true 的值为 1 ，false 的值为 0。

```js
console.log(true + 1); // 2
console.log(false + 1); // 1
```

### Undefined 和 Null

> 一个声明后没有被赋值的变量会有一个默认值 undefined

```js
var variable;
console.log(variable); // undefined
console.log('你好' + variable); // 你好undefined
console.log(11 + variable); // NaN
console.log(true + variable); // NaN
```

> 一个声明变量给 null 值，里面存的值为空

```js
var vari = null;
console.log('你好' + vari); // 你好null
console.log(11 + vari); // 11
console.log(true + vari); // 1
```

### 获取检测变量的数据类型

> **typeof** 可用来获取检测变量的数据类型

```js
var num = 18;
console.log(typeof num) // 结果 number

console.log(typeof undefined) // 结果 "undefined"
console.log(typeof null) // 结果 "object"
```

## 数据类型转换

- **转换为字符串类型**
- **转换为数字型**
- **转换为布尔型**

### 转换为字符串

- toString()

  > var num= 1; alert(num.toString());

- String()

  > var num= 1; alert(String(num));

- 加号拼接(隐式转换)

  > var num =1; alert(num+"我是字符串");

### 转换为数字型

|方式|案例|
|---|---|
|pareInt(string)|pareInt('78')|
|pareFloat(string)|pareFloat('78.12')|
|Number(string)|Number('12')|
|js隐式转化(-,*,/)|'12'-0|

### 转换为布尔型

> Boolean()函数 例如:Boolean('true')

- 代表空、否定的值会被转换为 false ，如 ''、0、NaN、null、undefined
- 其余值都会被转换为 true

```js
console.log(Boolean('')); // false
console.log(Boolean(0)); // false
console.log(Boolean(NaN)); // false
console.log(Boolean(null)); // false
console.log(Boolean(undefined)); // false
console.log(Boolean('小白')); // true
console.log(Boolean(12)); // true
```

---

# 运算符

## 算数运算符

> +, -, *, /, %

> ++, --

## 比较运算符

> <, >, >=, <=

> !=, ==, ===

- ==
  > 默认转换数据类型 会把字符串型的数据转换为数字型 只要求值相等就可以

- ===
  > 要求 两侧的值 还有 数据类型完全一致才可以 true

## 逻辑运算符

- &&
- ||
- !

## 赋值运算符

- =
- -=, +=, *=,/=

### 三元表达式

> 条件表达式 ？ 表达式1 ： 表达式2

> 条件表达式结果为真 则 返回 表达式1 的值 如果条件表达式结果为假 则返回 表达式2 的值

## 数组

### 创建数组

```js
var arr = new Array();
var arr = [];
var arr = [1, 2, 'pink老师', true];
```

### 数组长度

> 数组名.length

```js
var arr = [1, 2, 'pink老师', true];
console.log(arr.length)
```

### 遍历数组

```js
var arr = ['关羽', '张飞', '马超', '赵云', '黄忠', '刘备', '姜维', 'pink'];

for (var i = 0; i < arr.length; i++) {
    console.log(arr[i]);
}
```

### 新增数组元素

- 修改length长度

```js
var arr = ['red', 'green', 'blue'];
console.log(arr.length);
arr.length = 5; // 把我们数组的长度修改为了 5  里面应该有5个元素 
console.log(arr);
console.log(arr[3]); // undefined
console.log(arr[4]); // undefined
```

- 修改索引号 追加数组元素

```js
var arr1 = ['red', 'green', 'blue'];
arr1[3] = 'pink';
console.log(arr1);
arr1[4] = 'hotpink';
console.log(arr1);
arr1[0] = 'yellow'; // 这里是替换原来的数组元素
console.log(arr1);
arr1 = '有点意思';
console.log(arr1); // 不要直接给 数组名赋值 否则里面的数组元素都没有了
```

### 数组方法

- pop()
  > 从数组中删除最后一个元素，并返回该元素的值。此方法会更改数组的长度。

- push()
  > 将一个或多个元素添加到数组的末尾，并返回该数组的新长度。

---

# 函数

## 函数定义

```js
function 函数名([参数列表]) {
    //函数内部语句

    return 返回值;//返回值可有可无
}
```

## 函数调用

> 函数名()

## 函数形参实参个数匹配

- 如果实参的个数和形参的个数一致 则正常输出结果

- 如果实参的个数多于形参的个数 会取到形参的个数

- 如果实参的个数小于形参的个数 多于的形参定义为undefined

## 函数返回值注意事项

- return 终止函数
  > return 后面的代码不会被执行

- return 只能返回一个值
  > return num1, num2; // 返回的结果是最后一个值

- 函数如果有return 则返回的是 return 后面的值，如果函数么有 return 则返回undefined

```js
function fun2() {

}

console.log(fun2()); // 函数返回的结果是 undefined
```

## arguments

> 只有函数才有 arguments对象 而且是每个函数都内置好了这个arguments(伪数组)

> **arguments**里面存储了所有传递过来的实参

> arguments没有真正数组的一些方法 pop()  push() 等等

- **arguments使用**

  > arguments.length

  > arguments[i]

## 声明函数的两种方式

```js
// 1. 利用函数关键字自定义函数(命名函数)
function fn() {

}

fn();
// 2. 函数表达式(匿名函数) 
// var 变量名 = function() {};
var fun = function (aru) {
    console.log('我是函数表达式');
    console.log(aru);

}
// (1) fun是变量名 不是函数名  
// (2) 函数表达式声明方式跟声明变量差不多，只不过变量里面存的是值 而 函数表达式里面存的是函数
// (3) 函数表达式也可以进行传递参数
```




















































