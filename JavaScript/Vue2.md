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


<!-- 1. 导入 Vue 的库文件，在 window 全局就有了 Vue 这个构造函数 -->
//<script src="./lib/vue-2.6.12.js"></script>

// 创建 Vue 的实例对象
const vm = new Vue({
    // el 属性是固定的写法，表示当前 vm 实例要控制页面上的哪个区域，接收的值是一个选择器
    el: '#app',
    // data 对象就是要渲染到页面上的数据
    data: {
        username: 'zhangsan'
    }
})
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

> 过滤器仅在 vue 2.x 和 1.x 中受支持，在 vue 3.x 的版本中剔除了过滤器相关的功能。 在企业级项目开发中：

- 如果使用的是 2.x 版本的 vue，则依然可以使用过滤器相关的功能
- 如果项目已经升级到了 3.x 版本的 vue，官方建议使用计算属性或方法代替被剔除的过滤器功能具体的迁移指南，

请参考 vue 3.x 的官方文档给出的说明：
https://v3.vuejs.org/guide/migration/filters.html#migration-strategy

## watch 侦听器

> watch 侦听器允许开发者监视数据的变化，从而针对数据的变化做特定的操作

```js
const vm = new Vue({
    el: '#app',
    data: {
        username: 'admin'
    },
    // 所有的侦听器，都应该被定义到 watch 节点下
    watch: {
        // 侦听器本质上是一个函数，要监视哪个数据的变化，就把数据名作为方法名即可
        // 新值在前，旧值在后
        username(newVal) {
            if (newVal === '') return
            // 1. 调用 jQuery 中的 Ajax 发起请求，判断 newVal 是否被占用！！！
            $.get('https://www.escook.cn/api/finduser/' + newVal, function (result) {
                console.log(result)
            })
        }
    }
})
```

### immediate 选项

> 默认情况下，组件在初次加载完毕后不会调用watch 侦听器。如果想让watch 侦听器立即被调用，则需要使 用immediate 选项

```js
const vm = new Vue({
    el: '#app',
    data: {
        username: 'admin'
    },
    // 所有的侦听器，都应该被定义到 watch 节点下
    watch: {
        // 定义对象格式的侦听器
        username: {
            // 侦听器的处理函数
            handler(newVal, oldVal) {
                console.log(newVal, oldVal)
            },
            // immediate 选项的默认值是 false
            // immediate 的作用是：控制侦听器是否自动触发一次！
            immediate: true
        }
    }
})
```

### deep 选项

> 如果watch 侦听的是一个对象，如果对象中的属性值发生了变化，则无法被监听到。此时需要使用 deep 选项

### 监听对象单个属性的变化

```js
const vm = new Vue({
    el: '#app',
    data: {
        info: {
            username: 'admin',
            address: {
                city: '北京'
            }
        }
    },
    watch: {
        'info.username'(newVal) {
            console.log(newVal)
        }
    }
})
```

## 计算属性

> 计算属性指的是通过一系列运算之后，最终得到一个属性值。
>
> 这个动态计算出来的属性值可以被模板结构或methods 方法使用。

```js
var vm = new Vue({
    el: '#app',
    data: {
        r: 0,
        g: 0,
        b: 0
    },
    // 所有的计算属性，都要定义到 computed 节点之下
    // 计算属性在定义的时候，要定义成“方法格式”
    computed: {
        // rgb 作为一个计算属性，被定义成了方法格式，
        // 最终，在这个方法中，要返回一个生成好的 rgb(x,x,x) 的字符串
        rgb() {
            return `rgb(${this.r}, ${this.g}, ${this.b})`
        }
    }
})
```

### 计算属性的特点

- 虽然计算属性在声明的时候被定义为方法，但是计算属性的本质是一个属性
- 计算属性会缓存计算的结果，只有计算属性依赖的数据变化时，才会重新进行运算

## vue-cli

> vue-cli 是Vue.js 开发的标准工具。它简化了程序员基于webpack 创建工程化的Vue 项目的过程。

