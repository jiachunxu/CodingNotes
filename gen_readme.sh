#!/bin/bash 

# 脚本所在目录, 绝对路径
script_path=$(cd $(dirname "$0") && pwd)  
# echo "脚本所在绝对路径：$script_path"

# 创建或清空readme文件  
new_file="$script_path/readme"

> $new_file

# 跳过包含
substr1="gen_readme"
substr2="README"
# ls 

echo "# CodingNotes" >> $new_file
echo "" >> $new_file

# 遍历当前目录下的所有文件
list_dir(){
    local path="$1"
    for file in $(ls $path); do  
        local full_path="$path/$file" 
        if [[ (-f "$full_path") 
            && ("$full_path" != *$substr1*) 
            && ("$full_path" != *$substr2*)]]; then  
            # 要删除的子字符串  
            remove="$script_path/"   
            # 转义 / 为 \/
            es=$(echo "$remove" | sed 's/\//\\\//g')
            # echo "$es"
            filename=$(basename "$full_path") 
            # 去掉扩展名  
            base_name="${filename%.*}" 
            # echo "-$base_name-" 

            modified_string=$(echo "$full_path" | sed "s/$es//") 
            # echo "$modified_string"


            echo "- [$base_name]($modified_string)" >> $new_file
        elif [ -d "$full_path" ]; then 
            list_dir "$full_path" 
        fi
        # echo "--> $file"
    done  

}


list_dir $script_path

