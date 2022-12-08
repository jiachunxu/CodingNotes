# Vue3

## vue3.x 和 vue2.x 版本的对比

> vue2.x 中绝大多数的 API 与特性，在 vue3.x 中同样支持。
>
> 同时，vue3.x 中还新增了 3.x 所特有的功能、并废弃了某些 2.x 中的旧功能
>
> 新增的功能例如：组合式 API、多根节点组件、更好的 TypeScript 支持等
>
> 废弃的旧功能如下：过滤器、不再支持 $on，$off 和 $once 实例方法等

> 详细的变更信息，请参考官方文档给出的迁移指南：
> https://v3.vuejs.org/guide/migration/introduction.html

## 创建项目

> vue create 项目名称 (vue-cli)

> npm create vue@3 (vite)

## Vue组件

- template -> 组件的模板结构 (支持多根节点)
- script -> 组件的 JavaScript 行为
- style -> 组件的样式

### 让style 中支持less 语法

> 运行 npm install less -D 命令安装依赖包，从而提供 less 语法的编译支持

> 在 `<style>` 标签上添加 lang="less" 属性，即可使用 less 语法编写组件的样式

### 全局注册组件

``` js
//main.js

import {createApp} from 'vue'

import App from './components/App.vue'
import Test from './components/01.globalReg/Test.vue'

const app = createApp(App)
app.component(Test.name, Test)

app.mount('#app')
```

### /deep/ 样式穿透 (:deep() )

> /deep/ 是 vue2.x 中实现样式穿透的方案。在 vue3.x 中推荐使用 :deep() 替代 /deep/。

## props

> v-bind 属性绑定 (父传子)
>
> v-model 外接数据变化会同步到子组件

## 自定义事件

> 在封装组件时，为了让组件的使用者可以监听到组件内状态的变化，此时需要用到组件的自定义事件。

### 自定义事件的3 个使用步骤

> 在封装组件时：

- 声明自定义事件
- 触发自定义事件

> 在使用组件时：

- 监听自定义事件

### 声明自定义事件

> 开发者为自定义组件封装的自定义事件，必须事先在 emits 节点中声明

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203215831.png)

### 触发自定义事件

> 在 emits 节点下声明的自定义事件，可以通过 this.$emit('自定义事件的名称') 方法进行触发

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203215927.png)

### 监听自定义事件

> 在使用自定义的组件时，可以通过 v-on 的形式监听自定义事件

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203220156.png)

### 自定义事件传参

> 在调用 this.$emit() 方法触发自定义事件时，可以通过第 2 个参数为自定义事件传参

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203220300.png)

# 组件之间的数据共享

## 组件之间的关系

- 父子关系
- 兄弟关系
- 后代关系

## 父子组件之间的数据共享

> 父子组件之间的数据共享又分为：

- 父 -> 子共享数据
- 子 -> 父共享数据
- 父 <-> 子双向数据同步

### 父组件向子组件共享数据

> 父组件通过 v-bind 属性绑定向子组件共享数据。同时，子组件需要使用 props 接收数据。

### 子组件向父组件共享数据

> 子组件通过自定义事件的方式向父组件共享数据。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203222409.png)

### 父子组件之间数据的双向同步

> 父组件在使用子组件期间，可以使用 v-model 指令维护组件内外数据的双向同步

## 兄弟组件之间的数据共享

> 兄弟组件之间实现数据共享的方案是 EventBus。可以借助于第三方的包 mitt 来创建 eventBus 对象，从而实现兄弟组件之间的数据共享。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203222716.png)

### 安装mitt 依赖包

`npm install mitt@2.1.0`

### 创建公共的EventBus 模块

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203222916.png)

### 在数据接收方自定义事件

> 在数据接收方，调用 bus.on('事件名称', 事件处理函数) 方法注册一个自定义事件。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203223024.png)

### 在数据接发送方触发事件

> 在数据发送方，调用 bus.emit('事件名称', 要发送的数据) 方法触发自定义事件。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203223226.png)

## 后代关系组件之间的数据共享

> 后代关系组件之间共享数据，指的是父节点的组件向其子孙组件共享数据。此时组件之间的嵌套关系比较复杂，可以使用 provide 和 inject 实现后代关系组件之间的数据共享。

### 父节点通过provide 共享数据

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203223500.png)

### 子孙节点通过inject 接收数据

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203223544.png)

### 父节点对外共享响应式的数据

> 父节点使用 provide 向下共享数据时，可以结合 computed 函数向下共享响应式的数据。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203223657.png)

### 子孙节点使用响应式的数据

> 如果父级节点共享的是响应式的数据，则子孙节点必须以 .value 的形式进行使用。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203223738.png)

## Vuex

## Pinia

## vue 3.x 中全局配置axios

> 在 main.js 入口文件中，通过 app.config.globalProperties 全局挂载 axios

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203225922.png)

# vue-router

`npm install vue-router@4`

## vue-router 的基本用法

