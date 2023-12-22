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

## 指定输出路径

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

# 指定库目录
link_directories($PROJECT_SOURCE_DIR}/a) 
# 指定库名
link_libraries(animal)
```




