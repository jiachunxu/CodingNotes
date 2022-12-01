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
    <div id="app">{{username}}</div>

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

## vue 的调试工具 vue-devtools

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
<p>姓名：{{username}}</p>
<p>性别：{{gender}}</p>
```

> 注意：相对于 v-text 指令来说，插值表达式在开发中更常用一些！因为它不会覆盖元素中默认的文本内容。

- v-html

> v-text 指令和插值表达式只能渲染纯文本内容。如果要把包含 HTML 标签的字符串渲染为页面的 HTML 元素，则需要用到 v-html 这个指令

### 属性绑定指令

> 如果需要为元素的属性动态绑定属性值，则需要用到 v-bind 属性绑定指令

> 由于 v-bind 指令在开发中使用频率非常高，因此，vue 官方为其提供了简写形式（简写为英文的 : ）

```
<img :src="photo" alt="" style="width: 150px;">
<div :title="'box' + index">这是一个 div</div>
```

> 在 vue 提供的模板渲染语法中，除了支持绑定简单的数据值之外，还支持 Javascript 表达式的运算

### 事件绑定指令

> vue 提供了 v-on 事件绑定指令，用来辅助程序员为 DOM 元素绑定事件监听。

> 通过 v-on 绑定的事件处理函数，需要在 methods 节点中进行声明

> 由于 v-on 指令在开发中使用频率非常高，因此，vue 官方为其提供了简写形式（简写为英文的 @ ）

> 注意：
> 原生 DOM 对象有 onclick、oninput、onkeyup 等原生事件，替换为 vue 的事件绑定形式后，分别为：v-on:click、v-on:input、v-on:keyup

#### $event

> $event 是 vue 提供的特殊变量，用来表示原生的事件参数对象 event。$event 可以解决事件参数对象 event 被覆盖的问题。

```
<button @click="add($event, 1)">+N</button>
```

#### 事件修饰符

> 在事件处理函数中调用 event.preventDefault() 或 event.stopPropagation() 是非常常见的需求。因此，vue 提供了事件修饰符的概念，来辅助程序员更方便的对事件的触发进行控制。

|事件修饰符|说明|
|---|---|
|.prevent|阻止默认行为（例如:阻止a连接的跳转、阻止表单的提交等)|
|.stop|阻止事件冒泡|
|.capture|以捕获模式触发当前的事件处理函数|
|.once|绑定的事件只触发1次|
|.self|只有在event.target是当前元素自身时触发事件处理函数|

```
<a href="http://www.baidu.com" @click.prevent="show">跳转到百度首页</a>
```

#### 按键修饰符

> 在监听键盘事件时，我们经常需要判断详细的按键。此时，可以为键盘相关的事件添加按键修饰符

```
<input type="text" @keyup.esc="clearInput" @keyup.enter="commitAjax">
```

### 双向绑定指令

> vue 提供了 v-model 双向数据绑定指令，用来辅助开发者在不操作 DOM 的前提下，快速获取表单的数据

```
  <div id="app">
    <p>用户的名字是：{{ username }}</p>
    <input type="text" v-model="username">
    <hr>

    <select v-model="city">
      <option value="">请选择城市</option>
      <option value="1">北京</option>
      <option value="2">上海</option>
      <option value="3">广州</option>
    </select>
  </div>
  
  const vm = new Vue({
    // el 属性是固定的写法，表示当前 vm 实例要控制页面上的哪个区域，接收的值是一个选择器
    el: '#app',
    // data 对象就是要渲染到页面上的数据
    data: {
      username: 'zhangsan',
      city: '2'
    }
  })
