# Linux终端tab补全

## 1、安装 bash-completion 包

``` shell
sudo apt install bash-completion
```

## 2、编辑 `/etc/bash.bashrc`

``` shell
vim /etc/bash.bashrc

# 去掉下面代码注释即可 

# enable bash completion in interactive shells
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi
```

## 3、

``` shell
source /etc/bash.bashrc
```