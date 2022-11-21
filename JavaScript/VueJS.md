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
















