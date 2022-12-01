# Vue2

> 官方给出的概念：Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的前端框架。构建用户界面 框架核心关键词


## vue 的特性
- 数据驱动视图
- 双向数据绑定

### 数据驱动视图

> 在使用了 vue 的页面中，vue 会监听数据的变化，从而自动重新渲染页面的结构。

> 好处：当页面数据发生变化时，页面会自动重新渲染！
> 
> 注意：数据驱动视图是单向的数据绑定。

### 双向数据绑定

> 在填写表单时，双向数据绑定可以辅助开发者在不操作 DOM 的前提下，自动把用户填写的内容同步到数据源中。


> 好处：开发者不再需要手动操作 DOM 元素，来获取表单元素最新的值！

### MVVM

> MVVM 是 vue 实现数据驱动视图和双向数据绑定的核心原理。MVVM 指的是 Model、View 和 ViewModel，它把每个 HTML 页面都拆分成了这三个部分

> 在 MVVM 概念中：
> - Model 表示当前页面渲染时所依赖的数据源。
> - View 表示当前页面所渲染的 DOM 结构。
> - ViewModel 表示 vue 的实例，它是 MVVM 的核心。

### MVVM 的工作原理

> ViewModel 作为 MVVM 的核心，是它把当前页面的数据源（Model）和页面的结构（View）连接在了一起。

> 当数据源发生变化时，会被 ViewModel 监听到，VM 会根据最新的数据源自动更新页面的结构
> 
> 当表单元素的值发生变化时，也会被 VM 监听到，VM 会把变化过后最新的值自动同步到 Model 数据源中


## 基本使用
- 导入 vue.js 的 script 脚本文件
- 在页面中声明一个将要被 vue 所控制的 DOM 区域
- 创建 vm 实例对象（vue 实例对象）

```js
<body>
  <!-- 希望 Vue 能够控制下面的这个 div，帮我们在把数据填充到 div 内部 -->
  <div id="app">{{ username }}</div>

  <!-- 1. 导入 Vue 的库文件，在 window 全局就有了 Vue 这个构造函数 -->
  <script src="./lib/vue-2.6.12.js"></script>
  <!-- 2. 创建 Vue 的实例对象 -->
  <script>
    // 创建 Vue 的实例对象
    const vm = new Vue({
      // el 属性是固定的写法，表示当前 vm 实例要控制页面上的哪个区域，接收的值是一个选择器
      el: '#app',
      // data 对象就是要渲染到页面上的数据
      data: {
        username: 'zhangsan'
      }
    })
  </script>
</body>
```

## vue 的调试工具  vue-devtools

[Chrome 浏览器在线安装 ](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd)
[FireFox 浏览器在线安装](https://addons.mozilla.org/zh-CN/firefox/addon/vue-js-devtools/)

## vue 的指令与过滤器

### 指令的概念

> 指令（Directives）是 vue 为开发者提供的模板语法，用于辅助开发者渲染页面的基本结构。

> vue 中的指令按照不同的用途可以分为如下 6 大类：
> - 内容渲染指令
> - 属性绑定指令
> - 事件绑定指令
> - 双向绑定指令
> - 条件渲染指令
> - 列表渲染指令

### 内容渲染指令

- v-text  
```js
<p v-text="username"></p>
<p v-text="gender">性别：</p>
```
> 注意：v-text 指令会覆盖元素内默认的值

- {{ }} 

> vue 提供的 {{ }} 语法，专门用来解决 v-text 会覆盖默认文本内容的问题。这种 {{ }} 语法的专业名称是插值表达式（英文名为：Mustache）。
```js
<p>姓名：{{ username }}</p>
<p>性别：{{ gender }}</p>
```
> 注意：相对于 v-text 指令来说，插值表达式在开发中更常用一些！因为它不会覆盖元素中默认的文本内容。

- v-html





















