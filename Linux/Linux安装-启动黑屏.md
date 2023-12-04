# linux 安装黑屏解决

``` 
移动光标到"install ubuntu kylin" , 按"e"进入编辑模式，进入命令行模式, 
找到''quite splash''，在后面添加“nomodeset”，然后按 F10 键安装。
```

# linux 启动黑屏

``` 
1, 进入恢复选项可以启动

2, (单次有用) 移动光标到启动选项 , 按"e"进入编辑模式，进入命令行模式, 
   找到 quite 或 splash 或 quite splash 后面 添加 nomodeset ,
   按输入 Ctrl + X 或 F10 进入启动项（进入系统）
   
3, (永久生效) 编辑 /etc/default/grub 或 /boot/grub/grub.cfg，推荐前者，后者内容复杂，不方便修改。
    vim /etc/default/grub
    找到 GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" ,添加 nomodeset
    保存后, 执行 update-grub 命令

```