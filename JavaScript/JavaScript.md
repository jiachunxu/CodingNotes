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

```js
<script>
    alert('Hello World~!');
</script>
```

- 外部 JS文件

``` js
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

## 构造函数

```js
// 构造函数的语法格式
//构造函数名使用大驼峰
// function 构造函数名() {
//     this.属性 = 值;
//     this.方法 = function() {}
// }
// new 构造函数名();
```

```js
function Star(uname, age, sex) {
    this.name = uname;
    this.age = age;
    this.sex = sex;
    this.sing = function (sang) {
        console.log(sang);

    }
}

var ldh = new Star('刘德华', 18, '男'); // 调用函数返回的是一个对象
// console.log(typeof ldh);
console.log(ldh.name);
console.log(ldh['sex']);
ldh.sing('冰雨');

// 1. 构造函数名字首字母要大写
// 2. 我们构造函数不需要return 就可以返回结果
// 3. 我们调用构造函数 必须使用 new
// 4. 我们只要new Star() 调用函数就创建一个对象 ldh  {}
// 5. 我们的属性和方法前面必须添加 this
```

### new关键字执行过程

```js
    // new关键字执行过程
    // 1. new 构造函数可以在内存中创建了一个空的对象 
    // 2. this 就会指向刚才创建的空对象
    // 3. 执行构造函数里面的代码 给这个空对象添加属性和方法
    // 4. 返回这个对象
function Star(uname, age, sex) {
    this.name = uname;
    this.age = age;
    this.sex = sex;
    this.sing = function (sang) {
        console.log(sang);

    }
}

var ldh = new Star('刘德华', 18, '男');
```

# JavaScript作用域

> 就是代码名字（变量）在某个范围内起作用和效果 目的是为了提高程序的可靠性更重要的是减少命名冲突

> js的作用域（es6）之前 ： 全局作用域 局部作用域

> **全局作用域**： 整个script标签 或者是一个单独的js文件

> **局部作用域**（函数作用域） 在函数内部就是局部作用域 这个代码的名字只在函数内部起效果和作用

## 变量的作用域

> 根据作用域的不同我们变量分为全局变量和局部变量

- 全局变量
  > 在全局作用域下的变量 在全局下都可以使用

  > **注意** 如果在函数内部 **没有声明直接赋值的变量也属于全局变量**

- 局部变量
  > 在局部作用域下的变量 后者在函数内部的变量就是 局部变量

  > **注意**： 函数的形参也可以看做是局部变量

- 从执行效率来看全局变量和局部变量

	- (1) 全局变量只有浏览器关闭的时候才会销毁，比较占内存资源
	- (2) 局部变量 当我们程序执行完毕就会销毁， 比较节约内存资源

## 块级作用域

> es6 新增的块级作用域

> 块级作用域 {} if {} for {}

## 作用域链

> 内部函数访问外部函数的变量，采取的是链式查找的方式来决定取那个值 这种结构我们称为作用域链   **就近原则**

# 预解析

```js
console.log(num); // undefined  坑 1
var num = 10;
// 相当于执行了以下代码
// var num;
// console.log(num);
// num = 10;
```

```js
fun(); // 报错  坑2 
var fun = function () {
    console.log(22);

}
// 函数表达式 调用必须写在函数表达式的下面
// 相当于执行了以下代码
// var fun;
// fun();
// fun = function() {
// console.log(22);
```

```js
// 1. js引擎运行js 分为两步：  预解析  代码执行
// (1). 预解析 js引擎会把js 里面所有的 var  还有 function 提升到当前作用域的最前面
// (2). 代码执行  按照代码书写的顺序从上往下执行
// 2. 预解析分为 变量预解析（变量提升） 和 函数预解析（函数提升）
// (1) 变量提升 就是把所有的变量声明提升到当前的作用域最前面  不提升赋值操作
// (2) 函数提升 就是把所有的函数声明提升到当前作用域的最前面  不调用函数
```

# 对象

## 创建对象,调用属性,方法

```js
// 1.利用对象字面量创建对象 {}
// var obj = {};  // 创建了一个空的对象 
var obj = {
    uname: '张三疯',
    age: 18,
    sex: '男',
    sayHi: function () {
        console.log('hi~');

    }
}
// (1) 里面的属性或者方法采取键值对的形式  键 属性名 ： 值  属性值 
// (2) 多个属性或者方法中间用逗号隔开的
// (3) 方法冒号后面跟的是一个匿名函数
// 2. 使用对象
// (1). 调用对象的属性 我们采取 对象名.属性名 . 我们理解为 的
console.log(obj.uname);
// (2). 调用属性还有一种方法 对象名['属性名']
console.log(obj['age']);
// (3) 调用对象的方法 sayHi   对象名.方法名() 千万别忘记添加小括号
obj.sayHi();
```

```js
// 利用 new Object 创建对象
var obj = new Object(); // 创建了一个空的对象
obj.uname = '张三疯';
obj.age = 18;
obj.sex = '男';
obj.sayHi = function () {
    console.log('hi~');

}
// (1) 利用 等号 = 赋值的方法 添加对象的属性和方法
// (2) 每个属性和方法之间用 分号结束
console.log(obj.uname);
console.log(obj['sex']);
obj.sayHi();
```

## 遍历对象

```js
var obj = {
    name: 'pink老师',
    age: 18,
    sex: '男',
    fn: function () {
    }
}