```js
import {createRouter, createWebHashHistory} from 'vue-router'

const router = createRouter({
    history: createWebHashHistory(),
    routes: [
        {path: '/', redirect: '/login'},
        {path: '/login', component: Login, name: 'login'},
        {
            path: '/home',
            redirect: '/home/users',
            component: Home,
            name: 'home',
            children: [
                {path: 'settings', component: Settings},
                {path: 'users/:id', component: UserDetail, props: true},
            ],
        },
    ],
})

// 全局路由导航守卫
router.beforeEach((to, from, next) => {
    // 判断用户访问的是否为登录页
    if (to.path === '/login') return next()
    // 获取 token 值
    const tokenStr = localStorage.getItem('token')
    if (!tokenStr) {
        next('/login')
    } else {
        next()
    }
})

export default router
```

```js
<template>
    <router-link to="home"></router-link>
    <router-link to="home"></router-link>

    <router-view></router-view>
</template>
```

## vue-router 的高级用法

### 自定义路由高亮的class 类

> 在创建路由的实例对象时，开发者可以基于 linkActiveClass 属性，自定义路由链接被激活时所应用的类名

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203232743.png)

### 动态路由

> 把 Hash 地址中可变的部分定义为参数项，从而提高路由规则的复用性。在 vue-router 中使用英文的冒号（:）来定义路由的参数项。

#### $route.params 参数对象

> 通过动态路由匹配的方式渲染出来的组件中，可以使用 $route.params 对象访问到动态匹配的参数值

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203233026.png)

#### 使用props 接收路由参数

> 为了简化路由参数的获取形式，vue-router 允许在路由规则中开启 props 传参。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203233137.png)

### 命名路由

> 通过 name 属性为路由规则定义名称的方式，叫做命名路由。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203233300.png)

> 注意：命名路由的 name 值不能重复，必须保证唯一性！

### vue-router 中的编程式导航API

- this.$router.push('hash 地址')
- this.$router.go(数值 n)

### 使用命名路由实现编程式导航

> 调用 push 函数期间指定一个配置对象，name 是要跳转到的路由规则、params 是携带的路由参数

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221203233808.png)

---

# 组合式API (Composition API)

## setup

> Vue3.0中一个新的配置项，值为一个函数。

> 组件中所用到的：数据、方法等等，均要配置在setup中。


> setup函数的两种返回值：

- 若返回一个对象，则对象中的属性、方法, 在模板中均可以直接使用。（重点关注！）
- 若返回一个渲染函数：则可以自定义渲染内容。（了解）</span>

### setup的两个注意点

- setup执行的时机
  - 在beforeCreate之前执行一次，this是undefined。

- setup的参数
  - props：值为对象，包含：组件外部传递过来，且组件内部声明接收了的属性。
  - context：上下文对象
    - attrs: 值为对象，包含：组件外部传递过来，但没有在props配置中声明的属性, 相当于 ```this.$attrs```。
    - slots: 收到的插槽内容, 相当于 ```this.$slots```。
    - emit: 分发自定义事件的函数, 相当于 ```this.$emit```。

> **注意**：

1. 尽量不要与Vue2.x配置混用

- Vue2.x配置（data、methods、computed...）中可以访问到setup中的属性、方法。
- 但在setup中不能访问到Vue2.x配置（data、methods、computed...）。
- 如果有重名, setup优先。

2. setup不能是一个async函数，因为返回值不再是return的对象, 而是promise, 模板看不到return对象中的属性。（后期也可以返回一个Promise实例，但需要Suspense和异步组件的配合）

## ref函数

- 作用: 定义一个响应式的数据

- 语法: ```const xxx = ref(initValue)```
  - 创建一个包含响应式数据的引用对象（reference对象，简称ref对象）。
  - JS中操作数据： ```xxx.value```
  - 模板中读取数据: 不需要.value，直接：```<div>{{xxx}}</div>```
- 备注：
  - 接收的数据可以是：基本类型、也可以是对象类型。
  - 基本类型的数据：响应式依然是靠``Object.defineProperty()``的```get```与```set```完成的。
  - 对象类型的数据：内部 “ 求助 ” 了Vue3.0中的一个新函数—— ```reactive```函数。

## reactive函数

- 作用: 定义一个对象类型的响应式数据（基本类型不要用它，要用```ref```函数）
- 语法：```const 代理对象= reactive(源对象)```接收一个对象（或数组），返回一个代理对象（Proxy的实例对象，简称proxy对象）
- reactive定义的响应式数据是“深层次的”。
- 内部基于 ES6 的 Proxy 实现，通过代理对象操作源对象内部数据进行操作。

## Vue3.0中的响应式原理

### vue2.x的响应式

- 实现原理：
  - 对象类型：通过```Object.defineProperty()```对属性的读取、修改进行拦截（数据劫持）。

  - 数组类型：通过重写更新数组的一系列方法来实现拦截。（对数组的变更方法进行了包裹）。

