# caperjs-docker
##简介
> casperjs-docker 集成了nodejs, phantomjs, casperjs, java8等环境，方便构建一个快速用语使用的casperjs环境，或用户jenkins任务调度集成。

##使用casperjs-docker
```
docker run -it -p 5022:22 wangkangluo1/casperjs-docker
```
> 5022为ssh端口, 用户名/密码: ops/123456

##构建casperjs-docker镜像
*  创建目录

```
mkdir casperjs-docker
```

 * 下载依赖包

```
wget http://roy-public.oss-cn-hangzhou.aliyuncs.com/node-v6.9.2-linux-x64.tar.gz
wget http://roy-public.oss-cn-hangzhou.aliyuncs.com/phantomjs-2.1.1-linux-x86_64.tar.bz2
```

* 创建casperjs-docker镜像

```
 docker build -t casperjs-docker:1.0 ./
```