// for in 遍历对象
// for (变量 in 对象) {
// }
for (var k in obj) {
    console.log(k); // k 变量 输出  得到的是 属性名
    console.log(obj[k]); // obj[k] 得到是 属性值

}
```

## 内置对象

### Math

- Math.PI 圆周率
- Math.max() 求最大值
- Math.abs() 求绝对值
- Math.floor() 向下取整 往最小了取值
- Math.ceil() 向上取整 往最大了取值
- Math.round() 四舍五入 +0.5 向下取整
  > console.log(Math.round(1.1)); // 1
  >
  > console.log(Math.round(1.9)); // 2
  >
  > console.log(Math.round(-1.1)); // -1
  >
  > console.log(Math.round(-1.5)); // -1

- Math.random() 随机数   [0,1)

### Date() 日期对象

> Date() 日期对象 是一个构造函数 必须使用new 来调用创建日期对象

```js
 // 1. 使用Date  如果没有参数 返回当前系统的当前时间
var date = new Date();
console.log(date);
// 2. 参数常用的写法  数字型  2019, 10, 01  或者是 字符串型 '2019-10-1 8:8:8'
var date1 = new Date(2019, 10, 1);
console.log(date1); // 返回的是 11月 不是 10月 
var date2 = new Date('2019-10-1 8:8:8');
console.log(date2);
```

#### 格式化日期

```js
// 格式化日期 年月日 
var date = new Date();
console.log(date.getFullYear()); // 返回当前日期的年  2019
console.log(date.getMonth() + 1); // 月份 返回的月份小1个月   记得月份+1 呦
console.log(date.getDate()); // 返回的是 几号
console.log(date.getDay()); // 3  周一返回的是 1 周六返回的是 6 但是 周日返回的是 0
```

```js
 // 格式化日期 时分秒
var date = new Date();
console.log(date.getHours()); // 时
console.log(date.getMinutes()); // 分
console.log(date.getSeconds()); // 秒
```

#### 获取毫秒数

```js
// 获得Date总的毫秒数(时间戳)  不是当前时间的毫秒数 而是距离1970年1月1号过了多少毫秒数
// 1. 通过 valueOf()  getTime()
var date = new Date();
console.log(date.valueOf()); // 就是 我们现在时间 距离1970.1.1 总的毫秒数
console.log(date.getTime());
// 2. 简单的写法 (最常用的写法)
var date1 = +new Date(); // +new Date()  返回的就是总的毫秒数
console.log(date1);
// 3. H5 新增的 获得总的毫秒数
console.log(Date.now());
```

### 数组

#### 创建数组的两种方式

```js
// 1. 利用数组字面量
var arr = [1, 2, 3];
console.log(arr[0]);

