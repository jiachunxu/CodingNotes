# Git

## [Git官网](https://git-scm.com)

## 初始化设置
```git
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

## 基本命令

|  命令   | 作用  |
|  ----  | ----  |
| `git --version`  | 版本 |
| `git init`  |  初始化本地库 |
| `git add [文件名]`  | 将文件提交到暂存区 |
| `git commit -m "提交信息"`  | 将暂存区的内容提交到本地库 |
| `git status`  | 查看工作区和暂存区状态 |
| `git log`(分页)  | 查看提交日志 下一页：空格 上一页： b|
| `git log --pretty=oneline`  |  |
| `git log --oneline`  | |
| `git reflog` |HEAD@{数字} 回到历史版本需要多少步|
| `git reset` |前进或者后退历史版本|
| `git reset --hard [索引]` |本地库的指针移动，重置暂存区，重置工作区|
| `git reset --mixed [索引]` |本地库的指针移动，重置暂存区，但是工作区不动|
| `git reset --soft [索引]` |本地库的指针移动，暂存区，工作区都不动|
| `git diff [文件名]` |比较工作区和暂存区的文件|
| `git diff [历史版本][文件名] ` |比较暂存区和工作区中内容|

## 分支

同时多个分支可以并行开发，互相不耽误，互相不影响，提高开发效率

|  分支命令   | 作用  |
|  ----  | ----  |
| `git branch -v`  | 查看分支 |
| `git branch [分支名称]`  | 创建分支 |
| `git checkout [分支名称]`  | 创建分支 |
| `git merge [其他分支名称]`  | 当前分支合并其他分支 |

## 远程

|  远程   | 作用  |
|  ----  | ----  |
| `git remote`| 查看远程别名 |
| `git remote -v`| 查看详细 |
| `git remote add origin [远程]`| 添加远程地址,origin为别名 |
| `git push origin master`| 推送到远程,origin为别名,master默认主分支名 |
| `git clone [远程]`  | (1)初始化本地库 |
|   | (2)将远程库内容完整的克隆到本地 |
|  | (3)替我们创建远程库的别名 |
|`git fetch origin master`| 抓取远程,origin为远程别名,master对应远程分支 |
|`git pull origin master`| 抓取远程,=fetch + merge |

