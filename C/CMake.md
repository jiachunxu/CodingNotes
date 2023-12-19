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

cmake -B build
cmake --build build

windows 平台指定生成器
cmake -B build -G "MinGW Makefiles"

linux 默认生成器 Unix Makefiles

```

- CMake Language

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

# file() 搜索源文件

```