// 2. 利用new Array()
var arr1 = new Array();  // 创建了一个空的数组
var arr1 = new Array(2);  // 这个2 表示 数组的长度为 2  里面有2个空的数组元素 
var arr1 = new Array(2, 3); // 等价于 [2,3]  这样写表示 里面有2个数组元素 是 2和3
```

#### 检测是否为数组

- (1) instanceof 运算符
  > var arr = [ ]; console.log(arr instanceof Array);

- (2) Array.isArray(参数);  **H5新增的方法 ie9以上版本支持**
  > Array.isArray(arr)

#### 添加删除数组元素方法

- arr.push() 在我们数组的末尾 添加一个或者多个数组元素 push 推
  > var arr = [1, 2, 3];

  > arr.push(4, 'pink');

  > push之后，**返回新数组的长度**

- arr.unshift() 在数组的开头 添加一个或者多个数组元素
  > arr.unshift('red', 'purple');

  > unshift完毕之后，**返回新数组的长度**

- arr.pop() 删除数组的最后一个元素
  > arr.pop()

  > pop完毕之后，**返回删除的那个元素**


- arr.shift() 删除数组的第一个元素
  > arr.shift()

  > shift完毕之后，**返回删除的那个元素**

#### 获取数组元素索引

- arr.indexOf(数组元素)

- arr.lastIndexOf(数组元素)

#### 数组转字符串

- arr.toString()

```js
    var arr = [1, 2, 3];
console.log(arr.toString()); // 1,2,3
```

- arr.join(分隔符)

```js
    var arr1 = ['green', 'blue', 'pink'];
console.log(arr1.join()); // green,blue,pink
console.log(arr1.join('-')); // green-blue-pink
console.log(arr1.join('&')); // green&blue&pink
```

---

### 基本包装类型

> 把简单数据类型 包装成为了 复杂数据类型

```js
    var str = 'andy';
console.log(str.length);
// 对象 才有 属性和方法   复杂数据类型才有 属性和方法 

// (1) 把简单数据类型包装为复杂数据类型 
var temp = new String('andy');
// (2) 把临时变量的值 给 str
str = temp;
// (3) 销毁这个临时变量
temp = null;
```

#### 字符串的不可变性

> 字符串的不可变所以不要大量的拼接字符串

#### 获取字符索引

- str.indexOf('要查找的字符', [起始的位置])
-

```js
    //  str.indexOf('要查找的字符', [起始的位置])
var str = '改革春风吹满地，春天来了';
console.log(str.indexOf('春'));
console.log(str.indexOf('春', 3)); // 从索引号是 3的位置开始往后查找
```

#### 根据索引返回字符

- str.charAt(index)

- str.charCodeAt(index)
  > 返回相应索引号的字符ASCII值

  > 目的： 判断用户按下了那个键
    ```js
    var str = 'andy';
    console.log(str.charCodeAt(0)); // 97
    ```

- str[index] **H5 新增**

#### 字符串操作方法

- concat('字符串1','字符串2'....)
  > 将一个或多个字符串与原字符串连接合并，形成一个新的字符串并返回

- substr('截取的起始位置', '截取几个字符')

- replace('被替换的字符', '替换为的字符')
  > 只会替换第一个字符

- split('分隔符')
  > 字符转换为数组

### 简单数据类型 null

> 返回的是一个空的对象 object

> 如果有个变量打算存储为对象，暂时没想好放啥， 这个时候就给 null

> 1. 简单数据类型 是存放在栈里面 里面直接开辟一个空间存放的是值

> 2. 复杂数据类型 首先在栈里面存放地址 十六进制表示 然后这个地址指向堆里面的数据

---

# WebAPI

## DOM

### document.getElementById()

> console.dir 打印返回的元素对象 可以查看内部的属性和方法

### document.getElementsByTagName('标签名')

> 返回的是 获取过来元素对象的集合 以伪数组的形式存储的

> 如果页面中只有一个,返回的还是伪数组的形式

> 如果页面中没有这个元素,返回的是空的伪数组的形式

### H5新增

### document.getElementsByClassName()

> 根据类名获得某些元素集合

### document.querySelector()

> 返回指定选择器的第一个元素对象 切记 里面的选择器需要加符号 .box #nav

### document.querySelectorAll()

> 返回指定选择器的所有元素对象集合

### 获取body 元素

> var bodyEle = document.body

### 获取html 元素

> var htmlEle = document.documentElement

### 改变元素内容

> 两个属性是可读写的 可以获取元素里面的内容

- innerHTML
  > 不识别html标签 非标准 去除空格和换行

- innerText
  > 识别html标签 W3C标准 保留空格和换行的

```html

