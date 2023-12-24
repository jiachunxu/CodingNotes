# WSL

### 查看当前环境安装的wsl

`wsl --list
`

## 安装

### 查看可安装的Linux的Windows子系统

`wsl --list --online`

``` cmd
C:\Users\adminjia>wsl --list --online
以下是可安装的有效分发的列表。
使用 'wsl.exe --install <Distro>' 安装。

NAME                                   FRIENDLY NAME
Ubuntu                                 Ubuntu
Debian                                 Debian GNU/Linux
kali-linux                             Kali Linux Rolling
Ubuntu-18.04                           Ubuntu 18.04 LTS
Ubuntu-20.04                           Ubuntu 20.04 LTS
Ubuntu-22.04                           Ubuntu 22.04 LTS
OracleLinux_7_9                        Oracle Linux 7.9
OracleLinux_8_7                        Oracle Linux 8.7
OracleLinux_9_1                        Oracle Linux 9.1
openSUSE-Leap-15.5                     openSUSE Leap 15.5
SUSE-Linux-Enterprise-Server-15-SP4    SUSE Linux Enterprise Server 15 SP4
SUSE-Linux-Enterprise-15-SP5           SUSE Linux Enterprise 15 SP5
openSUSE-Tumbleweed                    openSUSE Tumbleweed
```

### 安装默认发行版

> 默认为 Ubuntu

`wsl --install`

### 安装有效发行版

`wsl.exe --install <Distro>`

## 使用

### 设置默认发行版

`wsl --set-default <Distro>`

`wsl -s <Distro>`

## 卸载

### 注销（卸载）当前安装的 Linux 的 Windows 子系统

`wsl --unregister Ubuntu`