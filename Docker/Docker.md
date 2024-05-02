# Docker

## 安装

## 设置镜像加速

``` shell
// 加速地址 https://7p2usfs2.mirror.aliyuncs.com
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://7p2usfs2.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

```