<body>
    <div></div>
    <p>
        我是文字
        <span>123</span>
    </p>
    <script>
        let div = document.querySelector('div');
        div.innerHTML = '<strong>今天是：</strong> 2019';
        let p = document.querySelector('p');
        console.log(p.innerText);
        console.log(p.innerHTML);
    </script>
</body>
```

### 修改元素属性

```html

<body>
    <button id="ldh">刘德华</button>
    <button id="zxy">张学友</button>
    <br>
    <img src="images/ldh.jpg" alt="" title="刘德华">

    <script>
        // 修改元素属性  src
        let ldh = document.getElementById('ldh');
        let zxy = document.getElementById('zxy');
        let img = document.querySelector('img');
        zxy.onclick = function () {
            img.src = 'images/zxy.jpg';
            img.title = '张学友思密达';
        }
        ldh.onclick = function () {
            img.src = 'images/ldh.jpg';
            img.title = '刘德华';
        }
    </script>
</body>
```

### 表单属性设置

> 表单里面的值 文字内容是通过 value 来修改的

```html

<body>
    <button>按钮</button>
    <input type="text" value="输入内容">
    <script>
        let btn = document.querySelector('button');
        let input = document.querySelector('input');
        btn.onclick = function () {
            // 表单里面的值 文字内容是通过 value 来修改的
            input.value = '被点击了';
            // button禁用
            // btn.disabled = true;
            this.disabled = true;
            // this 指向的是事件函数的调用者 btn
        }
    </script>
</body>
```

### 修改样式属性

> this.style.display = 'block'; 显示

> this.style.display = 'none'; 隐藏

```html

<body>
    <div></div>
    <script>
        let div = document.querySelector('div');
        div.onclick = function () {
            // div.style里面的属性 采取驼峰命名法 
            this.style.backgroundColor = 'purple';
            this.style.width = '250px';
        }
    </script>
</body>
```

### 修改class属性

> this.className = 'first change';

> 可以修改元素样式

### 排他思想

```html

<body>
    <button>按钮1</button>
    <button>按钮2</button>
    <button>按钮3</button>
    <script>
        // 1. 获取所有按钮元素
        let btns = document.getElementsByTagName('button');
        // btns得到的是伪数组  里面的每一个元素 btns[i]
        for (let i = 0; i < btns.length; i++) {
            btns[i].onclick = function () {
                // (1) 我们先把所有的按钮背景颜色去掉  干掉所有人
                for (let i = 0; i < btns.length; i++) {
                    btns[i].style.backgroundColor = '';
                }
                // (2) 然后才让当前的元素背景颜色为pink 留下我自己
                this.style.backgroundColor = 'pink';

            }
        }
        //2. 首先先排除其他人，然后才设置自己的样式 这种排除其他人的思想我们成为排他思想
    </script>
</body>
```

### 自定义属性操作

> **作用**:切换tab栏

- 获取元素的属性值
	- element.属性
	- element.getAttribute('属性')
- 设置元素属性值
	- element.属性= '值'
	- element.setAttribute('属性', '值')
  > var div = document.querySelector('div');
  >
  > div.className = 'navs';
  >
  > div.setAttribute('class', 'footer'); // class 特殊 这里面写的就是class 不是className
- 移除属性
	- removeAttribute(属性)

#### H5自定义属性

``` html

<body>
    <div getTime="20" data-index="2" data-list-name="andy"></div>
    <script>
        let div = document.querySelector('div');
        console.log(div.getAttribute('getTime'));
        div.setAttribute('data-time', 20);
        console.log(div.getAttribute('data-index'));
        console.log(div.getAttribute('data-list-name'));
        // h5新增的获取自定义属性的方法 它只能获取data-开头的
        // dataset 是一个集合里面存放了所有以data开头的自定义属性
        console.log(div.dataset);
        console.log(div.dataset.index);
        console.log(div.dataset['index']);
        // 如果自定义属性里面有多个-链接的单词，我们获取的时候采取 驼峰命名法
        console.log(div.dataset.listName);
        console.log(div.dataset['listName']);
    </script>
