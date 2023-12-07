# Python设置镜像源

## 临时使用

``` 
pip install -i https://mirrors.aliyun.com/pypi/simple <PACKAGE_NAME>

```

## 永久生效

``` 
pip config set global.index-url 'https://mirrors.aliyun.com/pypi/simple' 

```