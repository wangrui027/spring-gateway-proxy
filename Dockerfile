FROM wangrui027/jre:8u212

WORKDIR /root

ADD app/spring-gateway-proxy-1.0.0.jar spring-gateway-proxy-1.0.0.jar

ENV proxy.url https://www.google.com

EXPOSE 8080

CMD java -jar spring-gateway-proxy-1.0.0.jar