</body>
```

## 事件

### 三要素

- 事件源
- 事件类型
- 事件处理程序

### 执行事件步骤

- 获取事件源
- 绑定事件 注册事件
- 添加事件处理程序

```html

<body>
    <button id="btn">唐伯虎</button>
    <script>
        //(1) 事件源 事件被触发的对象   谁  按钮
        let btn = document.getElementById('btn');
        //(2) 事件类型  如何触发 什么事件 比如鼠标点击(onclick) 还是鼠标经过 还是键盘按下
        //(3) 事件处理程序  通过一个函数赋值的方式 完成
        btn.onclick = function () {
            alert('点秋香');
        }
    </script>
</body>
```

### 事件种类

|事件|行为|
|---|---|
|onclick|鼠标点击|
|onfocus|获得焦点|
|onblur|失去焦点|
|onmouseover|鼠标经过|
|onmouseout|鼠标离开|
|keyup|按键弹起|
|keydown|按键按下(识别功能键)|
|keypress|按键按下(不能识别功能键)|

### 注册事件的两种方式

- 传统方式注册事件
- 事件侦听注册事件 addEventListener
	- 里面的事件类型是字符串 必定加引号 而且不带on
	- 同一个元素 同一个事件可以添加多个侦听器（事件处理程序）
- attachEvent
  > ie9以前的版本支持

``` html

<body>
    <button>传统注册事件</button>

    <script>
        let btn = document.querySelector('button');
        // 1. 传统方式注册事件
        btn.onclick = function () {
            alert('hi');
        }
        // 2.事件侦听注册事件 addEventListener 
        btn.addEventListener('click', function () {
            alert(22);
        })

        // 3. attachEvent ie9以前的版本支持
        btn.attachEvent('onclick', function () {
            alert(11);
        })
    </script>
</body>
```

### 删除事件

- 传统方式删除事件
- removeEventListener 删除事件
- detachEvent

``` html

<body>
    <div>1</div>
    <div>2</div>
    <div>3</div>
    <script>
        let divs = document.querySelectorAll('div');
        divs[0].onclick = function () {
            alert(11);
            // 1. 
            divs[0].onclick = null;
        }
        // 2. removeEventListener 删除事件
        divs[1].addEventListener('click', fn) // 里面的fn 不需要调用加小括号

        function fn() {
            alert(22);
            divs[1].removeEventListener('click', fn);
        }

        // 3. detachEvent
        divs[2].attachEvent('onclick', fn1);

        function fn1() {
            alert(33);
            divs[2].detachEvent('onclick', fn1);
        }
    </script>
</body>
```

### DOM 事件流 三个阶段

> JS 代码中只能执行捕获或者冒泡其中的一个阶段。

- 捕获阶段
  > document -> html -> body -> father -> son

  > 如果addEventListener 第三个参数是 true 那么则处于捕获阶段
- 目标阶段

- 冒泡阶段
  > son -> father ->body -> html -> document

  > onclick 和 attachEvent（ie） 只能得到冒泡阶段。

  > 如果addEventListener 第三个参数是 false 或者 省略 那么则处于冒泡阶段

```js
//演示
let son = document.querySelector('.son');
son.addEventListener('click', function () {
    alert('son');
}, true);
```

### 事件对象

```js
//事件对象e
let div = document.querySelector('div');
div.onclick = function (e) {
    // console.log(e);
    // console.log(window.event);
    // e = e || window.event;
    console.log(e);
    // div.addEventListener('click', function(e) {
    //         console.log(e);

    // })
    // 1. event 就是一个事件对象 写到我们侦听函数的 小括号里面 当形参来看
    // 2. 事件对象只有有了事件才会存在，它是系统给我们自动创建的，不需要我们传递参数
    // 3. 事件对象是一系列相关数据的集合 跟事件相关的 
    // 比如鼠标点击里面就包含了鼠标的相关信息，鼠标坐标啊，
    // 如果是键盘事件里面就包含的键盘事件的信息 比如 判断用户按下了那个键
    // 4. 事件对象可以自己命名 比如 event 、 evt、 e
    // 5. 事件对象也有兼容性问题 ie678 通过 window.event 兼容性的写法  e = e || window.event;

    // 了解兼容性
    // div.onclick = function(e) {
    //     e = e || window.event;
    //     var target = e.target || e.srcElement;
    //     console.log(target);

    // this 有个非常相似的属性 currentTarget  ie678不认识
}
```

> e.target 返回的是触发事件的对象（元素）

> this 返回的是绑定事件的对象（元素）

#### 事件对象阻止默认行为

- e.preventDefault()
  > dom 标准写法
- e.returnValue 属性
  > 低版本浏览器 ie678
- return false;
  > 没有兼容性问题 特点： return 后面的代码不执行了， 而且只限于传统的注册方式

#### 阻止事件冒泡

- e.stopPropagation()
  > dom 推荐的标准 - - stop 停止 Propagation 传播
- e.cancelBubble = true
  > 非标准

#### 事件委托

> 事件委托的核心原理：给父节点添加侦听器， 利用事件冒泡影响每一个子节点

```js
<ul>
    <li>知否知否，点我应有弹框在手！</li>
    <li>知否知否，点我应有弹框在手！</li>
