###概述
LogAgent 是用于将后端数据实时导入到分析系统的工具,Logagent 容器运行时探测的目录为容器内的/data/logs ,该目录挂载NFS存储卷。这样就可以实现容器的无状态漂移，创建容器时不用指定主机运行。

###使用示例
1. 构建镜像
```bash
git clone git@github.com:zhulux/sensors_logagent.git
docker build -t sensors_logagent:v0.1 .
```

2. 运行容器
```bash
docker run -it SENSORS_HOST=xx.xx.xx.xx -v /logfile/to/path:/data/logs sensors_logagent:v0.1
```

###环境变量

- SENSORS_HOST:   数据分析系统地址
- SENSORS_PORT：  【可选项】分析系统port，默认8006
