# 7Zip

### 极限枷锁命令

``` shell
7z a -t7z newPack.7z "F:\14_newWork\7z\testDoc*" 
    -r -mx=9 -m0=LZMA2 -ms=10m -mf=on -mhc=on -mmt=on -sdel
```

- `7z` 是命令行工具
- `a` 表示新建一个压缩文件
- `-t7z` 表示使用的压缩类型是 7z
- `newPack.7z` 是新建的压缩文件的名字
- `F:\14_newWork\7z\testDoc*` 表示把该目录下的所有的文件都执行压缩操作，添加到压缩文件中
- `-mx=9` 表示设置压缩等级为极限压缩
- `-sdel` 压缩之后删除源文件

### 解压命令

``` shell

# 指定解压到的文件夹 output_directory
7z x -o"output_directory" source_file.7z

# 解压到当前目录
7z x  source_file.7z
```