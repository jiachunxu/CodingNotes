# WSL2-Debian设置代理

## 1

``` shell
#创建 /etc/proxy.sh 脚本

port=8888
host_ip=$(cat /etc/resolv.conf | grep "nameserver" |cut -f 2 -d " ") 
export ALL_PROXY="socks5://$host_ip:$port"
export all_proxy="$ALL_PROXY"

export http_proxy="http://$host_ip:$port"
export https_proxy="$http_proxy"
export HTTP_PROXY="$http_proxy"
export HTTPS_PROXY="$http_proxy"
```

## 2

``` shell
添加到  /etc/profile  或者 /etc/bash.bashrc

source /etc/proxy.sh 或 . /etc/proxy.sh

```