```js
  Object.defineProperty(data, 'count', {
    get() {
    },
    set() {
    }
})
```

- 存在问题：
  - 新增属性、删除属性, 界面不会更新。
  - 直接通过下标修改数组, 界面不会自动更新。

### Vue3.0的响应式

- 实现原理:
  - 通过Proxy（代理）:  拦截对象中任意属性的变化, 包括：属性值的读写、属性的添加、属性的删除等。
  - 通过Reflect（反射）:  对源对象的属性进行操作。
  - MDN文档中描述的Proxy与Reflect：
    - Proxy：https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Proxy

    - Reflect：https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Reflect

```js
  new Proxy(data, {
    // 拦截读取属性值
    get(target, prop) {
        return Reflect.get(target, prop)
    },
    // 拦截设置属性值或添加新属性
    set(target, prop, value) {
        return Reflect.set(target, prop, value)
    },
    // 拦截删除属性
    deleteProperty(target, prop) {
        return Reflect.deleteProperty(target, prop)
    }
})

proxy.name = 'tom'   
```

## reactive对比ref

-  从定义数据角度对比：
  -  ref用来定义：基本类型数据。
  -  reactive用来定义：对象（或数组）类型数据。
  -  备注：ref也可以用来定义对象（或数组）类型数据, 它内部会自动通过```reactive```转为代理对象。
-  从原理角度对比：
  -  ref通过``Object.defineProperty()``的```get```与```set```来实现响应式（数据劫持）。
  -  reactive通过使用 Proxy 来实现响应式（数据劫持）, 并通过 Reflect 操作 源对象 内部的数据。
-  从使用角度对比：
  -  ref定义的数据：操作数据 需要 ```.value```，读取数据时模板中直接读取 不需要 ```.value```。
  -  reactive定义的数据：操作数据与读取数据：均不需要 ```.value```。

## 计算属性与监视

### computed函数

- 与Vue2.x中computed配置功能一致

- 写法

``` js
  import {computed} from 'vue'
  
  setup(){
      ...
  	//计算属性——简写
      let fullName = computed(()=>{
          return person.firstName + '-' + person.lastName
      })
      //计算属性——完整
      let fullName = computed({
          get(){
              return person.firstName + '-' + person.lastName
          },
          set(value){
              const nameArr = value.split('-')
              person.firstName = nameArr[0]
              person.lastName = nameArr[1]
          }
      })
  }
```

### 2.watch函数

- 与Vue2.x中watch配置功能一致

- 两个小“坑”：

  - 监视reactive定义的响应式数据时：oldValue无法正确获取、强制开启了深度监视（deep配置失效）。
  - 监视reactive定义的响应式数据中某个属性时：deep配置有效。

```js
  //情况一：监视ref定义的响应式数据
  watch(sum,(newValue,oldValue)=>{
  	console.log('sum变化了',newValue,oldValue)
  },{immediate:true})
  
  //情况二：监视多个ref定义的响应式数据
  watch([sum,msg],(newValue,oldValue)=>{
  	console.log('sum或msg变化了',newValue,oldValue)
  }) 
  
  /* 情况三：监视reactive定义的响应式数据
  			若watch监视的是reactive定义的响应式数据，则无法正确获得oldValue！！
  			若watch监视的是reactive定义的响应式数据，则强制开启了深度监视 
  */
  watch(person,(newValue,oldValue)=>{
  	console.log('person变化了',newValue,oldValue)
  },{immediate:true,deep:false}) //此处的deep配置不再奏效
  
  //情况四：监视reactive定义的响应式数据中的某个属性
  watch(()=>person.job,(newValue,oldValue)=>{
  	console.log('person的job变化了',newValue,oldValue)
  },{immediate:true,deep:true}) 
  
  //情况五：监视reactive定义的响应式数据中的某些属性
  watch([()=>person.job,()=>person.name],(newValue,oldValue)=>{
  	console.log('person的job变化了',newValue,oldValue)
  },{immediate:true,deep:true})
  
  //特殊情况
  watch(()=>person.job,(newValue,oldValue)=>{
      console.log('person的job变化了',newValue,oldValue)
  },{deep:true}) //此处由于监视的是reactive素定义的对象中的某个属性，所以deep配置有效
```

### 3.watchEffect函数

- watch的套路是：既要指明监视的属性，也要指明监视的回调。

- watchEffect的套路是：不用指明监视哪个属性，监视的回调中用到哪个属性，那就监视哪个属性。

- watchEffect有点像computed：

  - 但computed注重的计算出来的值（回调函数的返回值），所以必须要写返回值。
  - 而watchEffect更注重的是过程（回调函数的函数体），所以不用写返回值。

```js
  //watchEffect所指定的回调中用到的数据只要发生变化，则直接重新执行回调。
  watchEffect(()=>{
      const x1 = sum.value
      const x2 = person.age
      console.log('watchEffect配置的回调执行了')
  })
```















