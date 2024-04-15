# Semaphore使用

## 函数原型

`sem_init` 函数是 POSIX 标准中定义的用于初始化信号量的一个函数。该函数的原型如下：

```c
int sem_init(sem_t *sem, int pshared, unsigned int value);
```

每个参数的含义如下：

1. `sem_t *sem`: 这是一个指向 `sem_t` 类型的指针，它表示要初始化的信号量对象。在调用 `sem_init`
   函数之前，这个指针应该已经被分配了内存。这个信号量可以是命名的也可以是未命名的，具体取决于是否使用了 `sem_open`
   函数来获取信号量的引用。

2. `int pshared`: 这个参数决定了信号量是进程内使用还是跨进程使用。它是一个整数，可以取以下两个值之一：
    - `0`: 表示信号量仅用于创建它的进程内部。这是默认值，如果设置为 `0`，其他进程将无法访问这个信号量。
    - `SEMAPHORE_PROCESS_SHARED`:
      表示信号量可以在多个进程之间共享。如果你希望信号量能够在不同的进程间进行同步，你应该将这个参数设置为 `SEMAPHORE_PROCESS_SHARED`
      。请注意，这个值可能依赖于具体的操作系统和库的实现。

3. `unsigned int value`:
   这个参数指定了信号量的初始值。信号量的值代表可用的资源数量。当信号量被初始化时，所有的线程或进程必须等待直到信号量的值大于零才能继续执行。这个值必须在 `0`
   和 `SEM_VALUE_MAX` 之间，`SEM_VALUE_MAX` 是一个在 `<semaphore.h>` 头文件中定义的常量，表示信号量的最大值。

如果 `sem_init` 调用成功，它将返回 `0`；如果发生错误，它将返回一个非零的错误码。在使用信号量之后，应该使用 `sem_destroy`
函数来销毁它，以释放相关资源。

## 代码实例

``` C
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <semaphore.h>

sem_t p;
int num = 0;

void *task() {
    sem_wait(&p);

    // 需要同步的任务内容
    printf("线程 t%d 开始运行 \n", num++);
    sleep(3);
    // 任务完成
    sem_post(&p);
    return NULL;
}

int main(int argc, char const *argv[]) {
    // 初始化信号量，设置初始值为3
    if (sem_init(&p, 0, 3) == -1) {
        perror("sem_init failed");
        return 1;
    }

    pthread_t tid[10];
    for (int i = 0; i < 10; i++) {
        pthread_create(&tid[i], NULL, task, NULL);
    }
    // 等待任务完成
    for (int i = 0; i < 10; i++) {
        pthread_join(tid[i], NULL);

    }
    if (sem_destroy(&p) == -1) {
        perror("sem_destroy failed");
        return 1;
    }
    return 0;
}
```