[中文官网](https://cli.vuejs.org/zh/)

```
// 安装
npm install -g @vue/cli

// 基于vue-cli 快速生成工程化的Vue 项目
vue create 项目的名称
```

### vue 项目的运行流程

> 在工程化的项目中，vue 要做的事情很单纯：通过main.js 把App.vue 渲染到index.html 的指定区域中。

- App.vue 用来编写待渲染的模板结构
- index.html 中需要预留一个el 区域
- main.js 把App.vue 渲染到了index.html 所预留的区域中

## vue 组件

> 组件化开发指的是：根据封装的思想，把页面上可重用的UI 结构封装为组件，从而方便项目的开发和维护。

### vue 中的组件化开发

- vue 是一个支持组件化开发的前端框架。
- vue 中规定：组件的后缀名是.vue。之前接触到的App.vue 文件本质上就是一个vue 的组件。

### vue 组件的三个组成部分

- template -> 组件的模板结构
- script -> 组件的JavaScript 行为
- style -> 组件的样式

> 其中，每个组件中必须包含template 模板结构，而script 行为和style 样式是可选的组成部分。

#### template

> vue 规定：每个组件对应的模板结构，需要定义到<template> 节点中。

```js
<template>

</template>
```

注意：

- template 是vue 提供的容器标签，只起到包裹性质的作用，它不会被渲染为真正的DOM 元素
- template 中只能包含唯一的根节点 (Vue3支持多根节点)

#### script

> vue 规定：开发者可以在<script> 节点中封装组件的JavaScript 业务逻辑。

```js
<script>
    export default {}
</script>
```

> .vue 组件中的data 必须是函数

> vue 规定：.vue 组件中的data 必须是一个函数，不能直接指向一个数据对象

会导致多个组件实例共用同一份数据的问题，请参考官方给出的示例：https://cn.vuejs.org/v2/guide/components.html#data-必须是一个函数

#### style

> vue 规定：组件内的<style> 节点是可选的，开发者可以在<style> 节点中编写样式美化当前组件的UI 结构。

```
<style lang="less">
// lang 默认是css
</style>
```

### 组件之间的父子关系

> 组件在被封装好之后，彼此之间是相互独立的，不存在父子关系 在使用组件的时候，根据彼此的嵌套关系，形成了父子关系、兄弟关系

### 使用组件的三个步骤

```html

<template>
    <div class="app-container">
        <h1>App 根组件</h1>

        <button
                @click="flag = !flag">Toggle Flag
        </button>
        <Test info="你好" v-if="flag"></Test>

        <hr/>

        <div class="box">
            <!-- 渲染 Left 组件和 Right 组件 -->
            <!-- 3. 以标签形式，使用注册好的组件 -->
            <Left></Left>
            <Right></Right>
        </div>
    </div>
</template>

<script>
    // 1. 导入需要使用的 .vue 组件
    import Left from '@/components/Left.vue'
    import Right from '@/components/Right.vue'
    import Test from '@/components/Test.vue'

    export default {
        data() {
            return {
                flag: true
            }
        },
        // 2. 注册组件
        components: {
            Left,
            Right,
            Test
        }
    }
</script>
```

### 通过components 注册的是私有子组件

> 在组件A 的components 节点下，注册了组件F。则组件F 只能用在组件A 中；不能被用在组件C 中。

### 注册全局组件

> 在vue 项目的main.js 入口文件中，通过Vue.component() 方法，可以注册全局组件。

```js
import Test from '@/components/Test.vue'

Vue.component('MyTest', Test)
```

### 组件的props

> props 是组件的自定义属性，在封装通用组件的时候，合理地使用props 可以极大的提高组件的复用性！

```
<script>
    export default {
      props: ['自定义属性A'，'自定义属性B'，'其它自定义属性`... ],
      data(){
        return {}
      }
</script>
```

- props 是只读的
  - vue 规定：组件中封装的自定义属性是只读的，程序员不能直接修改props 的值。否则会直接报错
  - 要想修改props 的值，可以把props 的值转存到data 中，因为data 中的数据都是可读可写的！

- props 的default 默认值
- props 的type 值类型
- props 的required 必填项

```
  props: {
    init: {
      default: 0,
      type: Number,
      required: true
    }
  }