</ul>

var ul = document.querySelector('ul');
ul.addEventListener('click', function (e) {
    // alert('知否知否，点我应有弹框在手！');
    // e.target 这个可以得到我们点击的对象
    e.target.style.backgroundColor = 'pink';
})
```

#### 常见鼠标事件

- contextmenu
- selectstart

```js
 // 1. contextmenu 我们可以禁用右键菜单
document.addEventListener('contextmenu', function (e) {
    e.preventDefault();
})
// 2. 禁止选中文字 selectstart
document.addEventListener('selectstart', function (e) {
    e.preventDefault();

})
```

#### 鼠标事件对象 MouseEvent

- client
  > 鼠标在可视区的x和y坐标

    ```js
    console.log(e.clientX);
    console.log(e.clientY);
    ```

- page
  > 鼠标在页面文档的x和y坐标

    ```js
    console.log(e.pageX);
    console.log(e.pageY);
    ```

- screen
  > 鼠标在电脑屏幕的x和y坐标

    ```js
    console.log(e.screenX);
    console.log(e.screenY);
    ```

#### 常用键盘事件

> 三个事件的执行顺序 keydown -- keypress -- keyup

- keyup
  > 事件不区分字母大小写
- keydown
  > 能识别功能键

  > 事件不区分字母大小写

- keypress
  > 不能识别功能键

  > 区分字母大小写

---
> e.keyCode

> 键盘事件对象中的keyCode属性可以得到相应键的ASCII码值

> 利用keycode返回的ASCII码值来判断用户按下了那个键

## 节点

### 父节点 element.parentNode

### 子节点

> DOM 提供的方法（API）获取

- element.childNodes
  > 所有的子节点 包含 元素节点 文本节点等等


- element.children
  > 获取所有的子元素节点 实际开发常用的

- element.firstChild
  > 第一个子节点 不管是文本节点还是元素节点

- element.firstElementChild
  > 返回第一个子元素节点 ie9才支持

- element.children[0]
- element.children[ol.children.length - 1]
  > 实际开发的写法,没有兼容性问题

### 兄弟节点

- nextSibling
  > 下一个兄弟节点 包含元素节点或者 文本节点等等
- nextElementSibling
  > 得到下一个兄弟元素节点

### 创建和添加节点

- 创建节点元素节点
  > var li = document.createElement('li')

- 添加节点
  > node.appendChild(child)  node 父级 child 是子级 后面追加元素

  > node.insertBefore(child, 指定元素); 在指定元素前方插入child

### 删除节点

- node.removeChild(child)

### 克隆节点

- node.cloneNode()

> 括号为空或者里面是false 浅拷贝 只复制标签不复制里面的内容

> 括号为true 深拷贝 复制标签复制里面的内容

### 三种创建元素方式区别

- document.write()
  > 创建元素 如果页面文档流加载完毕，再调用这句话会导致页面重绘

- innerHTML

- document.createElement()

----

## BOM

> BOM顶级对象window

### window常见事件

#### onload

> load 等页面内容全部加载完毕，包含页面dom元素 图片 flash  css 等等

> DOMContentLoaded 是DOM 加载完毕，不包含图片 flash css 等就可以执行 加载速度比 load更快一些

```js
window.addEventListener('load', function () {
    var btn = document.querySelector('button');
    btn.addEventListener('click', function () {
        alert('点击我');
    })
})
window.addEventListener('load', function () {

    alert(22);
})
document.addEventListener('DOMContentLoaded', function () {
    alert(33);
})
```

#### resize

> 调整窗口大小事件

```js
window.addEventListener('resize', function () {
    console.log(window.innerWidth);
    console.log('变化了');
    if (window.innerWidth <= 800) {
        div.style.display = 'none';
    } else {
        div.style.display = 'block';
    }
})
```

### 定时器

#### setTimeout

> 语法规范： window.setTimeout(调用函数, 延时时间);

- window在调用的时候可以省略
- 延时时间单位是毫秒(ms) 但是可以省略，默认的是0
- 调用函数可以直接写函数 还可以写 函数名 还有一个写法 '函数名()'
- 页面中可能有很多的定时器，我们经常给定时器加标识符 (名字)

- > setTimeout('callback()', 3000); // 不提倡这个写法

#### 清除setTimeout定时器

> clearTimeout(timer)

```js
var btn = document.querySelector('button');
var timer = setTimeout(function () {
    console.log('爆炸了');

}, 5000);
btn.addEventListener('click', function () {
    clearTimeout(timer);
})
```

#### setInterval

> 语法规范： window.setInterval(调用函数, 延时时间);

```js
setInterval(function () {
    console.log('继续输出');

}, 1000);
```

#### setTimeout 和 setInterval 区别

- setTimeout 延时时间到了，就去调用这个回调函数，只调用一次 就结束了这个定时器
- setInterval 每隔这个延时时间，就去调用这个回调函数，会调用很多次，重复调用这个函数

#### 清除 setInterval 定时器

> clearInterval(timer)

## this 指向问题

> this 一般情况下 this 的最终指向的是那个调用它的对象

> 全局作用域或者普通函数中this指向全局对象window（ 注意定时器里面的this指向window）

> 构造函数中 this 指向构造函数的实例

> 方法调用中 this 指向调用者

### location

- `location.search` 获取url参数,包括? 例如?age=15
- `location.assign(url)` 跳转到 url, 记录浏览历史，所以可以实现后退功能
- `location.replace(url)` 跳转到 url, 不记录浏览历史，所以不可以实现后退功能
- `location.reload(true)` 默认为 false,从缓存中获取页面,true 强制刷新重新GET页面

### navigator 对象

> navigator对象包含有关浏览器的信息，它有很多属性，我们最常用的是userAgent，该属性可以返回由客户机发送服务器user-agent头部的值。

> 可以根据属性调整显示页面为 PC端 或者 移动端

### history 对象

> window对象给我们提供了一个history对象，与浏览器历史记录进行交互。该对象包含用户（在浏览器窗口中)访问过的URL。

|history方法|作用|
|---|---|
|back()|后退|
|forward()|前进|
|go(参数)|1:前进1页,-1:后退一页|

### offset 系列

- 获得元素距离带有定位父元素的位置
- 获得元素自身的大小(宽度高度)
- 注意:返回的数值都不带单位

|offset 系列属性|作用|
|---|---|
|element.offsetParent|返回作为该元素带有定位的父级元素如果父级都没有定位则返回body|
|element.offsetTop|返回元素相对带有定位父元素上方的偏移|
|element.offsetLeft|返回元素相对带有定位父元素左边框的偏移|
|element.offsetWidth|返回包括padding 、边框、内容区的**宽度**，返回数值不带单位|
|element.offsetHeight|返回包括padding、边框、内容区的**高度**，返回数值不带单位|

```js
<div class="father">
    <div class="son"></div>
