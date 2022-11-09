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


### 简单数据类型（基本数据类型）

|简单数据类型|说明|默认值|
|---|---|---|
|Number|数字型,包含整型值和浮点型值，如21、0.21|0|
|Boolean|布尔值类型，如true. false，等价于1和0|false|
|String|字符串类型，如"张三” 注意咱们js里面，字符串都带引号|""|
|Undefined|var a;声明了变量a但是没有给值|undefined|
|Null|var a = null;声明了变量a为空值|null|





















