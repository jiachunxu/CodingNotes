# WSL2-Debian设置代理

## 1

``` shell
#创建 proxy.sh 脚本

port=8888
host_ip=$(cat /etc/resolv.conf | grep "nameserver" |cut -f 2 -d " ") 
export ALL_PROXY="socks5://$host_ip:$port"
export all_proxy="$ALL_PROXY"

export https_proxy="https://$host_ip:$port"
export http_proxy="$https_proxy"
export HTTP_PROXY="$https_proxy"
export HTTPS_PROXY="$https_proxy"
```

## 2

``` shell
添加到 ~/.bashrc 或者 /etc/profile  或者 /etc/bash.bashrc

source /etc/proxy.sh 或 . /etc/proxy.sh

```