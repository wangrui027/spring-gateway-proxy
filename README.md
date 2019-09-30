# spring-gateway-proxy

本程序基于`Spring Cloud Gateway`实现路由转发，达到HTTP请求代理的目的，最终应用场景则是代理`google`，实现翻墙。

Dockerfile：

```bash
FROM wangrui027/jre:8u212

WORKDIR /root

ADD app/spring-gateway-proxy-1.0.0.jar spring-gateway-proxy-1.0.0.jar

ENV proxy.url https://www.google.com

EXPOSE 8080

CMD java -jar spring-gateway-proxy-1.0.0.jar
```



容器使用：

建议注册一个Docker账号，上Play with Docker [https://labs.play-with-docker.com/](https://labs.play-with-docker.com/)，Docker运行环境都给你准备好了，直接运行容器代理google简直不要太友好。

1、默认代理google：

```bash
docker run -dP wangrui027/spring-gateway-proxy
```

取得容器的8080端口对外映射的宿主端口，访问`http://ip:port`则实现google代理访问



2、指定代理的网址（以baidu为例）：

```bash
docker run -dP -e proxy.url=https://www.baidu.com wangrui027/spring-gateway-proxy
```

取得容器的8080端口对外映射的宿主端口，访问`http://ip:port`则实现baidu代理访问



对于一些网站（jd、taobao、v2ex等）应当是检测到访问地址不是官网域名，将浏览器地址进行了重定向，无法正常代理。