# WSL

### 查看当前环境安装的wsl

`wsl --list`

`wsl --list --verbose`

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

`wsl.exe --install  -d <Distro>`

### 查看所有分发版本

`wsl -l --all -v `

## 使用

### 更改发行版的默认用户

`<DistributionName> config --default-user <Username>`

> 例如 : ubuntu config --default-user johndoe

### 以特定用户的身份运行

`wsl -u <Username>`, `wsl --user <Username>`

### 通过 PowerShell 或 CMD 运行特定的 Linux 发行版

`wsl --distribution <Distribution Name> --user <User Name>`

### 将 WSL 版本设置为 1 或 2

`wsl --set-version <distribution name> <versionNumber>`

### 设置默认 WSL 版本

`wsl --set-default-version <Version> `

### 设置默认发行版

`wsl --set-default <Distro>`

`wsl -s <Distro>`

## 卸载

### 注销（卸载）当前安装的 Linux 的 Windows 子系统

> 例如: wsl --unregister Ubuntu

`wsl --unregister Ubuntu`

## 关闭

`wsl --shutdown`

## 导入和导出发行版

```
wsl --export <Distribution Name> <FileName>

wsl --import <Distribution Name> <InstallLocation> <FileName>

wsl --export Ubuntu-20.04 D:\ubuntu20.04.tar 

wsl --import Ubuntu-20.04 D:\wsl\ubuntu D:\ubuntu20.04.tar --version 2

```

## wsl 如何去掉 windows 的环境变量

- 在 wsl 下新建 `/etc/wsl.conf` 配置文件,添加如下内容

```
[interop]
appendWindowsPath = false
```

- 在 powershell 执行以下命令，重启 wsl 即可

```
wsl --terminate <distro>

eg: wsl --terminate debian
```
