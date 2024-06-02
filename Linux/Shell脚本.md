# Shell 脚本

### 声明局部变量 local

### 获取脚本所在目录的绝对路径

``` shell
# 脚本所在目录, 绝对路径
get_sh_path(){
    echo $(cd $(dirname $0); pwd)
}
path=`get_sh_path`
echo $path
```

### 并行任务

#### 安装 parallel

``` apt install parallel ```

#### 使用 parallel

``` shell
parallel --jobs 4 --progress < task_list.txt

```