</div>
<div class="w"></div>
<script>

    var father = document.querySelector('.father');
    var son = document.querySelector('.son');
    // 1.可以得到元素的偏移 位置 返回的不带单位的数值
    console.log(father.offsetTop);
    console.log(father.offsetLeft);
    // 它以带有定位的父亲为准 如果么有父亲或者父亲没有定位 则以 body 为准
    console.log(son.offsetLeft);
    var w = document.querySelector('.w');
    // 2.可以得到元素的大小 宽度和高度 是包含padding + border + width
    console.log(w.offsetWidth);
    console.log(w.offsetHeight);
    // 3. 返回带有定位的父亲 否则返回的是body
    console.log(son.offsetParent); // 返回带有定位的父亲 否则返回的是body
    console.log(son.parentNode); // 返回父亲 是最近一级的父亲 亲爸爸 不管父亲有没有定位
</script>
```

#### offset 和 style

- offset
	- offset 可以得到任意样式表中的样式值
	- offset 系列获得的数值是没有单位的
	- offsetWidth 包含padding+border+width
	- offsetWidth 等属性是只读属性，只能获取不能赋值
	- 所以，想要获取元素大小位置，用offset更合适

- style
	- style 只能得到行内样式表中的样式值
	- style.width 获得的是带有单位的字符串
	- style.width 获得不包含padding和border的值
	- style.width 是可读写属性，可以获取也可以赋值
	- 所以，想要给元素更改值，则需要用style改变

### client 系列属性

> 使用client系列的相关属性来获取元素可视区的相关信息。> 通过client系列的相关属性可以动态的得到该元素的边框大小、元素大小等。

|client系列属性|作用|
|---|---|
|element.clientTop|返回元素上边框的大小|
|element.clientLeft|返回元素左边框的大小|
|element.clientWidth|返回自身包括padding、内容区的宽度，不含边框，返回数值不带单位|
|element.clientHeight|返回自身包括padding、内蓉区的高度，不含边框，返回数值不带单位|

### 立即执行函数

> 不需要调用，立马能够自己执行的函数

- 写法,也可以传递参数进来
	- (function(){})()
	- (function(){}())

> 立即执行函数最大的作用就是 独立创建了一个作用域, 里面所有的变量都是局部变量 不会有命名冲突的情况

### scroll系列属性

> 使用scroll系列的相关属性可以动态的得到该元素的大小、滚动距离等

|scroll系列属性|作用|
|---|---|
|element.scrollTop|返回被卷去的上侧距离，返回数值不带单位|
|element.scrollLeft|返回被卷去的左侧距离，返回数值不带单位|
|element.scrollWidth|返回自身实际的宽度，不含边框，返回数值不带单位|
|element.scrollHeight|返回自身实际的高度，不含边框，返回数值不带单位|

```js
    <div>
    我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容
    我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容 我是内容
