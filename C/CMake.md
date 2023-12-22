# CMake

[cmake官网](https://cmake.org/)  https://cmake.org/

- 简单示例 CMakeLists.txt

``` cmake 
cmake_minimum_required(VERSION 3.20)
project(Hello)
add_executable(Hello hello.cpp)
```

``` 
基础命令
cmake . 

cmake -B build
cmake --build build

windows 平台指定生成器
cmake -B build -G "MinGW Makefiles"

linux 默认生成器 Unix Makefiles

```

## 指定c++标准

### 1.在CMakeLists.txt中通过set命令指定

``` cmake
g++ *.cpp -std=c++11-o app

# 相当于 -std=c++11 
set(CMAKE_CXX_STANDARD 11)


```

### 2.在执行cmake命令的时候指定出这个宏的值

``` cmake 
cmake [CMakeLists.txt路径] -DCMAKE_CXX_STANDARD=11 

```

## 指定可执行文件输出路径

``` cmake 
set(HOME /home/... )
set(EXECUTABLE_OUTPUT_PATH ${HOME}/bin )

```

## 搜索源文件

```
# 1.
aux_source_directory(<dir> <var>)
# dir : 指定搜索目录
# var : 源文件列表存储的变量

# 2.file() 
# file(GLOB/GLOB_REUCRSE <变量名> <搜索路径和文件类型>)
file(GLOB SRC ${PROJECT_SOURCE_DIR}/src/*.cpp)
file(GLOB_REUCRSE SRC ${PROJECT_SOURCE_DIR]/src/*.cpp)
# GLOB_REUCRSE 递归搜索

```

## 导入头文件目录

``` 
# 头文件导入
include_directories(${PROJECT_SOURCE_DIR}/include)

```

## 连接库

### 连接静态库

```
# 指定 (动态库/静态)目录
link_directories($PROJECT_SOURCE_DIR}/a) 
# 只能静态库
link_libraries(<库名>)
# 库名可以全名 libxxx.a
# 一般为 xxx
```

### 连接动态库

```
target_link_libraries(
    <target> 
    <PRIVATE/PUBLIC/INTERFACE>  <item>...)

# 建议写到最后,生成可执行文件之后

# (target:指定要加载动态库的文件的名字 )
# (该文件可能是一个源文件 )
# (该文件可能是一个动态库文件 )
# (该文件可能是一个可执行文件)

# <PRIVATE/PUBLIC/INTERFACE> : 动态库访问权限,默认为 PUBLIC 
# 连接库具有传递性 C->B->A ,指定 C 默认包括 A
# PUBLIC : 在 public 后面的库会被 link 到前面的 target 中,并且里面的符号也会被导出,提供给第三方使用。
# PRIVATE : 在 private 后面的库仅被 link 到前面的 target 中,并且终结掉,第三方不能感知你调了啥库 
# INTERFACE : 在 interface 后面引入的库不会被链接到前面的 target 中,只会导出符号。

```

## 制作库文件

> 库文件在使用时需要附带头文件

### 制作静态库

> linux静态库名字构成 : lib + 库名称 + .a

```
# add_library(库名称 STATIC 源文件...)
```

### 制作动态库

> linux静态库名字构成 : lib + 库名称 + .so

```
# add_library(库名称 SHARE 源文件...)
# 生成动态库具有可执行权限
```

### 指定库输出路径

```
# 适用于动态库和静态库
set(LIBRARY_OUTPUT_PATH S{PROJECT_SOURCE_DIR}/lib)

# 只适用于动态库
set(EXECUTABLE_OUTPUT_PATH ${HOME}/lib )

```

## CMake Language

> 运行 .cmake 文件 cmake -P *.cmake

``` 
# 打印信息
message("hello")
message("hello
world")

# 获取Cmake中的信息
# ${}
message(${CMAKE_VERSION})

# 变量区分大小写
# 变量的基础操作是set()与unset()，但你也可以用list或是string操作变量
# set(<variable> <value>. [PARENT_SCOPE])
# set可以给一个变量设置多个值 
# 变量内部存储时使用";"分割,但显示时只进行连接处理

#设置多个值 
set(LISTVALUE al a2) 
message(${LISTVALUE}) 
set(LISTVALUE al;a2) 
message(${LISTVALUE})

# 获取环境变量
# $PATH
message($ENV{PATH})
#设置环境变量
set(ENV{CXX} "g++") 
message($ENV{CXX})

# unset 
unset (ENV{CXX}) 
message($ENV{CXX}) # 报错


```




