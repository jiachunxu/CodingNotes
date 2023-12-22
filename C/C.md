# C语言

## 源文件处理过程

- 1.预处理
  - 2.编译
    - 3.汇编
      - 4.链接
        - 5.可执行程序

### 数组指针 和 指针数组

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

## 遍历文件夹 , 判断是否为文件夹

``` C
#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <sys/stat.h>

int is_directory(const char *path) {
    struct stat statbuf;
    if (stat(path, &statbuf) != 0) {
        return 0;
    }
    return S_ISDIR(statbuf.st_mode);
}

void list_directory(const char *path) {

    DIR *dir;
    struct dirent *entry;

    if ((dir = opendir(path)) == NULL) {
        perror("opendir");
        exit(EXIT_FAILURE);
    }
    char next_name[1024] = {0};


    while ((entry = readdir(dir)) != NULL) {
        // 跳过 . 和 ..
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) {
            continue;
        }
        sprintf(next_name, "%s\\%s", path, entry->d_name);
        if (!is_directory(next_name)) {
            puts(next_name);
        } else {
            list_directory(next_name);
        }
    }
    closedir(dir);
}

```

## 获取工作目录

``` C 
#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <sys/stat.h>

void mygetwd(){
    char cwd[1024];
    if (getcwd(cwd, sizeof(cwd)) != NULL) {
        printf("Current working directory: %s\n", cwd);
    } else {
        perror("getcwd() error");
        exit(EXIT_FAILURE);
    }
}
```