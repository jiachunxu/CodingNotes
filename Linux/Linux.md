# Linux

# Linux 主要的发行版

- Ubuntu
- RedHat
- CentOS
- Debain
- Fedora
- SUSE
- OpenSUSE

# Xshell Xftp

[Xshell Xftp 家庭/学校免费版 地址](https://www.netsarang.com/en/free-for-home-school/)

# VI VIM

## 常用三种模式

- 正常模式
  - 打开文本文件默认模式
- 插入模式
  - 默认模式按下 `i` 进入插入模式, 编辑文件
- 命令模式
  - 输入完成后, 按 `esc` 输入 `:` 进入命令模式, 例如: 输入 `:wq`,保存并退出

## vi 和 vim 快捷键

- yy : 复制当前一行 5yy : 向下复制5行
- dd : 删除当前行 5dd : 向下删除5行
- 查找单词 命令模式下 `/单词` ,回车 按 `n` 查找下一个
- 设置行号 命令模式下 `:set nu` ,取消行号 `:set nonu`, 也可以操作配置文件 `/etc/vim/vimrc`
- `G` 调到最后一行, `gg` 跳到第一行
- 撤销最近操作 `u`

# 开机、重启和用户登录注销

- `shutdown –h now`   立刻关机
- `shutdown  now`  立刻关机
- `shutdown -h 1` 1分钟后会关机
- `shutdown –r now` 立刻重启
- `halt`   关机
- `reboot` 重启
- `sync`   把内存的数据同步到磁盘.

## 用户登录和注销

- 切换用户 : `su - 用户名`
- 注销用户 : `logout`
  - logout 注销指令在图形运行级别无效

# 用户管理

## 添加用户

- `useradd 用户名`
  - 当创建用户成功后，会自动的创建和用户同名的家目录
  - 也可以通过 `useradd -d 指定目录 新的用户名`，给新创建的用户指定家目录

## 指定/修改密码

- `passwd 用户名`

## 删除用户

- `userdel 用户名`


















