```

### style 节点的scoped 属性

> 为了提高开发效率和开发体验，vue 为style 节点提供了scoped 属性，从而防止组件之间的样式冲突问题

```
<style scoped>
</style>
```

#### /deep/ 样式穿透

> 如果给当前组件的style 节点添加了scoped 属性，则当前组件的样式对其子组件是不生效的。如果想让某些样 式对子组件生效，可以使用/deep/ 深度选择器。

# 生命周期& 生命周期函数

> 生命周期（Life Cycle）是指一个组件从创建-> 运行-> 销毁的整个阶段，强调的是一个时间段。
>
> 生命周期函数：是由vue 框架提供的内置函数，会伴随着组件的生命周期，自动按次序执行。
>
> 注意：生命周期强调的是时间段，生命周期函数强调的是时间点。

## 组件生命周期函数的分类

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202062018.png)

## 生命周期图示

> 可以参考vue 官方文档给出的“生命周期图示”，进一步理解组件生命周期执行的过程：
(https://cn.vuejs.org/v2/guide/instance.html#生命周期图示)


![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/lifecycle.png)

# 组件之间的数据共享

组件之间的最常见的关系:

- 父子关系
- 兄弟关系

## 父子组件之间的数据共享

- 子 -> 父
- 父 -> 子

### 父组件向子组件共享数据

> 父组件向子组件共享数据需要使用**自定义属性**。

```
//父组件
<Son :msg="message" :user="userinfo"></Son>
data() {
  return {
  message: "hello vue.js ' ,
  userinfo: { name: 'zs', age: 20 }
  }
}
```

```
<template>
  <div>
    <h5>Son组件</h5>
    <p>父组件传递过来的 msg 值是: f{ msg }}</p>
    <p>父组件传递过来的 user 值是:f{ user }}</p>
  </div>
</template>
props:[ 'msg', 'user']
```

### 子组件向父组件共享数据

> 子组件向父组件共享数据使用自定义事件。

```
//子组件
export default {
  data() {
    return { count: 0 }
  },
  methods: {
  add() {
    this.count += 1
    //修改数据时，通过$emit(）触发自定义事件
    this.$emit('numchange', this.count)}
  }
}
```

```
//父组件
<Son @numchange="getNewCount"></Son>
export default {
  data() {
    return { countFromSon: 0 }
  },
  methods: {
    getNewCount(val) {
      this.count += 1
      this.countFromSon = val
    }
  }
}
```

### 兄弟组件之间的数据共享

> 在vue2.x 中，兄弟组件之间数据共享的方案是EventBus。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202205722.png)

> EventBus 的使用步骤
>
> - 创建eventBus.js 模块，并向外共享一个Vue 的实例对象
> - 在数据发送方，调用bus.$emit('事件名称', 要发送的数据) 方法触发自定义事件
> - 在数据接收方，调用bus.$on('事件名称', 事件处理函数) 方法注册一个自定义事件

# ref 引用

> 每个vue 的组件实例上，都包含一个$refs 对象，里面存储着对应的DOM 元素或组件的引用。默认情况下， 组件的$refs 指向一个空对象。

## 使用ref 引用DOM 元素

```
<h3 ref="myh3">MyRef 组件</h3>
<button @click="getRef">获取$refs引用</button>

methods: {
  getRef() {
    //通过 this.$refs.引用的名称可以获取到DOM元素的引用console.log(this.$refs.myh3)
    //操作DOM元素，把文本颜色改为红色
    this.$refs.myh3.style.color = 'red'
  }，
}

```

## 使用ref 引用组件实例

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202210331.png)

## this.$nextTick(cb) 方法

> 组件的$nextTick(cb) 方法，会把cb 回调推迟到下一个DOM 更新周期之后执行。通俗的理解是：等组件的DOM 更新完成之后，再执行cb 回调函数。从而能保证cb 回调函数可以操作到最新的DOM 元素。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202210500.png)

# 动态组件& 插槽& 自定义指令

# 动态组件

> 动态组件指的是动态切换组件的显示与隐藏。

### 实现动态组件渲染

> vue 提供了一个内置的 <component> 组件，专门用来实现动态组件的渲染。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202210706.png)

### 使用keep-alive 保持状态

> 默认情况下，切换动态组件时无法保持组件的状态。此时可以使用 vue 内置的 <keep-alive> 组件保持动态组件的状态。

```
<keep-alive>
  <component :is="comName">
  </component>
