# Python

### 执行命令行

``` python
   cmd = f"7z a -t7z {path}.7z \"{path}\"  -r -mx=9 -m0=LZMA2 -ms=10m -mf=on -mhc=on -mmt=on -sdel"
    # cmd = f"bzip2 --best --force {path}"
    result = subprocess.run(cmd, shell=True,
                            text=True,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE)
    print(result) 
```

### 获取工作目录

``` python
import os
def get_wd(path):
    return os.path.abspath(path)

__file__ : 当前python文件的文件名
get_wd(__file__)
get_wd(".")

```

### 线程池

``` python


from concurrent.futures import ThreadPoolExecutor 

def get_wd(path):
    return os.path.abspath(os.path.expanduser(path))

def task(s: str):
    prefix = "11numbers-"
    subfix = ".txt"
    python_file = get_wd(__file__)
    forld = python_file.replace(os.path.basename(python_file), "")
    full_path = forld + prefix + s + subfix
    with open(full_path, "w") as f:
        for i in range(0, 1_0000_0000):
            lin = s + str(i)
            f.write(lin + "\n")

        f.flush()

    time.sleep(0.1)

    # cmd = f"bzip2 --best --force {full_path}"
    cmd = f"7z a -t7z {full_path}.7z \"{full_path}\"  -r -mx=9 -m0=LZMA2 -ms=10m -mf=on -mhc=on -mmt=on -sdel"
    result = subprocess.run(cmd, shell=True,
                            text=True,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE)
    print(result)


def test():
    thread_pool = ThreadPoolExecutor(max_workers=10, thread_name_prefix="test_")

    for i in range(0, 1000):
        l2 = str(i)
        t1 = "0" * (3 - len(l2)) + l2
        # print(t1)
        thread_pool.submit(task, t1)

    thread_pool.shutdown(wait=True)



```
