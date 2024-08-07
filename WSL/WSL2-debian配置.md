# WSL2-debian配置

```shell
# 换源
# 如果 /etc/apt/sources.list.bak 存在 ,则不做备份
# 如果 $HOME/my_conf 存在 ,则下方所以配置,全部不做
if [ ! -f "$HOME/my_conf_wsl_init" ]; then
  
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

echo "" > /etc/apt/sources.list
cat << EOF >> /etc/apt/sources.list
deb http://mirrors.aliyun.com/debian bookworm main
deb http://mirrors.aliyun.com/debian bookworm-updates main
deb http://mirrors.aliyun.com/debian-security bookworm-security main
deb http://mirrors.aliyun.com/debian bookworm-backports main
EOF

sudo apt update
#sudo apt upgrade -y
sudo apt install -y vim 

# vim 设置行号
cat << EOF >> /etc/vim/vimrc
set number
EOF

sudo apt install -y gcc g++ make cmake gdb fonts-firacode

# 设置代理 (如果需要)
sudo touch /etc/proxy.sh
> /etc/proxy.sh
cat << EOF >> /etc/proxy.sh
# 个人代理的端口
port=8888
host_ip=$(cat /etc/resolv.conf | grep "nameserver" |cut -f 2 -d " ") 
export ALL_PROXY="socks5://$host_ip:$port"
export all_proxy="$ALL_PROXY"

export http_proxy="http://$host_ip:$port"
export https_proxy="$http_proxy"
export HTTP_PROXY="$http_proxy"
export HTTPS_PROXY="$http_proxy"
EOF

sudo cat << EOF >> /etc/profile
. /etc/proxy.sh
EOF
source /etc/profile


cat << EOF >> $HOME/.bashrc
export PS1="$PS1 \n\$ "
EOF

sudo cat << EOF >> /root/.bashrc
export PS1="$PS1 \n\$ "
EOF

touch $HOME/my_conf_wsl_init
fi 


```