</div>
<script>
    // scroll 系列
    var div = document.querySelector('div');
    console.log(div.scrollHeight);
    console.log(div.clientHeight);
    // scroll滚动事件当我们滚动条发生变化会触发的事件
    div.addEventListener('scroll', function() {
    console.log(div.scrollTop)

    })
</script>
```

### 三大系列总结

- offset系列经常用于获得元素位置offsetLeft offsetTop
- client经常用于获取元素大小clientWidth clientHeight
- scroll经常用于获取滚动距离scrollTop scrollLeft
- **注意**: 页面滚动的距离通过window.pageXOffset获得

### mouseenter(不冒泡) 和 mouseover(冒泡)的区别

> mouseenter 鼠标事件
>   - 当鼠标移动到元素上时就会触发mouseenter事件
>   - 类似 mouseover，它们两者之间的差别是 mouseover 鼠标经过自身盒子会触发，经过子盒子还会触发。
>   - mouseenter 只会经过自身盒子触发之所以这样，就是因为 mouseenter 不会冒泡
>   - 跟 mouseenter 搭配鼠标离开 mouseleave 同样不会冒泡

### touch 触摸事件

- touchstart -- 手指触摸DOM元素事件
- touchmove -- 手指在DOM元素身上移动事件
- touchend -- 手指离开DOM元素事件

#### 触摸事件对象touchEvent

- touches 正在触摸屏幕的所有手指的列表
- targetTouches 正在触摸当前DOM元素的手指列表
- changedTouches 手指状态发生了改变的列表 从无到有 或者 从有到无
- 当我们手指离开屏幕的时候，就没有了 touches 和 targetTouches 列表, 但是会有 changedTouches 





