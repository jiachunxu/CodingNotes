# Vue3

## vue3.x 和 vue2.x 版本的对比

> vue2.x 中绝大多数的 API 与特性，在 vue3.x 中同样支持。
>
> 同时，vue3.x 中还新增了 3.x 所特有的功能、并废弃了某些 2.x 中的旧功能
>
> 新增的功能例如：组合式 API、多根节点组件、更好的 TypeScript 支持等
>
> 废弃的旧功能如下：过滤器、不再支持 $on，$off 和 $once 实例方法等

详细的变更信息，请参考官方文档给出的迁移指南：https://v3.vuejs.org/guide/migration/introduction.html

## 单页面应用程序

> 单页面应用程序（英文名：Single Page Application）简称 SPA

### 单页面应用程序的特点

> 单页面应用程序将所有的功能局限于一个 web 页面中，仅在该 web 页面初始化时加载相应的资源（ HTML、JavaScript 和 CSS）。
>
> 一旦页面加载完成了，SPA 不会因为用户的操作而进行页面的重新加载或跳转。而是利用 JavaScript 动态地变换HTML 的内容，从而实现页面与用户的交互。

### 单页面应用程序的优点

- 良好的交互体验
  - 单页应用的内容的改变不需要重新加载整个页面
  - 获取数据也是通过 Ajax 异步获取
  - 没有页面之间的跳转，不会出现“白屏现象”
- 良好的前后端工作分离模式
  - 后端专注于提供 API 接口，更易实现 API 接口的复用
  - 前端专注于页面的渲染，更利于前端工程化的发展
- 减轻服务器的压力
  - 服务器只提供数据，不负责页面的合成与逻辑的处理，吞吐能力会提高几倍

### 单页面应用程序的缺点

- 首屏加载慢
  - 路由懒加载
  - 代码压缩
  - CDN 加速
  - 网络传输压缩
- 不利于 SEO(搜索引擎优化)
  - SSR 服务器端渲染

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

```js
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
> v-model   外接数据变化会同步到子组件


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
import { createRouter, createWebHashHistory } from 'vue-router'

const router = createRouter({
    history: createWebHashHistory(),
    routes: [
        { path: '/', redirect: '/login' },
        { path: '/login', component: Login, name: 'login' },
        {
            path: '/home',
            redirect: '/home/users',
            component: Home,
            name: 'home',
            children: [
                { path: 'settings', component: Settings },
                { path: 'users/:id', component: UserDetail, props: true },
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
  <router-link to="home"> </router-link> 
  <router-link to="home"> </router-link>
  
  <router-view> </router-view>
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





































