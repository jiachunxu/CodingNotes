# 使用 sed 转义 

### 转义 / 为 \/
``` shell
echo "your/string/here" | sed 's/\//\\\//g'
```

### 删除部分字符串 

``` shell
#!/bin/bash  
  
# 原始字符串  
original_string="Hello, world! This is a test."  
# 要删除的子字符串  
substring_to_remove="test"  
# 使用sed命令删除子字符串  
modified_string=$(echo "$original_string" | sed "s/$substring_to_remove//")  
# 输出修改后的字符串  
echo "$modified_string"
```