# 前端工程化

> 前端工程化指的是：在企业级的前端项目开发中，把前端开发所需的工具、技术、流程、经验等进行规范化、标准化。

> 企业中的 Vue 项目和 React 项目，都是基于工程化的方式进行开发的。

## 前端开发：

- 模块化（js 的模块化、css 的模块化、资源的模块化）
- 组件化（复用现有的 UI 结构、样式、行为）
- 规范化（目录结构的划分、编码规范化、接口规范化、文档规范化、 Git 分支管理）
- 自动化（自动化构建、自动部署、自动化测试）

## 前端工程化的解决方案

### 早期的前端工程化解决方案：

- grunt（ https://www.gruntjs.net/ ）
- gulp（ https://www.gulpjs.com.cn/ ）

### 目前主流的前端工程化解决方案：

- webpack（ https://www.webpackjs.com/ ）
- parcel（ https://zh.parceljs.org/ ）

# webpack

> webpack 是前端项目工程化的具体解决方案。

> 主要功能：它提供了友好的前端模块化开发支持，以及代码压缩混淆、处理浏览器端 JavaScript 的兼容性、性能优化等强大的功能。

> 好处：让程序员把工作的重心放到具体功能的实现上，提高了前端开发效率和项目的可维护性。

> 注意：目前 Vue，React 等前端项目，基本上都是基于 webpack 进行工程化开发的。

## 安装 webpack

`npm  install  webpack@5.42.1  webpack-cli@4.7.2 -D`

## 配置 webpack

- 在项目根目录中，创建名为 webpack.config.js 的 webpack 配置文件，并初始化如下的基本配置

```js
module.exports = {
    mode: 'development' //mode用来指定构建模式。可选值有development和production
}
```

- 在 package.json 的 scripts 节点下，新增 dev 脚本如下

```
"scripts": {
    "dev" : "webpack" //script节点下的脚本，可以通过npm run执行。例如npm run dev
}
```

- 在终端中运行 npm run dev 命令，启动 webpack 进行项目的打包构建

### mode 的可选值

- development
  - 开发环境
  - 不会对打包生成的文件进行代码压缩和性能优化
  - 打包速度快，适合在开发阶段使用
- production
  - 生产环境
  - 会对打包生成的文件进行代码压缩和性能优化
  - 打包速度很慢，仅适合在项目发布阶段使用

### webpack.config.js 文件的作用

> webpack.config.js 是 webpack 的配置文件。webpack 在真正开始打包构建之前，会先读取这个配置文件，从而基于给定的配置，对项目进行打包。

> 注意：由于 webpack 是基于 node.js 开发出来的打包工具，因此在它的配置文件中，支持使用 node.js 相关的语法和模块进行 webpack 的个性化配置。

### webpack 中的默认约定

> 在 webpack 4.x 和 5.x 的版本中，有如下的默认约定：
- 默认的打包入口文件为 src -> index.js
- 默认的输出文件路径为 dist -> main.js

> 注意：可以在 webpack.config.js中修改打包的默认约定


### 自定义打包的入口与出口

> 在 webpack.config.js 配置文件中，通过 entry 节点指定打包的入口。通过 output 节点指定打包的出口。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202030344.png)

## webpack 中的插件

- webpack-dev-server
  - 类似于 node.js 阶段用到的 nodemon(热更新) 工具
  - 每当修改了源代码，webpack 会自动进行项目的打包和构建
- html-webpack-plugin
  - webpack 中的 HTML 插件（类似于一个模板引擎插件）
  - 可以通过此插件自定制 index.html 页面的内容


### webpack-dev-server

webpack-dev-server 可以让 webpack 监听项目源代码的变化，从而进行自动打包构建。

```
npm  install  webpack-dev-server@3.11.2 -D
```

### 配置 webpack-dev-server

- 修改 package.json -> scripts 中的 dev 命令如下：

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202030907.png)

- 再次运行 npm run dev 命令，重新进行项目的打包
- 在浏览器中访问 http://localhost:8080 地址，查看自动打包效果

> 注意：webpack-dev-server 会启动一个实时打包的 http 服务器

### 打包生成的文件哪儿去了

- 不配置 webpack-dev-server 的情况下，webpack 打包生成的文件，会存放到实际的物理磁盘上
  - 严格遵守开发者在 webpack.config.js 中指定配置
  - 根据 output 节点指定路径进行存放
- 配置了 webpack-dev-server 之后，打包生成的文件存放到了内存中
  - 不再根据 output 节点指定的路径，存放到实际的物理磁盘上
  - 提高了实时打包输出的性能，因为内存比物理磁盘速度快很多

### 生成到内存中的文件该如何访问？

webpack-dev-server 生成到内存中的文件，默认放到了项目的根目录中，而且是虚拟的、不可见的。
- 可以直接用 / 表示项目根目录，后面跟上要访问的文件名称，即可访问内存中的文件
- 例如 /bundle.js 就表示要访问 webpack-dev-server 生成到内存中的 bundle.js 文件


## html-webpack-plugin

html-webpack-plugin 是 webpack 中的 HTML 插件，可以通过此插件自定制 index.html 页面的内容

需求：通过 html-webpack-plugin 插件，将 src 目录下的 index.html 首页，复制到项目根目录中一份！

```
npm  install  html-webpack-plugin@5.3.2  -D
```

### 配置 html-webpack-plugin

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202031516.png)


### 解惑 html-webpack-plugin

- 通过 HTML 插件复制到项目根目录中的 index.html 页面，也被放到了内存中
- HTML 插件在生成的 index.html 页面，自动注入了打包的 bundle.js 文件


## webpack  devServer 节点

> 在 webpack.config.js 配置文件中，可以通过 devServer 节点对 webpack-dev-server 插件进行更多的配置

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202031643.png)

> 注意：凡是修改了 webpack.config.js 配置文件，或修改了 package.json 配置文件，必须重启实时打包的服务器，否则最新的配置文件无法生效！



## webpack 中的 loader

### 1. loader 概述

> 在实际开发过程中，webpack 默认只能打包处理以 .js 后缀名结尾的模块。其他非 .js 后缀名结尾的模块，webpack 默认处理不了，需要调用 loader 加载器才可以正常打包，否则会报错！


loader 加载器的作用：协助 webpack 打包处理特定的文件模块。比如：
- css-loader 可以打包处理 .css 相关的文件
- less-loader 可以打包处理 .less 相关的文件
- babel-loader 可以打包处理 webpack 无法处理的高级 JS 语法

### 2. loader 的调用过程

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202031959.png)

### 3. 打包处理 css 文件
- 运行 `npm  i  style-loader@3.0.0  css-loader@5.2.6 -D` 命令，安装处理 css 文件的 loader
- 在 webpack.config.js 的 module -> rules 数组中，添加 loader 规则如下：

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221202032104.png)
> 其中，test 表示匹配的文件类型， use 表示对应要调用的 loader
>
> 注意：
> > ⚫ use 数组中指定的 loader 顺序是固定的
>
> > ⚫多个 loader 的调用顺序是：从后往前调用

### 4. 打包处理 less 文件