```

#### v-model 指令的修饰符

> 为了方便对用户输入的内容进行处理，vue 为 v-model 指令提供了 3 个修饰符

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202043602.png)

```js
<input type="text" v-model.number="n1"> 
```

### 条件渲染指令

> 条件渲染指令用来辅助开发者按需控制 DOM 的显示与隐藏。

- v-if
- v-show

```js
<p v-if="flag">这是被 v-if 控制的元素</p>
<p v-show="flag">这是被 v-show 控制的元素</p>
```

- v-if 和 v-show 的区别实现原理不同：
  - v-if 指令会动态地创建或移除 DOM 元素，从而控制元素在页面上的显示与隐藏；
  - v-show 指令会动态为元素添加或移除 style="display: none;" 样式，从而控制元素的显示与隐藏；
- 性能消耗不同：v-if 有更高的切换开销，而 v-show 有更高的初始渲染开销。
  - 如果需要非常频繁地切换，则使用 v-show 较好
  - 如果在运行时条件很少改变，则使用 v-if 较好


- v-else

> v-if 可以单独使用，或配合 v-else 指令一起使用
>
> 注意：v-else 指令必须配合 v-if 指令一起使用，否则它将不会被识别！

- v-else-if

### 列表渲染指令 (v-for)

> vue 提供了 v-for 列表渲染指令，用来辅助开发者基于一个数组来循环渲染一个列表结构。v-for 指令需要使用 item in items 形式的特殊语法

> v-for 指令还支持一个可选的第二个参数，即当前项的索引。语法格式为 (item, index) in items

```
  <li v-for="(user, index) in userlist" :key="user.id">
    <input type="checkbox" />
    姓名：{{user.name}}
  </li>
```

> 注意：v-for 指令中的 item 项和 index 索引都是形参，可以根据需要进行重命名。例如 (user, i) in userlist

#### 使用 key 维护列表的状态

> 当列表的数据变化时，默认情况下，vue 会尽可能的复用已存在的 DOM 元素，从而提升渲染的性能。
>
> 但这种默认的性能优化策略，会导致有状态的列表无法被正确更新。
>
> 为了给 vue 一个提示，以便它能跟踪每个节点的身份，从而在保证有状态的列表被正确更新的前提下，提升渲染的性能。
>
> 此时，需要为每项提供一个唯一的 key 属性

> 一般使用数据的id字段

#### key 的注意事项

- key 的值只能是字符串或数字类型
- key 的值必须具有唯一性（即：key 的值不能重复）
- 建议把数据项 id 属性的值作为 key 的值（因为 id 属性的值具有唯一性）
- 使用 index 的值当作 key 的值没有任何意义（因为 index 的值不具有唯一性）
- 建议使用 v-for 指令时一定要指定 key 的值（既提升性能、又防止列表状态紊乱）

## 过滤器

> 在创建 vue 实例期间，可以在 filters 节点中定义过滤器

```js
const vm = new Vue({
    el: '#app',
    data: {
        message: 'hello vue.js'
    },
    // 过滤器函数，必须被定义到 filters 节点之下
    // 过滤器本质上是函数
    filters: {
        // 注意：过滤器函数形参中的 val，永远都是“管道符”前面的那个值
        capi(val) {
            // 字符串有 charAt 方法，这个方法接收索引值，表示从字符串中把索引对应的字符，获取出来
            // val.charAt(0)
            const first = val.charAt(0).toUpperCase()
            // 字符串的 slice 方法，可以截取字符串，从指定索引往后截取
            const other = val.slice(1)
            // 强调：过滤器中，一定要有一个返回值
            return first + other
        }
    }
})
```

### 私有过滤器和全局过滤器

> 在 filters 节点下定义的过滤器，称为“私有过滤器”，因为它只能在当前 vm 实例所控制的 el 区域内使用。

> 如果希望在多个 vue 实例之间共享过滤器，则可以按照如下的格式定义全局过滤器

```js
// 使用 Vue.filter() 定义全局过滤器
Vue.filter('capi', function (str) {
    const first = str.charAt(0).toUpperCase()
    const other = str.slice(1)
    return first + other + '~~~'
})
```

### 连续调用多个过滤器

```html
<!--把message的值，交给filterA进行处理-->
<!-- 把 filterA 处理的结果，再交给filterB进行处理-->
<!--最终把 filterB处理的结果，作为最终的值渲染到页面上 -->
{{ message | filterA | filterB }}
```
### 过滤器传参

> 过滤器的本质是 JavaScript 函数，因此可以接收参数


### 过滤器的兼容性

> 过滤器仅在 vue 2.x 和 1.x 中受支持，在 vue 3.x 的版本中剔除了过滤器相关的功能。
在企业级项目开发中：
- 如果使用的是 2.x 版本的 vue，则依然可以使用过滤器相关的功能
- 如果项目已经升级到了 3.x 版本的 vue，官方建议使用计算属性或方法代替被剔除的过滤器功能具体的迁移指南，

请参考 vue 3.x 的官方文档给出的说明：
https://v3.vuejs.org/guide/migration/filters.html#migration-strategy


## watch 侦听器






















































































































