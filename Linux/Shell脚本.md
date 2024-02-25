# Shell 脚本

### 声明局部变量 local

### 获取脚本所在目录的绝对路径

``` shell
# 脚本所在目录, 绝对路径
script_path=$(cd $(dirname "$0") && pwd)  
echo "脚本所在绝对路径：$script_path"
```

### 并行任务

#### 安装 parallel

``` apt install parallel ```

#### 使用 parallel

``` shell
parallel --jobs 4 --progress < task_list.txt

```