</keep-alive>
```

### keep-alive 对应的生命周期函数

> 当组件被缓存时，会自动触发组件的 deactivated 生命周期函数。

> 当组件被激活时，会自动触发组件的 activated 生命周期函数。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202210951.png)

### keep-alive 的include 属性

> include 属性用来指定：只有名称匹配的组件会被缓存。多个组件名之间使用英文的逗号分隔

```
<keep-alive include="MyLeft,MyRight">
  <component :is="comName">
  </component>
</keep-alive>
```

# 插槽

> 插槽（Slot）是 vue 为组件的封装者提供的能力。允许开发者在封装组件时，把不确定的、希望由用户指定的部分定义为插槽。

> 可以把插槽认为是组件封装期间，为用户预留的内容的占位符。

## 体验插槽的基础用法

> 在封装组件时，可以通过 <slot> 元素定义插槽，从而为用户预留内容占位符。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202211352.png)

> 没有预留插槽的内容会被丢弃

## 后备内容

> 封装组件时，可以为预留的 <slot> 插槽提供后备内容（默认内容）。如果组件的使用者没有为插槽提供任何内容，则后备内容会生效。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202211527.png)

## 具名插槽

> 如果在封装组件时需要预留多个插槽节点，则需要为每个 <slot> 插槽指定具体的 name 名称。这种带有具体名称的插槽叫做“具名插槽”。

> 注意：没有指定 name 名称的插槽，会有隐含的名称叫做 “default”。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202211618.png)


### 为具名插槽提供内容

> 在向具名插槽提供内容的时候，我们可以在一个 <template> 元素上使用 v-slot 指令，并以 v-slot 的参数的形式提供其名称。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202211746.png)

### 具名插槽的简写形式

> 跟 v-on 和 v-bind 一样，v-slot 也有缩写，即把参数之前的所有内容 (v-slot:) 替换为字符 #。例如 v-slot:header可以被重写为 #header

## 作用域插槽

> 在封装组件的过程中，可以为预留的 <slot> 插槽绑定 props 数据，这种带有 props 数据的 <slot> 叫做“作用域插槽”。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202211946.png)

### 使用作用域插槽

> 可以使用 v-slot: 的形式，接收作用域插槽对外提供的数据。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202212139.png)

### 解构插槽Prop

> 作用域插槽对外提供的数据对象，可以使用解构赋值简化数据的接收过程。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202212726.png)

# 自定义指令

> vue 官方提供了 v-text、v-for、v-model、v-if 等常用的指令。除此之外 vue 还允许开发者自定义指令。

## 自定义指令的分类

- 私有自定义指令
- 全局自定义指令

## 私有自定义指令

> 在每个 vue 组件中，可以在 directives 节点下声明私有自定义指令。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202212914.png)

### 使用自定义指令

> 在使用自定义指令时，需要加上 v- 前缀。

### 为自定义指令动态绑定参数值

> 在 template 结构中使用自定义指令时，可以通过等号（=）的方式，为当前指令动态绑定参数值

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202213311.png)


### 通过binding 获取指令的参数值

> 通过binding 获取指令的参数值

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202213449.png)


### update 函数

> 自定义指令7. update 函数bind 函数只调用 1 次：当指令第一次绑定到元素时调用，当 DOM 更新时 bind 函数不会被触发。 update 函数会在每次 DOM 更新时被调用。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202213537.png)

### 函数简写

> 如果 insert 和update 函数中的逻辑完全相同，则对象格式的自定义指令可以简写成函数格式

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202213724.png)

## 全局自定义指令

> 全局共享的自定义指令需要通过“Vue.directive()”进行声明

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202213915.png)

# 路由

> 路由（英文：router）就是对应关系。

## 前端路由

> Hash 地址与组件之间的对应关系。

### 前端路由的工作方式

- 用户点击了页面上的路由链接
- 导致了 URL 地址栏中的 Hash 值发生了变化
- 前端路由监听了到 Hash 地址的变化
- 前端路由把当前 Hash 地址对应的组件渲染都浏览器中


### 实现简易的前端路由

- 步骤1：通过 <component> 标签 的is属性切换组件
- 步骤2：在 App.vue 组件中，为 <a> 链接添加对应的 hash 值
- 步骤3：在 created 生命周期函数中，监听浏览器地址栏中 hash 地址的变化，动态切换要展示的组件的名称(window.onhashchange)

##  vue-router

> vue-router 是 vue.js 官方给出的路由解决方案。它只能结合 vue 项目进行使用，能够轻松的管理 SPA 项目中组件的切换。

> vue-router 的官方文档地址：https://router.vuejs.org/zh/


```
// 安装 vue2中
npm i vue-router@3.5.2 -S
```

### 创建路由模块

> 在 src 源代码目录下，新建 router/index.js 路由模块

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202215014.png)

### 导入并挂载路由模块

> 在 src/main.js 入口文件中，导入并挂载路由模块。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202215050.png)

### 声明路由链接和占位符

> 在 src/App.vue 组件中，使用 vue-router 提供的 <router-link> 和 <router-view> 声明路由链接和占位符

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202215349.png)

### 声明路由的匹配规则

> 在 src/router/index.js 路由模块中，通过 routes 数组声明路由的匹配规则。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202215439.png)


## vue-router 的常见用法

### 路由重定向

> 路由重定向指的是：用户在访问地址 A 的时候，强制用户跳转到地址 C ，从而展示特定的组件页面。
> 
> 通过路由规则的 redirect 属性，指定一个新的路由地址，可以很方便地设置路由的重定向


![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202215610.png)


### 嵌套路由

> 通过路由实现组件的嵌套展示，叫做嵌套路由。

#### 声明子路由链接和子路由占位符

> 在 About.vue 组件中，声明 tab1 和 tab2 的子路由链接以及子路由占位符。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202215734.png)

#### 通过children 属性声明子路由规则

> 在 src/router/index.js 路由模块中，导入需要的组件，并使用 children 属性声明子路由规则

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202215821.png)


## 动态路由匹配

> 动态路由指的是：把 Hash 地址中可变的部分定义为参数项，从而提高路由规则的复用性。
> 
> 在 vue-router 中使用英文的冒号（:）来定义路由的参数项。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202215922.png)

### $route.params 参数对象

> 在动态路由渲染出来的组件中，可以使用 this.$route.params 对象访问到动态匹配的参数值

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202220153.png)

### 使用props 接收路由参数

> 为了简化路由参数的获取形式，vue-router 允许在路由规则中开启 props 传参。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202220309.png)

## 声明式导航& 编程式导航

- 在浏览器中，点击链接实现导航的方式，叫做声明式导航。
  - 例如：普通网页中点击 <a> 链接、vue 项目中点击 <router-link> 都属于声明式导航

- 在浏览器中，调用 API 方法实现导航的方式，叫做编程式导航。
  - 例如：普通网页中调用 location.href 跳转到新页面的方式，属于编程式导航

## vue-router 中的编程式导航API

- this.$router.push('hash 地址')
  - 跳转到指定 hash 地址，并增加一条历史记录
- this.$router.replace('hash 地址')
  - 跳转到指定的 hash 地址，并替换掉当前的历史记录
- this.$router.go(数值 n) (-1,1)
  - 实现导航历史前进、后退

### $router.go 的简化用法

> 在实际开发中，一般只会前进和后退一层页面。
> 因此 vue-router 提供了如下两个便捷方法：

- $router.back()
  - 在历史记录中，后退到上一个页面
- $router.forward()
  - 在历史记录中，前进到下一个页面


## 导航守卫

> 导航守卫可以控制路由的访问权限。

### 全局前置守卫

> 每次发生路由的导航跳转时，都会触发全局前置守卫。

> 因此，在全局前置守卫中，程序员可以对每个路由进行访问权限的控制

### 守卫方法的3 个形参

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202221136.png)

### next 函数的3 种调用方式

- 当前用户拥有后台主页的访问权限，直接放行：next()
- 当前用户没有后台主页的访问权限，强制其跳转到登录页面：next('/login')
- 当前用户没有后台主页的访问权限，不允许跳转到后台主页：next(false)

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202221234.png)

### 控制后台主页的访问权限

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202221435.png)
















