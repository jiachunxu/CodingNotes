# C语言

## 数组和指针

``` C
// 数组指针
int (*pz)[2]; // pz指向一个内含两个int类型值的数组

// 指针数组
int *pax[2]; // pax是一个内含两个指针元素的数组，每个元素都指向int的指针
```

### const char *、char const*、char *const三者的区别

- char const * : 可修改指向,指向常量
- const char * : 同上
- char *const : 不允许修改指向,可修改数据
- const char * const s : 不可修改指向,不可修改指向数据 